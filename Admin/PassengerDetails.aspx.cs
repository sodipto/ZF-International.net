using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PassengerDetails : System.Web.UI.Page
{
  MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=root;pwd=;");
    //MySqlConnection cnn = new MySqlConnection("server=localhost;database=zfinternational;uid=zf;pwd=12345;");
    DataTable data;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public void Show_Search()
    {


        cnn.Open();
        MySqlCommand cmd1 = cnn.CreateCommand();
        cmd1.CommandType = CommandType.Text;

        cmd1.CommandText = "SELECT *FROM  passenger INNER join accountuser ON passenger.Passport_No=accountuser.passport  where  passenger.Passport_No='" + SearchTextbox.Text + "' ";
         //cmd1.CommandText ="SELECT  *FROM passenger LEFT JOIN accountuser  ON passenger.Passport_No='" + SearchTextbox.Text + "' UNION SELECT *FROM passenger RIGHT JOIN accountuser ON passenger.Passport_No = '" + SearchTextbox.Text + "'" ;
        cmd1.ExecuteNonQuery();

        data = new DataTable();
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd1); 

        adp.Fill(data);
       


        R1.DataSource = data;
        R1.DataBind();


        cnn.Close();



    }


    protected void Search_Button_Click(object sender, EventArgs e)
    {
        //cnn.Open();
        //MySqlCommand cmd3 = cnn.CreateCommand();


        //cmd3.CommandType = CommandType.Text;

        //cmd3.CommandText = "select *from  accountuser where passport='" + SearchTextbox.Text + "'";
        ////cmd.CommandText = "select *from  passenger INNER JOIN payment ON passenger.Passport_No = payment.passportNo where passenger.Passport_No='" + SearchTextbox.Text + "'";


        //MySqlDataReader r3;

        //r3 = cmd3.ExecuteReader();



        //while (r3.Read())
        //{
        //    l.Text = r3.GetString("Passport_No").ToString();

        //    label

        //}




        //cnn.Close();
        Show_Search();




    }

    protected void BalanceDetails_Click(object sender, EventArgs e)
    {
        //Response.Redirect("BalanceDetails.aspx?Q=" + Passport_No.Text);

        LinkButton btn = (LinkButton)(sender);
        string passport_no = btn.CommandArgument;
        Session["passport_no"] = passport_no;
        Response.Redirect("BalanceDetails.aspx");

    }

}