using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reset : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    // MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    string v, guidid,email;
    string vi,guid;
    protected void Page_Load(object sender, EventArgs e)
    {
       //newpassword.Text

        if (Request.QueryString["uid"] == null)
        {
            Response.Redirect("Default.aspx");
           // Response.Write(v);
        }

        else {
            guid = Guid.NewGuid().ToString();
          
       
            if (!Page.IsPostBack)
            {
               
            }
        }
    }



    protected void resetpassword_Click(object sender, EventArgs e)
    {
        vi = Request.QueryString["uid"];
        cnn.Open();
        MySqlCommand cmd3 = cnn.CreateCommand();
        cmd3.CommandType = CommandType.Text;
        MySqlDataReader r4;

        cmd3.CommandText = "SELECT *from admin where guid='"+vi+"'";
        r4 = cmd3.ExecuteReader();

        while (r4.Read())
        {

           guidid = r4.GetString("guid").ToString();
           email = r4.GetString("email").ToString();
           
        }

        cnn.Close();


        if(vi==guidid){

           // Response.Write("match");

            cnn.Open();
            MySqlCommand cmd4 = cnn.CreateCommand();
            cmd4.CommandType = CommandType.Text;


            cmd4.CommandText = "update admin set password=md5('" + newpassword.Text + "'),guid='"+guid+"' where guid='" + vi + "'";

            cmd4.ExecuteNonQuery();

            Response.Write("<script> alert('PASSWORD RESET SUCCESSFULL');</script>");


        
        }

        else{

            Response.Redirect("Default.aspx");
        
        }





    }




}