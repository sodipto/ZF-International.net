using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserTypeEdit : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    //MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");

    string rcv_id;
    string rcv_name;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userid"]== null && Session["name"] == null)
        {
            Response.Redirect("../Default.aspx");

        }

        else {


            rcv_id = Session["userid"].ToString();
            rcv_name = Session["name"].ToString();

            if (!IsPostBack)
            {
                show();
            }
        
        }
      
       
    }


    public void show() {


        if (rcv_name == "Accounter")
        {


            cnn.Open();

         

            MySqlCommand cmd = cnn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select *from account where id='" + rcv_id + "'";

            MySqlDataReader r1;
            r1 = cmd.ExecuteReader();

            while (r1.Read())
            {


                name.Text = r1.GetString("name").ToString();
                email.Text = r1.GetString("email").ToString();
                password.Text = r1.GetString("password").ToString();




            }

        }
        else {




            cnn.Open();

            //cmd3.CommandType = CommandType.Text;

            //cmd3.CommandText = "select *from  accountuser where passport='" + SearchTextbox.Text + "'";

            MySqlCommand cmd5 = cnn.CreateCommand();
            cmd5.CommandType = CommandType.Text;
            cmd5.CommandText = "select *from dataentry where id='" + rcv_id + "'";

            MySqlDataReader r6;
            r6 = cmd5.ExecuteReader();

            while (r6.Read())
            {


                name.Text = r6.GetString("name").ToString();
                email.Text = r6.GetString("email").ToString();
                password.Text = r6.GetString("password").ToString();




            }
        
        
        
        
        }


        cnn.Close();



    
    
    
    
    
    
    }







    protected void Update_User_Click(object sender, EventArgs e)
    {


        if (name.Text == "Accounter")
        {

            cnn.Open();


            MySqlCommand cmd1 = cnn.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "update account set email='"+email.Text+"',password='"+password.Text+"' where id='" + rcv_id + "'";

            
            cmd1.ExecuteReader();

            Response.Write("<script> alert('Update Suucessfully');</script>");

            cnn.Close();
            show();



        }

        else {


            cnn.Open();


            MySqlCommand cmd2 = cnn.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "update dataentry set email='" + email.Text + "',password='" + password.Text + "' where id='" + rcv_id + "'";


            cmd2.ExecuteReader();

            Response.Write("<script> alert('Update Suucessfully');</script>");

            cnn.Close();

            show();
        
        }




    }
}