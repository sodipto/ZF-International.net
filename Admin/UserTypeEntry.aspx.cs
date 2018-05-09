using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserTypeEntry : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    // MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    string msg2 = "REgistered Successfully";
    string msg3 = "This Email Already Exist";
    string msg1 = "Select User Type";
    String guid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
        
        
        }
       guid = Guid.NewGuid().ToString();
        name.ReadOnly = true;
    }

    //textbox clear
    public void clear() {


        name.Text = "";
        password.Text = "";
        confirm.Text = "";
        email.Text = "";
        name.ReadOnly = true;
    
    
    }

    public bool Email_Check()
    {

        string constring = "server=localhost;database=zfinternational;uid=root;pwd=;"; // chage here
        // string constring = "server=localhost;database=zfinternational;uid=zf;pwd=12345;";
        MySqlConnection con = new MySqlConnection(constring);
        MySqlCommand cmd = new MySqlCommand("Select * from admin where 	email='" + email.Text + "' ", con);
        // cmd.Parameters.AddWithValue("@ClassName", this.Class_textBox.Text);
        con.Open();
        int TotalRows = 0;
        TotalRows = Convert.ToInt32(cmd.ExecuteScalar());
        if (TotalRows > 0)
        {
            //  MessageBox.Show("This class Already exist");

            Response.Write("<script> alert('Error:" + msg3 + " ');</script>");
            return true;
        }
        else
        {
            return false;
        }
    }


    protected void RegisterUser_Click(object sender, EventArgs e)
    {

        if (user.SelectedItem.Value == "Select User Type")
        {

            Response.Write("<script> alert('Notification:" + msg1 + " ');</script>");
        }

        else
        {
            //Admin entry
            if (user.SelectedItem.Value == "Admin")
            {
                if (!Email_Check())
                
                {
                    try
                    {



                        cnn.Open();

                        MySqlCommand cmd = cnn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "insert into admin (name,email,password,guid) values ('" + name.Text + "','" + email.Text + "',MD5 ('" + password.Text + "'),'" + guid + "' )";



                        cmd.ExecuteReader();






                        Response.Write("<script> alert('Notification:" + msg2 + " ');</script>");
                        clear();


                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                }
            }


     //account user
            else if (user.SelectedItem.Value == "Accounter")
            {

                try
                {

                    cnn.Open();

                    MySqlCommand cmd = cnn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into account (name,email,password) values ('" + name.Text + "','" + email.Text + "','" + password.Text + "')";



                    cmd.ExecuteReader();






                    Response.Write("<script> alert('Notification:" + msg2 + " ');</script>");

                    clear();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }






            }


    //Dataentry
            else
            {

                try
                {

                    cnn.Open();

                    MySqlCommand cmd = cnn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into dataentry (name,email,password) values ('" + name.Text + "','" + email.Text + "','" + password.Text + "' )";



                    cmd.ExecuteReader();






                    Response.Write("<script> alert('Notification:" + msg2 + " ');</script>");
                    clear();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }


            }



        }
    }

    protected void user_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (user.SelectedItem.Value == "Accounter")
        {
            name.ReadOnly = true;
            name.Text = user.SelectedItem.Value;


        }

        else if (user.SelectedItem.Value == "DataEntry")
        {
            name.ReadOnly = true;
            name.Text = user.SelectedItem.Value;


        }


        else {

            name.ReadOnly = false;
            name.Text = "";
        }
        

        
    }
}