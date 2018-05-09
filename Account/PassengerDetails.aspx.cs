using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_PassengerDetails : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    DataTable data;
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton1.Visible = false;
        
    }

    public void c() {


        if (Passport_No.Text == "")
        {
            LinkButton1.Visible = false;
        }

        else {
            LinkButton1.Visible = true;
        }


    }

    //Search here
    protected void Search_Button_Click(object sender, EventArgs e)
    {
        string pass = "";

        cnn.Open();
        MySqlCommand cmd3 = cnn.CreateCommand();


        cmd3.CommandType = CommandType.Text;

        cmd3.CommandText = "select *from  passenger where Passport_No='" + SearchTextbox.Text + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        MySqlDataReader r3;

        r3 = cmd3.ExecuteReader();



        while (r3.Read())
        {
            pass = r3.GetString("Passport_No").ToString();



        }




        cnn.Close();

        if (pass != SearchTextbox.Text)
        {

            //Name.Text = "";
            //Passport.Text = "";
            //Passport_label.Text = "";
            //Balance_label.Text = "0";

                Passport_No.Text = "";
                name.Text = "";
                Birth.Text = "";
               
                Expiry_Date.Text = "";
                Passenger_Mobile.Text = "";
                Married_Status.Text = "";
                age.Text = "";
                Medical_Status.Text = "";
                Agent_Name.Text = "";
                Agent_Mobile.Text = "";
                Job_Trade.Text = "";
                Company_Name.Text = "";
                Remarks.Text = "";
                Sent_Work.Text = "";
                Receive_Work.Text = "";
                Travel_Date.Text = "";
                T_Balance.Text = "";
                interview.Text = "";
              //  SearchTextbox.Text = "";

        }

        //value show in textbox


        cnn.Open();
        MySqlCommand cmd4 = cnn.CreateCommand();


        cmd4.CommandType = CommandType.Text;

        cmd4.CommandText = "SELECT * FROM passenger INNER join accountuser ON passenger.Passport_No=accountuser.passport where passenger.Passport_No='" + SearchTextbox.Text + "' or passenger.name='" + SearchTextbox.Text + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        MySqlDataReader r4;

        r4 = cmd4.ExecuteReader();



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

                T_Balance.Text = r4.GetString("Total_Balance").ToString();
                interview.Text = r4.GetString("interview").ToString();

            

        }




        cnn.Close();

        c();




    }
    protected void Clear_button_Click(object sender, EventArgs e)
    {
        Passport_No.Text = "";
        name.Text = "";
        Birth.Text = "";

        Expiry_Date.Text = "";
        Passenger_Mobile.Text = "";
        Married_Status.Text = "";
        age.Text = "";
        Medical_Status.Text = "";
        Agent_Name.Text = "";
        Agent_Mobile.Text = "";
        Job_Trade.Text = "";
        Company_Name.Text = "";
        Remarks.Text = "";
        Sent_Work.Text = "";
        Receive_Work.Text = "";
        Travel_Date.Text = "";
        T_Balance.Text = "";
       SearchTextbox.Text = "";
       interview.Text = "";
    }

    protected void BalanceDetails_Click(object sender, EventArgs e)
    {
        //Response.Redirect("BalanceDetails.aspx?Q=" + Passport_No.Text);
        Session["username_pass"] = Passport_No.Text;
        Response.Redirect("BalanceDetails.aspx");
      
    }

   
}