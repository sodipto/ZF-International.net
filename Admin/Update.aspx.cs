using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Update : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
   // MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    string rcv_passport_no;
    string path;
    string ss;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["passportno"]==null)
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


    public bool image_Check()
    {

      string constring = "server=localhost;database=zfinternational;uid=root;pwd=;"; // chage here
       // string constring = "server=localhost;database=zfinternational;uid=zf;pwd=12345;"; // chage here
        MySqlConnection con = new MySqlConnection(constring);
        MySqlCommand cmd = new MySqlCommand("Select * from passenger where 	image='" + p_image.FileName + "' ", con);
        // cmd.Parameters.AddWithValue("@ClassName", this.Class_textBox.Text);
        con.Open();
        int TotalRows = 0;
        TotalRows = Convert.ToInt32(cmd.ExecuteScalar());
        if (TotalRows > 0)
        {
            //  MessageBox.Show("This class Already exist");

            Response.Write("<script> alert('Error same image name change image name');</script>");
            return true;
        }
        else
        {
            return false;
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
            Birth.Text = r4.GetString("Birth").ToString();

            Expiry_Date.Text = r4.GetString("Expiry_Date").ToString();
            Passenger_Mobile.Text = r4.GetString("Passenger_Mobile").ToString();
            Married_Status.Text = r4.GetString("Married_Status").ToString();
            age.Text = r4.GetString("age").ToString();
            Medical_Status.Text = r4.GetString("Medical_Status").ToString();
            Agent_Name.Text = r4.GetString("Agent_Name").ToString();
            Agent_Mobile.Text = r4.GetString("Agent_Mobile").ToString();
            Job_Trade.Text = r4.GetString("Job_Trade").ToString();
            Company_Name.Text = r4.GetString("Company_Name").ToString();
            Remarks.Text = r4.GetString("Remarks").ToString();
            Sent_Work.Text = r4.GetString("Sent_Work").ToString();
            Receive_Work.Text = r4.GetString("Receive_Work").ToString();
            Travel_Date.Text = r4.GetString("Travel_Date").ToString();
            interview.Text = r4.GetString("interview").ToString();
            ss = r4.GetString("image").ToString();
            Image1.ImageUrl = "~/PassportImage/"+ ss;
         


        }


        cnn.Close();



    }


    //Update Information

    protected void Update_Click(object sender, EventArgs e)
    {



        if (!image_Check())
        {


          if (p_image.HasFile)
        {

            p_image.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "PassportImage/" + p_image.FileName);
            path = p_image.FileName;



                cnn.Open();

                //  MessageBox.Show("Connection Open ! ");
                MySqlCommand cmd = cnn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                // cmd.CommandText = "insert into user (name,email,password) values ('" + name.Text + "','" + email.Text + "',MD5 ('" + password.Text + "') )";
                cmd.CommandText = "update  passenger set name='" + name.Text + "',Birth='" + Birth.Text + "',Expiry_Date='" + Expiry_Date.Text + "',Passenger_Mobile='" + Passenger_Mobile.Text + "',Married_Status='" + Married_Status.SelectedItem.Value + "',age='" + age.Text + "',Medical_Status= '" + Medical_Status.Text + "',Agent_Name='" + Agent_Name.Text + "',Agent_Mobile= '" + Agent_Mobile.Text + "',Job_Trade= '" + Job_Trade.Text + "',Company_Name='" + Company_Name.Text + "',Remarks= '" + Remarks.Text + "',Sent_Work='" + Sent_Work.SelectedItem.Value + "',interview='"+interview.Text+"',Receive_Work= '" + Receive_Work.SelectedItem.Value + "',Travel_Date= '" + Travel_Date.Text + "',image='" + path + "' where Passport_No='"+rcv_passport_no+"'";
   
               

                cmd.ExecuteReader();
                cnn.Close();

                Response.Write("<script> alert('UPDATE SUCCESSFULLY with image ');</script>");
                Passenger();

            }
       
        

        else
        {

           // path = ss;

            cnn.Open();

            //  MessageBox.Show("Connection Open ! ");
            MySqlCommand cmd6 = cnn.CreateCommand();
            cmd6.CommandType = CommandType.Text;
            // cmd.CommandText = "insert into user (name,email,password) values ('" + name.Text + "','" + email.Text + "',MD5 ('" + password.Text + "') )";
            cmd6.CommandText = "update  passenger set name='" + name.Text + "',Birth='" + Birth.Text + "',Expiry_Date='" + Expiry_Date.Text + "',Passenger_Mobile='" + Passenger_Mobile.Text + "',Married_Status='" + Married_Status.SelectedItem.Value + "',age='" + age.Text + "',Medical_Status= '" + Medical_Status.Text + "',Agent_Name='" + Agent_Name.Text + "',Agent_Mobile= '" + Agent_Mobile.Text + "',Job_Trade= '" + Job_Trade.Text + "',Company_Name='" + Company_Name.Text + "',Remarks= '" + Remarks.Text + "',Sent_Work='" + Sent_Work.SelectedItem.Value + "',interview='" + interview.Text + "',Receive_Work= '" + Receive_Work.SelectedItem.Value + "',Travel_Date= '" + Travel_Date.Text + "' where Passport_No='" + rcv_passport_no + "'";



            cmd6.ExecuteReader();
            cnn.Close();

            Response.Write("<script> alert('UPDATE SUCCESSFULLY ');</script>");
            Passenger();

        }


        }
    }
}