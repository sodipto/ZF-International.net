using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_BalanceEdit : System.Web.UI.Page
{
   MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
   // MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");

    string rcv_sr_no;
    string passport_no;
    string Bal_sum;
    protected void Page_Load(object sender, EventArgs e)
    {



     rcv_sr_no = Session["sr"].ToString();
     passport_no = Session["passportno"].ToString();

      


      if (!IsPostBack) {
          BalanceShow();
      
      }


    }

    //Passport no checck
    public bool Passport_Check()
    {

      string constring = "server=localhost;database=zfinternational;uid=root;pwd=;"; // chage here
       // string constring = "server=localhost;database=zfinternational;uid=zf;pwd=12345;"; // chage here
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


    //public void clear()
    //{

    //    Name.Text = "";
    //    Balance_label.Text = "0";
    //    // SearchTextbox.Text = "";
    //    Passport.Text = "";
    //    Passport_label.Text = "";
    //    Balance.Text = "";
    //    Label1.Text = "";
    //    date_time.Text = "";

    //}



    //protected void Search_Button_Click(object sender, EventArgs e)
    //{
    //    string pass = "";

    //    cnn.Open();
    //    MySqlCommand cmd3 = cnn.CreateCommand();


    //    cmd3.CommandType = CommandType.Text;

    //    cmd3.CommandText = "select *from  passenger where Passport_No='" + SearchTextbox.Text + "'";
    //    //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


    //    MySqlDataReader r3;

    //    r3 = cmd3.ExecuteReader();



    //    while (r3.Read())
    //    {
    //        pass = r3.GetString("Passport_No").ToString();



    //    }




    //    cnn.Close();

    //    if (pass != SearchTextbox.Text)
    //    {

    //        Name.Text = "";
    //        Passport.Text = "";
    //        Passport_label.Text = "";
    //        Balance_label.Text = "0";



    //    }


    //    // condition passport exist or not




    //    cnn.Open();
    //    MySqlCommand cmd = cnn.CreateCommand();


    //    cmd.CommandType = CommandType.Text;

    //    cmd.CommandText = "select *from  passenger where Passport_No='" + SearchTextbox.Text + "'";
    //    //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


    //    MySqlDataReader r1;

    //    r1 = cmd.ExecuteReader();



    //    while (r1.Read())
    //    {
    //        Passport_label.Text = r1.GetString("Passport_No").ToString();
    //        Name.Text = r1.GetString("name").ToString();



    //    }



    //    cnn.Close();
    //    //end


    //    // Total Balance Show
    //    cnn.Open();
    //    MySqlCommand cmd1 = cnn.CreateCommand();


    //    cmd1.CommandType = CommandType.Text;

    //    cmd1.CommandText = "select *from  accountuser where passport='" + SearchTextbox.Text + "'";
    //    //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


    //    MySqlDataReader r2;

    //    r2 = cmd1.ExecuteReader();

    //    while (r2.Read())
    //    {

    //        Balance_label.Text = r2.GetString("Total_Balance").ToString();


    //    }
    //    Passport.Text = Passport_label.Text;
    //    cnn.Close();
    //    //end









    //}
    //protected void ClearButton_Click(object sender, EventArgs e)
    //{
    //    Name.Text = "";
    //    Balance_label.Text = "0";
    //    SearchTextbox.Text = "";
    //    Passport.Text = "";
    //    Passport_label.Text = "";
    //    Balance.Text = "";
    //    Label1.Text = "";
    //    date_time.Text = "";
    //}



    public void BalanceShow() {

        cnn.Open();
        MySqlCommand cmd = cnn.CreateCommand();


        cmd.CommandType = CommandType.Text;

        cmd.CommandText = "select *from  passenger where Passport_No='" + passport_no + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        MySqlDataReader r1;

        r1 = cmd.ExecuteReader();



        while (r1.Read())
        {
            Passport_label.Text = r1.GetString("Passport_No").ToString();
            Name.Text = r1.GetString("name").ToString();
            



        }



        cnn.Close();

        // Total Balance Show
        cnn.Open();
        MySqlCommand cmd1 = cnn.CreateCommand();


        cmd1.CommandType = CommandType.Text;

        cmd1.CommandText = "select *from  accountuser where passport='" + passport_no + "'";
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


        cnn.Close();


        // Payment Balance Show
        cnn.Open();
        MySqlCommand cmd6 = cnn.CreateCommand();


        cmd6.CommandType = CommandType.Text;

        cmd6.CommandText = "select *from  payment where sr='" + rcv_sr_no + "'";
     


        MySqlDataReader r5;

        r5 = cmd6.ExecuteReader();

        while (r5.Read())
        {

            Balance.Text = r5.GetString("Balance").ToString();


        }
       
        cnn.Close();
        //end
    
    }


    protected void paymentButton_Click(object sender, EventArgs e)
    {

       
        cnn.Open();



        MySqlCommand cmd7= cnn.CreateCommand();
        cmd7.CommandType = CommandType.Text;

        cmd7.CommandText = "update payment set Balance='" + Balance.Text + "' where sr='" + rcv_sr_no + "'";


        cmd7.ExecuteNonQuery();


        cnn.Close();


        cnn.Open();
        MySqlCommand cmd9 = cnn.CreateCommand();


        cmd9.CommandType = CommandType.Text;

        cmd9.CommandText = "SELECT SUM(Balance) FROM payment where passportNo='" + passport_no + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";




        int result = Convert.ToInt32(cmd9.ExecuteScalar());




        cnn.Close();


        Bal_sum = result.ToString();











        


            //update total Balance for account user Table
            cnn.Open();



            MySqlCommand cmd1 = cnn.CreateCommand();
            cmd1.CommandType = CommandType.Text;

            cmd1.CommandText = "update accountuser set Total_Balance='" + Bal_sum + "' where passport='" + passport_no + "'";


            cmd1.ExecuteNonQuery();


            cnn.Close();


        



        Response.Write("<script> alert('Payment Edit Successfully');</script>");

        Response.Redirect("ALLPaymentListEdit.aspx");

    }
}