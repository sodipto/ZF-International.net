using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class ResetPassword : System.Web.UI.Page
{
    string msg = "This Email NOT Your Registered email";

    string unique,Toemail,name;
    MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    // MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    protected void Page_Load(object sender, EventArgs e)
    {

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

        //  Response.Write("<script> alert('Error:" + msg + " ');</script>");
            return true;
        }
        else
        {
            return false;
        }
    }





    protected void ResetPass_Click(object sender, EventArgs e)
    {

        if (!Email_Check())
        {
            //cnn.Open();
            //MySqlCommand cmd3 = cnn.CreateCommand();
            //cmd3.CommandType = CommandType.Text;
            //MySqlDataReader r4;

            //cmd3.CommandText = "SELECT *from account";
            //r4 = cmd3.ExecuteReader();

            //while (r4.Read())
            //{

            //    //var = r4.GetString("name").ToString();
            //}

            Response.Write("<script> alert('This Email Id NOT Exist');</script>");
        }

        else {

          
            cnn.Open();
            MySqlCommand cmd3 = cnn.CreateCommand();
            cmd3.CommandType = CommandType.Text;
            MySqlDataReader r4;

            cmd3.CommandText = "SELECT *from admin where email='"+email.Text+ "'";
            r4 = cmd3.ExecuteReader();

            while (r4.Read())
            {
                Toemail = r4.GetString("email").ToString();
                unique = r4.GetString("guid").ToString();
                name = r4.GetString("name").ToString();
            }



            SendPasswordResetEmail(Toemail, name, unique);
        
        
        }

       

    }


    private void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId)
    {
        // MailMessage class is present is System.Net.Mail namespace
        MailMessage mailMessage = new MailMessage("YourEmail@gmail.com", ToEmail);


        // StringBuilder class is present in System.Text namespace
        StringBuilder sbEmailBody = new StringBuilder();
        sbEmailBody.Append("Dear " + UserName + ",<br/><br/>");
        sbEmailBody.Append("Please click on the following link to reset your password");
        sbEmailBody.Append("<br/>"); sbEmailBody.Append("http://localhost:17979/ZF%20International/Reset.aspx?uid=" + UniqueId);

        sbEmailBody.Append("<br/><br/>");
        sbEmailBody.Append("<b>ZF INTERNATIONAL</b>");

        mailMessage.IsBodyHtml = true;

        mailMessage.Body = sbEmailBody.ToString();
        mailMessage.Subject = "Reset Your Password";
        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 25);   // 25 or 587s

        try
        {

            smtpClient.Credentials = new System.Net.NetworkCredential()
            {



                UserName = "zf.net1@gmail.com",
                Password = "zf.net12345"
            };

            smtpClient.EnableSsl = true;
           
            // smtp.Credentials = NetworkCred;
            smtpClient.Send(mailMessage);

            Response.Write("<script> alert('Check Your Email And Reset Your password');</script>");
            email.Text = "";
        }catch(Exception ex){

            Response.Write("<script> alert('Problem');</script>");
             
        
        }
    }

    
}