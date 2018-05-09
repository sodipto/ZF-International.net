<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Account.master" AutoEventWireup="true" CodeFile="PassengerDetails.aspx.cs" Inherits="Account_PassengerDetails" %>

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
      <div class="container">
    <h1 class="well"><div  class ="form-inline" style="text-align:center;">
        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" validationgroup="s" runat="server" ControlToValidate="SearchTextbox"  ForeColor="Red" ErrorMessage="Passport No requere" Display="Dynamic"></asp:RequiredFieldValidator>--%>
    <asp:TextBox ID="SearchTextbox" validationgroup="s" class="form-control" runat="server"></asp:TextBox>
       
         <div class="btn btn-info glyphicon glyphicon-search">
              <asp:Button ID="Search_Button" validationgroup="s" runat="server" Text="Search" BackColor="Transparent" BorderWidth="0" OnClick="Search_Button_Click"/>
              <%--OnClick="Register_Click" onclientclick="Alert_insert()"--%>
            
        </div> 
          
    </div></h1>
	<div class="col-lg-12 well">
	<div class="row">
				
						<div class="col-sm-12">


                            <div class="row">
							<div class="col-sm-6 form-group">
								<label>Job Trade</label>
								<asp:TextBox ID="Job_Trade" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Job_Trade" Display="Dynamic" ErrorMessage="Job Trade Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>	
							<div class="col-sm-6 form-group">
								<label>Company Name</label>
								<asp:TextBox ID="Company_Name" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								   
                                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="Company_Name" Display="Dynamic" ErrorMessage="Company Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>	
									
						</div>


						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Passenger Name</label>
								
                                <asp:TextBox ID="name" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>


                                <div class="col-sm-6 form-group">
								<label>Passport No</label>
								 <asp:TextBox ID="Passport_No" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
									
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Passport_No" Display="Dynamic" ErrorMessage="Passport No Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>


                            <div class="col-sm-6 form-group">
								<label>PP Expiry Date</label>
								<asp:TextBox ID="Expiry_Date" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
                                   
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Expiry_Date" Display="Dynamic" ErrorMessage="Date Required " ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                 
								   
							</div>

							<div class="col-sm-6 form-group">
								<label>Date Of Birth</label>
								 <asp:TextBox ID="Birth" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Birth" Display="Dynamic" ErrorMessage="Date Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>

                        
						

						</div>					
						
                         <div class="row">
							<div class="col-sm-6 form-group">
								<label>Passenger Mobile No</label>
								

                                    <asp:TextBox ID="Passenger_Mobile" class="form-control" runat="server" placeholder="" MaxLength="11" TextMode="Number" ReadOnly="True"></asp:TextBox>
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Passenger_Mobile" Display="Dynamic" ErrorMessage="Mobile no Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>		
							<div class="col-sm-6 form-group">
								<label>Marital Status </label>
                     <asp:TextBox ID="Married_Status" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
					
								 
							</div>	
						</div> 
                        	
                    
                       
                         <div class="row">
							<div class="col-sm-6 form-group">
								<label>Age</label>
								

                                    <asp:TextBox ID="age" class="form-control" runat="server" placeholder="" TextMode="Number" ReadOnly="True"></asp:TextBox>
								   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="age" Display="Dynamic" ErrorMessage="Age Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>		
							<div class="col-sm-6 form-group">
								<label>Medical Status</label>
							 <asp:TextBox ID="Medical_Status" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								 <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Medical_Status" Display="Dynamic" ErrorMessage="Medical  status Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>	
						</div> 

                        
                         <div class="row">
								

                             
                             <div class=" col-sm-6 form-group">
							<label>APPLICATION SENT</label>
                                 <asp:TextBox ID="Sent_Work" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>

							
                              
                            </div>
                             
                                  <div class=" col-sm-6 form-group">
							<label>WORK PERMIT RECEIVED</label>
                                       <asp:TextBox ID="Receive_Work" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>

							
                              
                            </div>		
							
						</div> 


                        
                        	
						      <div class="row">
							<div class="col-sm-6 form-group">
								<label>INTERVIEW DATE</label>
								

                                    <asp:TextBox ID="interview" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="interview" Display="Dynamic" ErrorMessage="Agent Name Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>		
							
                          <div class="col-sm-6 form-group">
								<label>Agent Name</label>
								

                                    <asp:TextBox ID="Agent_Name" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Agent_Name" Display="Dynamic" ErrorMessage="Agent Name Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>	


						</div>


                        	
						      <div class="row">
								
							<div class="col-sm-6 form-group">
								<label>Agent Mobile No</label>
							 <asp:TextBox ID="Agent_Mobile" class="form-control" runat="server" placeholder="" TextMode="Number" MaxLength="11" ReadOnly="True"></asp:TextBox>
<%--								    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Agent_Mobile" Display="Dynamic" ErrorMessage="Mobile no Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>
                                  
                                  
                             <div class=" col-sm-6 form-group">
							<label>Travel Date</label>
							
                            <asp:TextBox ID="Travel_Date" class="form-control" runat="server" placeholder="" Text="Pending" ReadOnly="True"></asp:TextBox>
								<%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Travel_Date" Display="Dynamic" ErrorMessage="Travel Date Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            </div>

                                  
                                  	
						</div> 

                    

                       <div class="row">
                          

                           <div class="col-sm-6 form-group">
								<label>Remarks</label>
							 <asp:TextBox ID="Remarks" class="form-control" runat="server" placeholder="" ReadOnly="True"></asp:TextBox>
								  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Remarks" Display="Dynamic" ErrorMessage="Remarks Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
							</div>
                           
                       <div class=" col-sm-6 form-group">
							<label>AMOUNT RECEIVED</label>
							
                            <asp:TextBox ID="T_Balance" class="form-control" runat="server" placeholder="Enter your Travel Date" ReadOnly="True" ></asp:TextBox>

                             <asp:LinkButton ID="LinkButton1" onClick="BalanceDetails_Click" runat="server">Balance Details</asp:LinkButton> 
     
                            </div>


						</div>


                    




                 </div>
               
                   <div  style="text-align:center; font-size: 11px;" class="form-group ">
					
	                     <asp:Button ID="Clear_button" runat="server" class="btn btn-primary btn-lg" Text="Clear" OnClick="Clear_button_Click" />  	   
                       <%--OnClick="Register_Click" onclientclick="Alert_insert()"--%>  
                   </div>			
					</div>
				
				</div>




	</div>


							

</asp:Content>

