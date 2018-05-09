using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PassportEdit : System.Web.UI.Page
{
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");

    protected void Page_Load(object sender, EventArgs e)
    {

    }




    //Passport no checck
    public bool Passport_Check()
    {

        string constring = "server=localhost;database=zfinternational;uid=root;pwd=;"; // chage here
        // string constring = "server=localhost;database=zfinternational;uid=zf;pwd=12345;";
        MySqlConnection con = new MySqlConnection(constring);
        MySqlCommand cmd = new MySqlCommand("Select * from passenger where 	Passport_No='" + NewPassport.Text + "' ", con);
        // cmd.Parameters.AddWithValue("@ClassName", this.Class_textBox.Text);
        con.Open();
        int TotalRows = 0;
        TotalRows = Convert.ToInt32(cmd.ExecuteScalar());
        if (TotalRows > 0)
        {
            //  MessageBox.Show("This class Already exist");

            Response.Write("<script> alert('Error:This Passport Already exist');</script>");
            return true;
        }
        else
        {
            return false;
        }
    }


    protected void Passport_Click(object sender, EventArgs e)
    {
        


        if (!Passport_Check())
        {

            try
            {

              
                //passenger and accountuserTable passport change

                cnn.Open();

               
                MySqlCommand cmd = cnn.CreateCommand();
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "update passenger,accountuser SET passenger.Passport_No='" + NewPassport.Text + "',accountuser.passport='" + NewPassport.Text + "' where passenger.Passport_No='" + Passport.Text + "' and accountuser.passport='" + Passport.Text + "'";
             

                cmd.ExecuteReader();




                cnn.Close();

                //end




                //payment table passport change

                cnn.Open();

                //  MessageBox.Show("Connection Open ! ");
                MySqlCommand cmd1 = cnn.CreateCommand();
                cmd1.CommandType = CommandType.Text;

                cmd1.CommandText = "update payment SET passportNo='" + NewPassport.Text + "' where passportNo='" + Passport.Text + "'";
                // MySqlDataReader dr =  //data excute variable

                cmd1.ExecuteReader();




                cnn.Close();


                //end


                //Withdraw table passport change
                cnn.Open();

           
                MySqlCommand cmd2 = cnn.CreateCommand();
                cmd2.CommandType = CommandType.Text;

                cmd2.CommandText = "update withdraw SET passportNo='" + NewPassport.Text + "' where passportNo='" + Passport.Text + "'";
               

                cmd2.ExecuteReader();




                cnn.Close();

               //end 

                // All the passport change together


                Response.Write("<script> alert('Notification:UPDATE SUCCESSFULLY');</script>");


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

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


        if (pass != SearchTextbox.Text)
        {


            Passport.Text = "";
            NewPassport.Text = "";

        }

        cnn.Close();




        cnn.Open();
        MySqlCommand cmd5 = cnn.CreateCommand();


        cmd5.CommandType = CommandType.Text;

        cmd5.CommandText = "select *from  passenger where Passport_No='" + SearchTextbox.Text + "'";
        //cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        MySqlDataReader r5;

        r5 = cmd3.ExecuteReader();



        while (r5.Read())
        {
            Passport.Text = r5.GetString("Passport_No").ToString();
            NewPassport.Text = r5.GetString("Passport_No").ToString();



        }




        cnn.Close();
    }
}