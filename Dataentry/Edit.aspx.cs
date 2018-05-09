using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dataentry_Edit : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    // MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    string rcv_passport_no;
    string path;
    string ss;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["passportno"] == null && Session["username"] == null)
        {
            Response.Redirect("~/Default.aspx");

        }
        else
        {
            rcv_passport_no = Session["passportno"].ToString();
            if (!Page.IsPostBack)
            {
                Passenger();
            }

        }
    }



    public void Passenger()
    {
        //p_id.Enabled = false;  

        cnn.Open();
        MySqlCommand cmd1 = cnn.CreateCommand();
        cmd1.CommandType = CommandType.Text;

        cmd1.CommandText = "select *from passenger where Passport_No='" + rcv_passport_no + "' ";
        MySqlDataReader r4;

        r4 = cmd1.ExecuteReader();

        while (r4.Read())
        {
            Passport_No.Text = r4.GetString("Passport_No").ToString();
            name.Text = r4.GetString("name").ToString();
            
            Job_Trade.Text = r4.GetString("Job_Trade").ToString();
           
            Sent_Work.Text = r4.GetString("Sent_Work").ToString();
           



        }


        cnn.Close();



    }


    //Update Information

    protected void Update_Click(object sender, EventArgs e)
    {







                cnn.Open();

                //  MessageBox.Show("Connection Open ! ");
                MySqlCommand cmd6 = cnn.CreateCommand();
                cmd6.CommandType = CommandType.Text;
                // cmd.CommandText = "insert into user (name,email,password) values ('" + name.Text + "','" + email.Text + "',MD5 ('" + password.Text + "') )";
                cmd6.CommandText = "update  passenger set  Sent_Work='" + Sent_Work.SelectedItem.Value + "'  where Passport_No='" + rcv_passport_no + "' ";



                cmd6.ExecuteReader();
                cnn.Close();

                Response.Write("<script> alert('UPDATE SUCCESSFULLY ');</script>");
                Response.Redirect("SentPermitEdit.aspx");
                Passenger();

           


        }
    
}