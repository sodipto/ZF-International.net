<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin MasterPage.master" AutoEventWireup="true" CodeFile="WithdrawPayment.aspx.cs" Inherits="Admin_WithdrawPayment" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2 style="text-align:center;">Passenger Withdraw Payment</h2>
    </br>
    <div  class ="form-inline" style="text-align:center;">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" validationgroup="s" runat="server" ControlToValidate="SearchTextbox"  ForeColor="Red" ErrorMessage="Usernsme requere" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:TextBox ID="SearchTextbox" validationgroup="s" class="form-control" runat="server"></asp:TextBox>
       
         <div class="btn btn-info glyphicon glyphicon-search">
              <asp:Button ID="Search_Button" validationgroup="s" runat="server" Text="Search" BackColor="Transparent" BorderWidth="0" OnClick="Search_Button_Click"/>
            
        </div> 
          
    </div>
   
       

    <div style="padding-top:50px;"class="container">

        
        <div class="row">

            <div class="col-md-6">
                    
                   <div  class="row">
 
<div  class="col-md-8">
    <div class="form-group">
      <label for="email">Passport No:</label>
     
        <asp:TextBox ID="Passport" class="form-control"  validationgroup="w"  placeholder="Enter Passport no"   runat="server" ReadOnly="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  validationgroup="w" runat="server" ErrorMessage="Passport Require" ControlToValidate="Passport" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>
</div>
                     <div  class="row">
 
<div  class="col-md-8">
    <div class="form-group">
      <label for="email">Amount Received:</label>
    <%-- required="required"--%>
        <asp:TextBox ID="Balance"  validationgroup="w" class="form-control"  placeholder="Enter Add  Balance"  runat="server" ReadOnly="False" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator  validationgroup="w" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Balance Require" ControlToValidate="Balance" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>
</div>

         <div  class="row">
 
<div  class="col-md-8">
    <div class="form-group">
      <label for="email">Date:</label>
    <%-- required="required"--%>
        <asp:TextBox ID="date_time"  validationgroup="w" class="form-control"  placeholder="Enter Add  Date"  runat="server" ReadOnly="False" ></asp:TextBox>
        <asp:RequiredFieldValidator  validationgroup="w" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Date Require" ControlToValidate="date_time" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>
</div>

                
                     <div  class="row">
 
<div  class="col-md-8">
    <div class="form-group">
      <label for="email">
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label></label>
   
    </div>
</div>
</div>
        <div style="padding-left:130px;">
          <asp:Button ID="paymentButton"  validationgroup="w" class="btn btn-danger" runat="server" Text="Withdraw Payment" OnClick="paymentButton_Click" onclientclick="Alert_insert()" />
   
      </div>
 

      </div>

            <div class="col-md-6">
              <div class="row">
                   <div class="col-md-8">
               <div class="panel panel-danger ">
                        <div class="panel-heading">Passenger Information</div>
                         <div class="panel-body">Job Trade:  <asp:Label ID="jobtrade" runat="server" Text=""></asp:Label></div>
                          <div class="panel-body">Company Name:  <asp:Label ID="company" runat="server" Text=""></asp:Label></div>
                          <div class="panel-body">Passenger Name:   <asp:Label ID="Name" runat="server" Text=""></asp:Label></div>
                          <div class="panel-body">Passport NO:  <asp:Label ID="Passport_label" runat="server" Text=""></asp:Label></div>
                    <div class="panel-body">Passport Expiry Date:  <asp:Label ID="pasport_expiry" runat="server" Text=""></asp:Label></div>
                          <div class="panel-body">Date OF Birth:  <asp:Label ID="Birth" runat="server" Text=""></asp:Label></div>
                          <div class="panel-body">Agent Name:  <asp:Label ID="agentname" runat="server" Text=""></asp:Label></div>
                           <div class="panel-footer">Reeived Amount:     <asp:Label ID="Balance_label" runat="server" Text="0"></asp:Label>     Taka</div>
                </div>
                  </div>
              </div>

                 <div style="padding-left:130px;">
                     <asp:Button ID="ClearButton" class="btn btn-danger" runat="server" Text="Clear" OnClick="ClearButton_Click" />
   
                 </div>
 
            </div>



        </div>




    </div>

    <!-- Alert Message -->
    <script type="text/javascript">

        function Alert_insert() {
            if (confirm("Are you sure want to Withdraw....?")) {

                return true;

            }
            else {
                return false;
            }

        }

    </script> 


</asp:Content>

