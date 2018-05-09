using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_WithdrawPayment : System.Web.UI.Page
{
 //   MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    //string date_time;
    protected void Page_Load(object sender, EventArgs e)
    {
        //date_time = DateTime.Today.ToString("dd-MM-yyyy");
    }

    //Passport no checck
    public bool Passport_Check()
    {

       // string constring = "server=localhost;database=zfinternational;uid=root;pwd=;"; // chage here
        string constring = "server=localhost;database=zfinternational;uid=zf;pwd=12345;"; // chage here
        MySqlConnection con = new MySqlConnection(constring);
        MySqlCommand cmd = new MySqlCommand("Select * from  accountuser where passport='" + Passport.Text + "' ", con);
        // cmd.Parameters.AddWithValue("@ClassName", this.Class_textBox.Text);
        con.Open();
        int TotalRows = 0;
        TotalRows = Convert.ToInt32(cmd.ExecuteScalar());
        if (TotalRows > 0)
        {
            //  MessageBox.Show("This class Already exist");

            //  Response.Write("<script> alert('Error:" + msg + " ');</script>");
            return true;
        }
        else
        {
            return false;
        }
    }


    public void clear()
    {

        Name.Text = "";
        Balance_label.Text = "0";
        SearchTextbox.Text = "";
        Passport.Text = "";
        Passport_label.Text = "";
        Balance.Text = "";
        Label1.Text = "";
        date_time.Text = "";
        jobtrade.Text = "";
        agentname.Text = "";
        company.Text = "";
        Birth.Text = "";
        pasport_expiry.Text = "";

    }



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

            Name.Text = "";
            Passport.Text = "";
            Passport_label.Text = "";
            Balance_label.Text = "0";
            jobtrade.Text = "";
            agentname.Text = "";
            company.Text = "";
            Birth.Text = "";
            pasport_expiry.Text = "";



        }


        // condition passport exist or not




        cnn.Open();
        MySqlCommand cmd = cnn.CreateCommand();


        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "select *from  passenger where Passport_No='" + SearchTextbox.Text + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        MySqlDataReader r1;

        r1 = cmd.ExecuteReader();



        while (r1.Read())
        {
            Name.Text = r1.GetString("name").ToString();
            Birth.Text = r1.GetString("Birth").ToString();
            Passport_label.Text = r1.GetString("Passport_No").ToString();
            jobtrade.Text = r1.GetString("Job_Trade").ToString();
            agentname.Text = r1.GetString("Agent_Name").ToString();
            company.Text = r1.GetString("Company_Name").ToString();
            pasport_expiry.Text = r1.GetString("Expiry_Date").ToString();



        }



        cnn.Close();
        //end


        // Total Balance Show
        cnn.Open();
        MySqlCommand cmd1 = cnn.CreateCommand();


        cmd1.CommandType = CommandType.Text;

        cmd1.CommandText = "select *from  accountuser where passport='" + SearchTextbox.Text + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        MySqlDataReader r2;

        r2 = cmd1.ExecuteReader();

        while (r2.Read())
        {

            Balance_label.Text = r2.GetString("Total_Balance").ToString();


        }
        Passport.Text = Passport_label.Text;
        cnn.Close();
        //end









    }
    protected void ClearButton_Click(object sender, EventArgs e)
    {
        Name.Text = "";
        Balance_label.Text = "0";
        SearchTextbox.Text = "";
        Passport.Text = "";
        Passport_label.Text = "";
        Balance.Text = "";
        Label1.Text = "";
        date_time.Text = "";
        jobtrade.Text = "";
        agentname.Text = "";
        company.Text = "";
        Birth.Text = "";
        pasport_expiry.Text = "";
    }


    protected void paymentButton_Click(object sender, EventArgs e)
    {

            int totlbalance=int.Parse(Balance_label.Text);
             int inputbalance=int.Parse(Balance.Text);



             if (totlbalance >= inputbalance)
             {


                 //update total Balance
                 cnn.Open();



                 MySqlCommand cmd1 = cnn.CreateCommand();
                 cmd1.CommandType = CommandType.Text;

                 cmd1.CommandText = "update accountuser set Total_Balance=Total_Balance-'" + Balance.Text + "' where passport='" + Passport.Text + "'";


                 cmd1.ExecuteNonQuery();


                 cnn.Close();


                 //end



                 //Payment Details in the Payment Table
                 cnn.Open();

                 MySqlCommand cmd2 = cnn.CreateCommand();
                 cmd2.CommandType = CommandType.Text;

                 cmd2.CommandText = "insert into withdraw (passportNo,Balance,T_Date) values ('" + Passport.Text + "','" + Balance.Text + "','" + date_time.Text + "')";


                 cmd2.ExecuteReader();

                 Response.Write("<script> alert('Withdraw Successfully');</script>");


                 cnn.Close();

                 clear();

             }

             else {

                 Response.Write("<script> alert('Balance Grater the Total balance , not withdraw');</script>");
                 Balance.Text = "";
             
             }

        //end


    }
        
}