<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin MasterPage.master" AutoEventWireup="true" CodeFile="PassportEdit.aspx.cs" Inherits="Admin_PassportEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <h2 style="text-align:center;">Passenger Passport Edit</h2>
    </br>
    <div  class ="form-inline" style="text-align:center;">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" validationgroup="s" runat="server" ControlToValidate="SearchTextbox"  ForeColor="Red" ErrorMessage="Passport requere" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:TextBox ID="SearchTextbox" validationgroup="s" class="form-control" runat="server"></asp:TextBox>
       
         <div class="btn btn-info glyphicon glyphicon-search">
              <asp:Button ID="Search_Button" validationgroup="s" runat="server" Text="Search" OnClick="Search_Button_Click" BackColor="Transparent" BorderWidth="0" />
            
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
      <label for="email">New Passport:</label>
    <%-- required="required"--%>
        <asp:TextBox ID="NewPassport"  validationgroup="w" class="form-control"  placeholder="Enter New Passport"  runat="server" ReadOnly="False" ></asp:TextBox>
        <asp:RequiredFieldValidator  validationgroup="w" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Passport Require" ControlToValidate="NewPassport" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</div>
</div>


        <div style="padding-left:130px;">
          <asp:Button ID="Update_passport"  validationgroup="w" class="btn btn-danger" runat="server" Text="Update" OnClick="Passport_Click" onclientclick="Alert_insert()" />
   
      </div>
 

      </div>

          



        </div>




    </div>

    <!-- Alert Message -->
    <script type="text/javascript">

        function Alert_insert() {
            if (confirm("Are you sure want to insert....?")) {

                return true;

            }
            else {
                return false;
            }

        }

    </script>
</asp:Content>

