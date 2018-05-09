using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserTypeList : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    //MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    DataTable data;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
        }
    }


   

    public void Show_Search()
    {

        if (UserTable.SelectedItem.Value == "Accounter")
        {
            cnn.Open();
            MySqlCommand cmd1 = cnn.CreateCommand();
            cmd1.CommandType = CommandType.Text;

            cmd1.CommandText = "SELECT *FROM  account ";
            cmd1.ExecuteNonQuery();

            data = new DataTable();
            MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);

            adp.Fill(data);


            R1.DataSource = data;
            R1.DataBind();


            cnn.Close();

        }

        else {

            cnn.Open();
            MySqlCommand cmd = cnn.CreateCommand();
            cmd.CommandType = CommandType.Text;

            cmd.CommandText = "SELECT *FROM dataentry ";
            cmd.ExecuteNonQuery();

            data = new DataTable();
            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);

            adp.Fill(data);


            R1.DataSource = data;
            R1.DataBind();


            cnn.Close();
        
        
        
        
        
        }

    }


  




    protected void Search_Button_Click(object sender, EventArgs e)
    {
        Show_Search();
    }







    protected void UserTable_SelectedIndexChanged(object sender, EventArgs e)
    {
        
            //cnn.Open();
            //MySqlCommand cmd1 = cnn.CreateCommand();
            //cmd1.CommandType = CommandType.Text;

            //cmd1.CommandText = "SELECT id,name,email FROM  account ";
            //cmd1.ExecuteNonQuery();

            //data = new DataTable();
            //MySqlDataAdapter adp = new MySqlDataAdapter(cmd1);

            //adp.Fill(data);


            //R1.DataSource = data;
            //R1.DataBind();


            //cnn.Close();

       

       

   



    }



    protected void Edit_Click(object sender, EventArgs e)
    {
        string var="";
        //Response.Redirect("BalanceDetails.aspx?Q=" + Passport_No.Text);


        if (UserTable.SelectedItem.Value == "Accounter")
        {

        LinkButton btn = (LinkButton)(sender);
        string Userid = btn.CommandArgument;


     

        cnn.Open();
        MySqlCommand cmd3 = cnn.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        MySqlDataReader r4;

        cmd3.CommandText = "SELECT *from account where id='" + Userid + "'";
        r4 = cmd3.ExecuteReader();

        while (r4.Read())
        {

            var = r4.GetString("name").ToString();
        }





        Session["Userid"] = Userid;
        Session["name"] = var;
        Response.Redirect("UserTypeEdit.aspx");

    }


        else{


            LinkButton btn = (LinkButton)(sender);
            string Userid = btn.CommandArgument;

            cnn.Open();
            MySqlCommand cmd3 = cnn.CreateCommand();
            cmd3.CommandType = CommandType.Text;
            MySqlDataReader r4;

            cmd3.CommandText = "SELECT *from dataentry where id='"+Userid+"'";
            r4 = cmd3.ExecuteReader();

            while(r4.Read()){

                var=r4.GetString("name").ToString();
            }





            Session["Userid"] = Userid;
            Session["name"] = var;
            Response.Redirect("UserTypeEdit.aspx");
        
        
        
        
        }

    }


}