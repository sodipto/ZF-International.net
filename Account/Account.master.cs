using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Account : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {


            Response.Redirect("~/Default.aspx");

        }

        else
        {


            username.Text = Session["username"].ToString();


        }
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("~/Default.aspx");

    }

    protected void AddPayment_Click(object sender, EventArgs e)
    {

        Response.Redirect("Addpayment.aspx");
    }

    protected void Home_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("ALLPassengerList.aspx");
    }

  protected void Passenger_Click(object sender, EventArgs e)
    {

        Response.Redirect("PassengerDetails.aspx");
    }


  protected void Withdraw_Click(object sender, EventArgs e)
    {

        Response.Redirect("WithdrawPayment.aspx");
    }


  protected void ALLPaymentList_Click(object sender, EventArgs e)
  {

      Response.Redirect("ALLPaymentList.aspx");
  }

  protected void ALLWithdrawList_Click(object sender, EventArgs e)
  {

      Response.Redirect("WithdrawPaymentList.aspx");
  }





}
