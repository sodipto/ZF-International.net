using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login_Button_Click(object sender, EventArgs e)
    {


        //Admin
        if (user.SelectedItem.Value == "Admin")
        {
            try
            {
                cnn.Open();


                MySqlCommand cmd = cnn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                MySqlDataReader myreader;

                cmd.CommandText = "select *from admin where email='" + email.Text + "' and password= MD5('" + password.Text + "') ";



                myreader = cmd.ExecuteReader();


                int count = 0;
                while (myreader.Read())
                {

                    count += 1;


                }


                if (count == 1)
                {
                    Session["username"] = email.Text;

                    Response.Redirect("Admin/PassengerDetails.aspx");
                    // Label1.Text = "Login Successfully";



                }




                else
                {

                    Wrong_password.Text = "Username  or password  Incorrect";

                }








            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        //Accounter
        else if (user.SelectedItem.Value == "Accounter")
        {
            try
            {
                cnn.Open();


                MySqlCommand cmd = cnn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                MySqlDataReader myreader;

                cmd.CommandText = "select *from account where email='" + email.Text + "' and password='" + password.Text + "' ";



                myreader = cmd.ExecuteReader();


                int count = 0;
                while (myreader.Read())
                {

                    count += 1;


                }


                if (count == 1)
                {
                    Session["username"] = email.Text;

                    Response.Redirect("Account/PassengerDetails.aspx");
                    // Label1.Text = "Login Successfully";



                }




                else
                {

                    Wrong_password.Text = "Username  or password  Incorrect";
                    //g

                }








            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }


        //Data Entry User
        else
        {




            try
            {
                cnn.Open();


                MySqlCommand cmd = cnn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                MySqlDataReader myreader;

                cmd.CommandText = "select *from dataentry where email='" + email.Text + "' and password= '" + password.Text + "' ";



                myreader = cmd.ExecuteReader();


                int count = 0;
                while (myreader.Read())
                {

                    count += 1;


                }


                if (count == 1)
                {
                    Session["username"] = email.Text;

                    Response.Redirect("Dataentry/UserEntry.aspx");
                    // Label1.Text = "Login Successfully";



                }




                else
                {

                    Wrong_password.Text = "Wrong_password  or password  Incorrect";

                }









            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }







        }
    }

    protected void forgotpassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("ResetPassword.aspx");
    }
}
