using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {


            Response.Redirect("~/Default.aspx");

        }

        else {


            username.Text = Session["username"].ToString();
        
        
        }
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("~/Default.aspx");

    }

    protected void Passenger_Click(object sender, EventArgs e)
    {

        Response.Redirect("PassengerDetails.aspx");
    }


    protected void PassengerListUpdate_Click(object sender, EventArgs e)
    {

        Response.Redirect("PassengerUpdate.aspx");
    }

    protected void PassengerList_Click(object sender, EventArgs e)
    {

        Response.Redirect("ALLPassengerList.aspx");
    }

    protected void AddPayment_Click(object sender, EventArgs e)
    {

        Response.Redirect("Addpayment.aspx");
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

    protected void WorkPermit_Click(object sender, EventArgs e)
    {

        Response.Redirect("SentWorkPermit.aspx");
    }




    //Payment Edit section

    protected void ALLPaymentListEdit_Click(object sender, EventArgs e)
    {

        Response.Redirect("ALLPaymentListEdit.aspx");
    }


    //Usertype

    protected void UserType_Click(object sender, EventArgs e)
    {

        Response.Redirect("UserTypeEntry.aspx");
    }



    protected void UserEdit_Click(object sender, EventArgs e)
    {

        Response.Redirect("UserTypeList.aspx");
    }


    //passport edit 


    protected void PassportEdit_Click(object sender, EventArgs e)
    {

        Response.Redirect("PassportEdit.aspx");
    }
}
