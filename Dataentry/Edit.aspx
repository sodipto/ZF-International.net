<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Dataentry_Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <!-- Website CSS style -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css1.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Sent Permit Update</title>

    <style>

        .login-register{
	font-size: 11px;
	text-align: center;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <h1 class="well" style="text-align:center;">Update Passenger Information</h1>

	<div class="container">
	<div class="row">
        
			
					<div class="col-sm-12" >
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Passenger Name</label>
								
                                <asp:TextBox ID="name" class="form-control" runat="server" placeholder="Enter your Name" ReadOnly="True"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
							

                            <div class="col-sm-6 form-group">
								<label>Passport No</label>
								 <asp:TextBox ID="Passport_No" class="form-control" runat="server" placeholder="Enter your Passport No" ReadOnly="True"></asp:TextBox>
									
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Passport_No" Display="Dynamic" ErrorMessage="Passport No Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
							

						</div>					
						
                       
                        	
                    
                       
                        
                        	
						     

                        <div class="row">
							<div class="col-sm-6 form-group">
								<label>Job Trade</label>
								<asp:TextBox ID="Job_Trade" class="form-control" runat="server" placeholder="Enter your Job Trade" ReadOnly="True"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Job_Trade" Display="Dynamic" ErrorMessage="Job Trade Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>	

                              <div class=" col-sm-6 form-group">
							<label>Sent Work Permit</label>
							   	<asp:DropDownList ID="Sent_Work" class="form-control" runat="server">
                          
                            <asp:ListItem>Yes</asp:ListItem>  
                            <asp:ListItem>No</asp:ListItem>  
                            
                   


                     </asp:DropDownList>
                              
                            </div>
							
						</div>

                       
                 </div>

               
                   <div  style="text-align:center; font-size: 11px;" class="form-group ">
					
	
                       
                     <asp:Button ID="Register" runat="server" class="btn btn-primary btn-lg" OnClick="Update_Click" Text="UPDATE"  onclientclick="Alert_insert1()"/>  	
                       
                   </div>			
					</div>
				
				</div>
	
	
   
   
		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) ImageUrl="~/PassportImage/pp.jpg" -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

   <!-- Alert Message -->
    <script type="text/javascript">

        function Alert_insert1() {
            if (confirm("Are you sure want to Update....?")) {

                return true;

            }
            else {
                return false;
            }

        }

    </script> 

    </form>
</body>
</html>
