<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserEntry.aspx.cs" Inherits="Registration_UserEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    	<!-- Website CSS style -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css1.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    
 

		<title>Registration</title>

    <style>

        .login-register{
	font-size: 11px;
	text-align: center;
}
    </style>

  
</head>

<body style="background-color:cyan;">
    <form id="form1" runat="server">

<nav  class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="UserEntry.aspx">Data Entry</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="UserEntry.aspx">Passenger Entry</a></li>
      
      <li><a href="ALLPassengerList.aspx">ALL Passenger List</a></li>

      <li><a href="PassengerDetails.aspx">Passenger Details</a></li>
      <li><a href="SentWorkPermit.aspx">Sent For Work Permit</a></li>
      <li><a href="SentPermitEdit.aspx">Sent For Work Permit Edit</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span>
          <asp:Label ID="username" runat="server" Text=""></asp:Label> </a></li>
      <li>
          <asp:LinkButton ID="LinkButton1" OnClick="Logout_Click" runat="server" ValidationGroup="log"><span class="glyphicon glyphicon-log-in"></span> Logout</asp:LinkButton></li>
    </ul>
  </div>
</nav>


         <div class="container">
    <h1 class="well">Passenger Entry Form</h1>
	<div class="col-lg-12 well">
	<div class="row">
				
						<div class="col-sm-12">


                            <div class="row">
							<div class="col-sm-6 form-group">
								<label>Job Trade</label>
								<asp:TextBox ID="Job_Trade" class="form-control" runat="server" placeholder="Enter your Job Trade" ></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Job_Trade" Display="Dynamic" ErrorMessage="Job Trade Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Company Name</label>
								<asp:TextBox ID="Company_Name" class="form-control" runat="server" placeholder="Enter your Company Name"></asp:TextBox>
								   
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="Company_Name" Display="Dynamic" ErrorMessage="Company Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>	
									
						</div>


						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Passenger Name</label>
								
                                <asp:TextBox ID="name" class="form-control" runat="server" placeholder="Enter your Name"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>


                                <div class="col-sm-6 form-group">
								<label>Passport No</label>
								 <asp:TextBox ID="Passport_No" class="form-control" runat="server" placeholder="Enter your Passport No" ></asp:TextBox>
									
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Passport_No" Display="Dynamic" ErrorMessage="Passport No Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>


                            <div class="col-sm-6 form-group">
								<label>PP Expiry Date</label>
								<asp:TextBox ID="Expiry_Date" class="form-control" runat="server" placeholder="Enter your Passport Expiry Date" ></asp:TextBox>
                                   
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Expiry_Date" Display="Dynamic" ErrorMessage="Date Required " ForeColor="Red"></asp:RequiredFieldValidator>
                                 
								   
							</div>

							<div class="col-sm-6 form-group">
								<label>Date Of Birth</label>
								 <asp:TextBox ID="Birth" class="form-control" runat="server" placeholder="Enter your Date Of Birth" AutoPostBack="True" OnTextChanged="Birth_TextChanged" ></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Birth" Display="Dynamic" ErrorMessage="Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>

                        
						

						</div>					
						
                         <div class="row">
							<div class="col-sm-6 form-group">
								<label>Passenger Mobile No</label>
								

                                    <asp:TextBox ID="Passenger_Mobile" class="form-control" runat="server" placeholder="Enter your Passenger Mobile No" MaxLength="11" TextMode="Number"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Passenger_Mobile" Display="Dynamic" ErrorMessage="Mobile no Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>		
							<div class="col-sm-6 form-group">
								<label>Marital Status </label>
					<asp:DropDownList ID="Married_Status" class="form-control" runat="server">
                             
                            <asp:ListItem>Yes</asp:ListItem>  
                            <asp:ListItem>No</asp:ListItem>  
                            
                   


                     </asp:DropDownList>
								 
							</div>	
						</div> 
                        	
                    
                       
                         <div class="row">
							<div class="col-sm-6 form-group">
								<label>Age</label>
								

                                    <asp:TextBox ID="age" class="form-control" runat="server" placeholder="Enter your age"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="age" Display="Dynamic" ErrorMessage="Age Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>		
							<div class="col-sm-6 form-group">
								<label>Medical Status</label>
							 <asp:TextBox ID="Medical_Status" class="form-control" runat="server" placeholder="Enter your Medical Status" ></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Medical_Status" Display="Dynamic" ErrorMessage="Medical  status Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>	
						</div> 

                        
                         <div class="row">
								

                             
                             <div class=" col-sm-6 form-group">
							<label>APPLICATION SENT</label>
							   	<asp:DropDownList ID="Sent_Work" class="form-control" runat="server">
                          
                            <asp:ListItem>No</asp:ListItem>  
                            <asp:ListItem>Yes</asp:ListItem>  
                            
                   


                     </asp:DropDownList>
                              
                            </div>
                             
                                  <div class=" col-sm-6 form-group">
							<label>WORK PERMIT RECEIVED</label>
							   	<asp:DropDownList ID="Receive_Work" class="form-control" runat="server">
                           
                            <asp:ListItem>No</asp:ListItem>  
                            <asp:ListItem>Yes</asp:ListItem>  
                            
                   


                     </asp:DropDownList>
                              
                            </div>		
							
						</div> 


                        
                        	
						      <div class="row">
							<div class="col-sm-6 form-group">
								<label>INTERVIEW DATE</label>
								

                                    <asp:TextBox ID="interview" class="form-control" runat="server" placeholder="Enter your DATE"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="interview" Display="Dynamic" ErrorMessage="Agent Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>		
							
                          <div class="col-sm-6 form-group">
								<label>Agent Name</label>
								

                                    <asp:TextBox ID="Agent_Name" class="form-control" runat="server" placeholder="Enter your Agent Name"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Agent_Name" Display="Dynamic" ErrorMessage="Agent Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>	


						</div>


                        	
						      <div class="row">
								
							<div class="col-sm-6 form-group">
								<label>Agent Mobile No</label>
							 <asp:TextBox ID="Agent_Mobile" class="form-control" runat="server" placeholder="Enter your Agent Mobile No" TextMode="Number" MaxLength="11"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Agent_Mobile" Display="Dynamic" ErrorMessage="Mobile no Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
                                  
                                  
                             <div class=" col-sm-6 form-group">
							<label>Travel Date</label>
							
                            <asp:TextBox ID="Travel_Date" class="form-control" runat="server" placeholder="Enter your Travel Date" Text="Pending"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Travel_Date" Display="Dynamic" ErrorMessage="Travel Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                                  
                                  	
						</div> 

                    

                       <div class="row">
                          

                           <div class="col-sm-6 form-group">
								<label>Remarks</label>
							 <asp:TextBox ID="Remarks" class="form-control" runat="server" placeholder="Enter your Remarks"></asp:TextBox>
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Remarks" Display="Dynamic" ErrorMessage="Remarks Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>
                            <div class="col-sm-6 form-group">

                                  <label for="email">Upload Passport Image</label>
    
                        <asp:FileUpload ID="p_image"  class="input-file" runat="server" />
                        <asp:RequiredFieldValidator  ID="RequiredFieldValidator2" runat="server" ErrorMessage="Image Require" ControlToValidate="p_image" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>


						</div>

                        <%--     <div class="row">
 
                       <div style="padding-left:300px;"  class="col-md-12">
                              <div class="form-group">
                         

                    </div>
                    </div>
                    </div>--%>

                    




                 </div>
               
                   <div  style="text-align:center; font-size: 11px;" class="form-group ">
					
	
                       
                     <asp:Button ID="Register" runat="server" class="btn btn-primary btn-lg" Text="User Entry" OnClick="Register_Click" onclientclick="Alert_insert()"/>  	
                        <asp:Button ID="Button1" runat="server" class="btn btn-success btn-lg"  Text="CLEAR" OnClick="Clear_Click" ValidationGroup="backhome" /> 
                      
                       
                   </div>			
					</div>
				
				</div>
	</div>
	
    </form>
 
		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

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

  
   
  
</body>
</html>