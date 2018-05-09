<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin MasterPage.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Admin_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
        	<!-- Website CSS style -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css1.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  
    <h1 class="well" style="text-align:center;">Update Passenger Information</h1>

	
	<div class="row">
        <div  style="text-align:center; " class="form-group ">
					
	
                       
                   	<asp:Image ID="Image1" runat="server" style="max-height: 300px; max-width: 300px;"  Height="250px"  width="300px"  />
                       
                   </div>
			
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Passenger Name</label>
								
                                <asp:TextBox ID="name" class="form-control" runat="server" placeholder="Enter your Name"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
							<div class="col-sm-6 form-group">
								<label>Date Of Birth</label>
								 <asp:TextBox ID="Birth" class="form-control" runat="server" placeholder="Enter your Date Of Birth" ></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Birth" Display="Dynamic" ErrorMessage="Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>

                            <div class="col-sm-6 form-group">
								<label>Passport No</label>
								 <asp:TextBox ID="Passport_No" class="form-control" runat="server" placeholder="Enter your Passport No" ReadOnly="True"></asp:TextBox>
									
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Passport_No" Display="Dynamic" ErrorMessage="Passport No Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
							<div class="col-sm-6 form-group">
								<label>Passport Expiry Date</label>
								<asp:TextBox ID="Expiry_Date" class="form-control" runat="server" placeholder="Enter your Passport Expiry Date" ></asp:TextBox>
                                   
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Expiry_Date" Display="Dynamic" ErrorMessage="Date Required " ForeColor="Red"></asp:RequiredFieldValidator>
                                 
								   
							</div>

						</div>					
						
                         <div class="row">
							<div class="col-sm-6 form-group">
								<label>Passenger Mobile No</label>
								

                                    <asp:TextBox ID="Passenger_Mobile" class="form-control" runat="server" placeholder="Enter your Passenger Mobile No" MaxLength="11" TextMode="Number"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Passenger_Mobile" Display="Dynamic" ErrorMessage="Mobile no Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>		
							<div class="col-sm-6 form-group">
								<label>Married Status </label>
					<asp:DropDownList ID="Married_Status" class="form-control" runat="server">
                             
                            <asp:ListItem>Yes</asp:ListItem>  
                            <asp:ListItem>No</asp:ListItem>  
                            
                   


                     </asp:DropDownList>
								 
							</div>	
						</div> 
                        	
                    
                       
                         <div class="row">
							<div class="col-sm-6 form-group">
								<label>age</label>
								

                                    <asp:TextBox ID="age" class="form-control" runat="server" placeholder="Enter your age" TextMode="Number"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="age" Display="Dynamic" ErrorMessage="Age Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>		
							<div class="col-sm-6 form-group">
								<label>Medical Status</label>
							 <asp:TextBox ID="Medical_Status" class="form-control" runat="server" placeholder="Enter your Medical Status" ></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Medical_Status" Display="Dynamic" ErrorMessage="Medical  status Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>	
						</div> 
                        	
						      <div class="row">
							<div class="col-sm-6 form-group">
								<label>Agent Name</label>
								

                                    <asp:TextBox ID="Agent_Name" class="form-control" runat="server" placeholder="Enter your Agent Name"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Agent_Name" Display="Dynamic" ErrorMessage="Agent Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>		
							<div class="col-sm-6 form-group">
								<label>Agent Mobile No</label>
							 <asp:TextBox ID="Agent_Mobile" class="form-control" runat="server" placeholder="Enter your Agent Mobile No" TextMode="Number" MaxLength="11"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Agent_Mobile" Display="Dynamic" ErrorMessage="Mobile no Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>	
						</div> 

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
								

                             
                             <div class=" col-sm-6 form-group">
							<label>Sent Work Permit</label>
							   	<asp:DropDownList ID="Sent_Work" class="form-control" runat="server">
                          
                            <asp:ListItem>Yes</asp:ListItem>  
                            <asp:ListItem>No</asp:ListItem>  
                            
                   


                     </asp:DropDownList>
                              
                            </div>
                             
                                  <div class=" col-sm-6 form-group">
							<label>Receive Work Permit</label>
							   	<asp:DropDownList ID="Receive_Work" class="form-control" runat="server">
                           
                            <asp:ListItem>Yes</asp:ListItem>  
                            <asp:ListItem>No</asp:ListItem>  
                            
                   


                     </asp:DropDownList>
                              
                            </div>		
							
						</div> 
                       <div class="row">
                          

                             <div class=" col-sm-6 form-group">
							<label>Travel Date</label>
							
                            <asp:TextBox ID="Travel_Date" class="form-control" runat="server" placeholder="Enter your Travel Date" Text="Pending"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Travel_Date" Display="Dynamic" ErrorMessage="Travel Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>

                           <div class="col-sm-6 form-group">
								<label>Remarks</label>
							 <asp:TextBox ID="Remarks" class="form-control" runat="server" placeholder="Enter your Remarks"></asp:TextBox>
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Remarks" Display="Dynamic" ErrorMessage="Remarks Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>
						</div>

                             <div class="row">
 
                     
                      <div class="col-sm-6 form-group" >
                          <label for="email">Change Passport Image</label>
    
                        <asp:FileUpload ID="p_image"  class="input-file" runat="server" />
                   

                    </div>

                                 <div class="col-sm-6 form-group">
								<label>Interview Date</label>
							 <asp:TextBox ID="interview" class="form-control" runat="server" placeholder="Enter your Interview Date"></asp:TextBox>
								    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="interview" Display="Dynamic" ErrorMessage="interview Date Required" ForeColor="Red"></asp:RequiredFieldValidator>
							</div>
                    
                    </div>
                 </div>

               
                   <div  style="text-align:center; font-size: 11px;" class="form-group ">
					
	
                       
                     <asp:Button ID="Register" runat="server" class="btn btn-primary btn-lg" OnClick="Update_Click" Text="UPDATE"  onclientclick="Alert_insert1()"/>  	
                       
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

  





</asp:Content>

