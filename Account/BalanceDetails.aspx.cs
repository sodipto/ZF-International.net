﻿using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_BalanceDetails : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    DataTable data;
    string rcv;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           // rcv = Session["username_pass"].ToString();//Request.QueryString["Q"].ToString();

            if (Session["username_pass"] == null) {

                Response.Redirect("PassengerDetails.aspx");
            }
            Show();
            
            
        }
       
       
    }


    public void Show()
    {
       // Search.Text = rcv;

        cnn.Open();
        MySqlCommand cmd = cnn.CreateCommand();
        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "SELECT * FROM payment INNER join passenger ON payment.passportNo=passenger.Passport_No WHERE passenger.Passport_No='" + Session["username_pass"] + "' ";
        //cmd.CommandText = "SELECT * FROM payment  WHERE passportNo='" + rcv + "' ";
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
        pgitems.PageSize =50;
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

    //public void Show_Search()
    //{


    //    cnn.Open();
    //    MySqlCommand cmd1 = cnn.CreateCommand();
    //    cmd1.CommandType = CommandType.Text;

    //    cmd1.CommandText = "SELECT * FROM payment INNER join passenger ON payment.passportNo=passenger.Passport_No where payment.passportNo='" + Search.Text + "'";
    //    cmd1.ExecuteNonQuery();

    //    data = new DataTable();
    //    MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);

    //    adp.Fill(data);
    //    //GridView1.DataSource = data;
    //    // GridView1.DataBind();

    //    ////Create the PagedDataSource that will be used in paging
    //    //PagedDataSource pgitems = new PagedDataSource();
    //    //pgitems.DataSource = data.DefaultView;
    //    //pgitems.AllowPaging = true;

    //    ////Control page size from here 
    //    //pgitems.PageSize = 4;
    //    //pgitems.CurrentPageIndex = PageNumber;
    //    //if (pgitems.PageCount > 1)
    //    //{
    //    //    rptPaging.Visible = true;
    //    //    ArrayList pages = new ArrayList();
    //    //    for (int i = 0; i <= pgitems.PageCount - 1; i++)
    //    //    {
    //    //        pages.Add((i + 1).ToString());
    //    //    }
    //    //    rptPaging.DataSource = pages;
    //    //    rptPaging.DataBind();
    //    //}
    //    //else
    //    //{
    //    //    rptPaging.Visible = false;
    //    //}

    //    //Finally, set the datasource of the repeater
    //    // RepCourse.DataSource = pgitems;
    //    // RepCourse.DataBind();


    //    R1.DataSource = data;
    //    R1.DataBind();


    //    cnn.Close();



    //}


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




    //protected void Search_Button_Click(object sender, EventArgs e)
    //{
    //    Show_Search();
    //}
    //protected void Refresh_Click(object sender, EventArgs e)
    //{
    //    Show();
    //    Search.Text = "";

    //}


    //protected void Export_Button_Click1(object sender, EventArgs e)
    //{
    //    Response.Clear();
    //    Response.Buffer = true;
    //    Response.ContentType = "application/vnd.ms-excel";
    //    //  Response.ContentType = "application/ms-word";  // for word
    //    //  Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    //    Response.AddHeader("content-disposition", "attachment;filename=BackupFile.xls");
    //    Response.Charset = "";
    //    this.EnableViewState = false;

    //    System.IO.StringWriter sw = new System.IO.StringWriter();
    //    System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);

    //    R1.RenderControl(htw);

    //    Response.Write(sw.ToString());
    //    Response.End();
    //}




    private void BindFiles()
    {
        DirectoryInfo di = new DirectoryInfo("C:/");
        R1.DataSource = di.GetFiles();
        R1.DataBind();
    }
    
}