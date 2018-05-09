using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ALLPaymentListEdit : System.Web.UI.Page
{
   MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
  //  MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");

    DataTable data;
    string passport_value;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Show();
        }
    }


    public void Show()
    {


        cnn.Open();
        MySqlCommand cmd = cnn.CreateCommand();
        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "SELECT * FROM payment INNER join passenger ON payment.passportNo=passenger.Passport_No order by sr desc";//WHERE payment.passportNo='"++"';
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
        pgitems.PageSize =200;
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

        cmd1.CommandText = "SELECT * FROM payment INNER join passenger ON payment.passportNo=passenger.Passport_No where payment.passportNo='" + TextBox1.Text + "' or payment.T_Date='" + TextBox1.Text + "' ";
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
        TextBox1.Text = "";

    }


    protected void Export_Button_Click1(object sender, EventArgs e)
    {
        //Response.Clear();
        //Response.Buffer = true;
        //Response.ContentType = "application/vnd.ms-excel";
        ////  Response.ContentType = "application/ms-word";  // for word
        ////  Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //Response.AddHeader("content-disposition", "attachment;filename=BackupFile.xls");
        //Response.Charset = "";
        //this.EnableViewState = false;

        //System.IO.StringWriter sw = new System.IO.StringWriter();
        //System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);

        //R1.RenderControl(htw);

        //Response.Write(sw.ToString());
        //Response.End();
    }


    protected void EditLinkBtn_Click(object sender, EventArgs e)
    {

        LinkButton btn = (LinkButton)(sender);
        string Payment_sr = btn.CommandArgument;
      //  string passport_NO=



        cnn.Open();
        MySqlCommand cmd3 = cnn.CreateCommand();


        cmd3.CommandType = CommandType.Text;

        cmd3.CommandText = "select *from  payment where sr='" + Payment_sr + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        MySqlDataReader r3;

        r3 = cmd3.ExecuteReader();



        while (r3.Read())
        {
            passport_value = r3.GetString("passportNo").ToString();



        }

        cnn.Close();






















        // do what you need here

        Session["sr"] = Payment_sr;
        Session["passportno"] = passport_value;

        //Response.Redirect("Admin/ProductUpdate.aspx?id="+yourValue);
         Response.Redirect("BalanceEdit.aspx");
    }

   
}