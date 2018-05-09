using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration_UserEntry : System.Web.UI.Page
{
    string path;
    string msg = "This Passport or image name Already Exist,Change This";
    string msg2 = "Insert Successfully";

    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    //MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public void clear()
    {

        Job_Trade.Text = "";
        Company_Name.Text = "";
        name.Text = "";
        Passport_No.Text = "";
        Expiry_Date.Text = "";
        Birth.Text = "";
        Passenger_Mobile.Text = "";
        age.Text = "";
        Medical_Status.Text = "";
        interview.Text = "";
        Agent_Name.Text = "";
        Agent_Mobile.Text = "";
        Travel_Date.Text = "Pending";
        Remarks.Text = "";




    }

    //Passport no checck
    public bool Passport_Check()
    {

       string constring = "server=localhost;database=zfinternational;uid=root;pwd=;"; // chage here
       // string constring = "server=localhost;database=zfinternational;uid=zf;pwd=12345;";
        MySqlConnection con = new MySqlConnection(constring);
        MySqlCommand cmd = new MySqlCommand("Select * from passenger where 	Passport_No='" + Passport_No.Text + "' ", con);
        // cmd.Parameters.AddWithValue("@ClassName", this.Class_textBox.Text);
        con.Open();
        int TotalRows = 0;
        TotalRows = Convert.ToInt32(cmd.ExecuteScalar());
        if (TotalRows > 0)
        {
            //  MessageBox.Show("This class Already exist");

            Response.Write("<script> alert('Error:" + msg + " ');</script>");
            return true;
        }
        else
        {
            return false;
        }
    }



//image check


    public bool image_Check()
    {

        string constring = "server=localhost;database=zfinternational;uid=root;pwd=;"; // chage here
        // string constring = "server=localhost;database=zfinternational;uid=zf;pwd=12345;";
        MySqlConnection con = new MySqlConnection(constring);
        MySqlCommand cmd = new MySqlCommand("Select * from passenger where 	image='" + p_image.FileName + "' ", con);
        // cmd.Parameters.AddWithValue("@ClassName", this.Class_textBox.Text);
        con.Open();
        int TotalRows = 0;
        TotalRows = Convert.ToInt32(cmd.ExecuteScalar());
        if (TotalRows > 0)
        {
            //  MessageBox.Show("This class Already exist");

            Response.Write("<script> alert('Error:" + msg + " ');</script>");
            return true;
        }
        else
        {
            return false;
        }
    }






 protected void Register_Click(object sender, EventArgs e)
   {

     //if (!image_Check())
     // {

     if (!Passport_Check() && !image_Check())
      {
        if (p_image.HasFile)
        {

            p_image.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "PassportImage/" + p_image.FileName);
            path = p_image.FileName;

        }


        

            try
            {

                //end code


                cnn.Open();

                //  MessageBox.Show("Connection Open ! ");
                MySqlCommand cmd = cnn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                // cmd.CommandText = "insert into user (name,email,password) values ('" + name.Text + "','" + email.Text + "',MD5 ('" + password.Text + "') )";
                cmd.CommandText = "insert into passenger (name,	Birth,Passport_No,Expiry_Date,Passenger_Mobile,Married_Status,age,Medical_Status,Agent_Name,Agent_Mobile,Job_Trade,Company_Name,Remarks,Sent_Work,interview,Receive_Work,Travel_Date,	image) values ('" + name.Text + "','" + Birth.Text + "','" + Passport_No.Text + "','" + Expiry_Date.Text + "','" + Passenger_Mobile.Text + "','" + Married_Status.SelectedItem.Value + "','" + age.Text + "','" + Medical_Status.Text + "','" + Agent_Name.Text + "','" + Agent_Mobile.Text + "','" + Job_Trade.Text + "','" + Company_Name.Text + "','" + Remarks.Text + "','" + Sent_Work.SelectedItem.Value + "','"+interview.Text+"','" + Receive_Work.SelectedItem.Value + "','" + Travel_Date.Text + "','" + path + "')";
                // MySqlDataReader dr =  //data excute variable

                cmd.ExecuteReader();




                cnn.Close();

                //Accountuser table
                cnn.Open();

                //  MessageBox.Show("Connection Open ! ");
                MySqlCommand cmd1 = cnn.CreateCommand();
                cmd1.CommandType = CommandType.Text;
                // cmd.CommandText = "insert into user (name,email,password) values ('" + name.Text + "','" + email.Text + "',MD5 ('" + password.Text + "') )";
                cmd1.CommandText = "insert into accountuser (passport,Total_Balance) values ('" + Passport_No.Text + "','" +0+ "')";
                // MySqlDataReader dr =  //data excute variable

                cmd1.ExecuteReader();




                cnn.Close();



              //  Response.Redirect("~/Login.aspx");

                Response.Write("<script> alert('Notification:" + msg2 + " ');</script>");
             clear();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }




    }



    //BackHome_Click

    protected void BackHome_Click(object sender, EventArgs e)
    {

         
       // Response.Redirect("../Admin/PassengerDetails.aspx");
        Response.Redirect("../Admin/PassengerDetails.aspx");


    }
}