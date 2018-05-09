using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PassengerUpdate : System.Web.UI.Page
{
   MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
   // MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    DataTable data;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["username"] == null)
        {


            Response.Redirect("~/Default.aspx");

        }

        else
        {

            if (!Page.IsPostBack)
            {
                Show();
            }

        }
    }


    public void Show()
    {


        cnn.Open();
        MySqlCommand cmd = cnn.CreateCommand();
        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "SELECT *FROM  passenger INNER join accountuser ON passenger.Passport_No=accountuser.passport order by id desc ";//WHERE payment.passportNo='"++"';
        cmd.ExecuteNonQuery();

        data = new DataTable();
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);

        adp.Fill(data);
        //GridView1.DataSource = data;
        // GridView1.DataBind();

        //Create the PagedDataSource that will be used in paging
        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = data.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 10;
        pgitems.CurrentPageIndex = PageNumber;
        if (pgitems.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rptPaging.DataSource = pages;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }

        //Finally, set the datasource of the repeater
        // RepCourse.DataSource = pgitems;
        // RepCourse.DataBind();


        R1.DataSource = pgitems;
        R1.DataBind();


        cnn.Close();



    }

    public void Show_Search()
    {


        cnn.Open();
        MySqlCommand cmd1 = cnn.CreateCommand();
        cmd1.CommandType = CommandType.Text;

        cmd1.CommandText = "SELECT *FROM  passenger INNER join accountuser ON passenger.Passport_No=accountuser.passport  where  passenger.Passport_No='" + SearchTextbox.Text + "' or passenger.name='" + SearchTextbox.Text + "'  or passenger.Agent_Name='" + SearchTextbox.Text + "'  or passenger.Job_Trade='" + SearchTextbox.Text + "' or passenger.Company_Name='" + SearchTextbox.Text + "' or passenger.Sent_Work='" + SearchTextbox.Text + "' or  passenger.Travel_Date	='" + SearchTextbox.Text + "'";
        cmd1.ExecuteNonQuery();

        data = new DataTable();
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);

        adp.Fill(data);
        //GridView1.DataSource = data;
        // GridView1.DataBind();

        ////Create the PagedDataSource that will be used in paging
        //PagedDataSource pgitems = new PagedDataSource();
        //pgitems.DataSource = data.DefaultView;
        //pgitems.AllowPaging = true;

        ////Control page size from here 
        //pgitems.PageSize = 4;
        //pgitems.CurrentPageIndex = PageNumber;
        //if (pgitems.PageCount > 1)
        //{
        //    rptPaging.Visible = true;
        //    ArrayList pages = new ArrayList();
        //    for (int i = 0; i <= pgitems.PageCount - 1; i++)
        //    {
        //        pages.Add((i + 1).ToString());
        //    }
        //    rptPaging.DataSource = pages;
        //    rptPaging.DataBind();
        //}
        //else
        //{
        //    rptPaging.Visible = false;
        //}

        //Finally, set the datasource of the repeater
        // RepCourse.DataSource = pgitems;
        // RepCourse.DataBind();


        R1.DataSource = data;
        R1.DataBind();


        cnn.Close();



    }


    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
            {
                return Convert.ToInt32(ViewState["PageNumber"]);
            }
            else
            {
                return 0;
            }
        }
        set { ViewState["PageNumber"] = value; }
    }



    //This method will fire when clicking on the page no link from the pager repeater
    protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        Show();
    }




    protected void Search_Button_Click(object sender, EventArgs e)
    {
        Show_Search();
    }
    protected void Refresh_Click(object sender, EventArgs e)
    {
        Show();
        SearchTextbox.Text = "";

    }


    protected void Home_Button_Click1(object sender, EventArgs e)
    {
        Response.Redirect("PassengerDetails.aspx");
    }




    //private void BindFiles()
    //{
    //    DirectoryInfo di = new DirectoryInfo("C:/");
    //    R1.DataSource = di.GetFiles();
    //    R1.DataBind();
    //}


    //protected void DeleteLinkBtn_Click(object sender, EventArgs e)
    //{
    //    //LinkButton btn = (LinkButton)(sender);
    //    //string Product_id_delete = btn.CommandArgument;

    //    //cnn.Open();
    //    //MySqlCommand cmd8 = cnn.CreateCommand();
    //    //cmd8.CommandType = CommandType.Text;

    //    //cmd8.CommandText = "delete from product where product_ID='" + Product_id_delete + "'";
    //    //cmd8.ExecuteNonQuery();




    //    //cnn.Close();
    //    //Show();

    //}
    protected void EditLinkBtn_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string passport_NO = btn.CommandArgument;
        // do what you need here

        Session["passportno"] = passport_NO;

        //Response.Redirect("Admin/ProductUpdate.aspx?id="+yourValue);
        Response.Redirect("Update.aspx");
    }

    protected void BalanceDetails_Click(object sender, EventArgs e)
    {
        //Response.Redirect("BalanceDetails.aspx?Q=" + Passport_No.Text);

        LinkButton btn = (LinkButton)(sender);
        string passport_no = btn.CommandArgument;
        Session["passport_no"] = passport_no;
        Response.Redirect("BalanceDetails.aspx");

    }
}