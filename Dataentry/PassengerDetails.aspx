<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PassengerDetails.aspx.cs" Inherits="Dataentry_PassengerDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css1.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    
 

		<title>Passenger Details</title>

<style>
  .text-danger strong {
    		color: #9f181c;
		}
		.receipt-main {
			background: #ffffff none repeat scroll 0 0;
			border-bottom: 12px solid #333333;
			border-top: 12px solid #9f181c;
			margin-top: 50px;
			margin-bottom: 50px;
			padding: 40px 30px !important;
			position: relative;
			box-shadow: 0 1px 21px #acacac;
			color: #333333;
			font-family: open sans;
		}
		.receipt-main p {
			color: #333333;
			font-family: open sans;
			line-height: 1.42857;
		}
		.receipt-footer h1 {
			font-size: 15px;
			font-weight: 400 !important;
			margin: 0 !important;
		}
		.receipt-main::after {
			background: #414143 none repeat scroll 0 0;
			content: "";
			height: 5px;
			left: 0;
			position: absolute;
			right: 0;
			top: -13px;
		}
		.receipt-main thead {
			background: #414143 none repeat scroll 0 0;
		}
		.receipt-main thead th {
			color:#fff;
		}
		.receipt-right h5 {
			font-size: 16px;
			font-weight: bold;
			margin: 0 0 7px 0;
		}
		.receipt-right p {
			font-size: 12px;
			margin: 0px;
		}
		.receipt-right p i {
			text-align: center;
			width: 18px;
		}
		.receipt-main td {
			padding: 9px 20px !important;
		}
		.receipt-main th {
			padding: 13px 20px !important;
		}
		.receipt-main td {
			font-size: 16px;
            
			font-weight: initial !important;
		}
		.receipt-main td p:last-child {
			margin: 0;
			padding: 0;
		}	
		.receipt-main td h2 {
			font-size: 20px;
			font-weight: 900;
			margin: 0;
			text-transform: uppercase;
		}
		.receipt-header-mid .receipt-left h1 {
			font-weight: 100;
			margin: 34px 0 0;
			text-align: right;
			text-transform: uppercase;
		}
		.receipt-header-mid {
			margin: 24px 0;
			overflow: hidden;
		}
		
		#container {
			background-color: #dcdcdc;
		}



  </style>



</head>
<body>
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

        <div  class ="form-inline" style="text-align:center;">
            <h3>Search Passenger</h3>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" validationgroup="s" runat="server" ControlToValidate="SearchTextbox"  ForeColor="Red" ErrorMessage="Usernsme requere" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:TextBox ID="SearchTextbox" validationgroup="s" class="form-control" runat="server"></asp:TextBox>
       
         <div class="btn btn-info glyphicon glyphicon-search">
              <asp:Button ID="Search_Button" validationgroup="s" runat="server" Text="Search" BackColor="Transparent" BorderWidth="0" OnClick="Search_Button_Click"/>
            
        </div> 
          
    </div>

	<div class="row">

<asp:Repeater ID="R1" runat="server">

    <ItemTemplate>		
        <div class="receipt-main col-xs-10 col-sm-10 col-md-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-2">
            <div class="row">
    			<div class="receipt-header">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="receipt-left">
							<img class="img-responsive img-thumbnail" alt="iamgurdeeposahan" src="../PassportImage/<%#Eval("image") %>" style=" width: 300px; height:200px" >
                             <a href="../PassportImage/<%#Eval("image") %>" download>Download </a>
						</div>
					</div>
					<%--<div class="col-xs-6 col-sm-6 col-md-6 text-right">
						<div class="receipt-right">
							<h5>TechiTouch.</h5>
							<p>+91 12345-6789 <i class="fa fa-phone"></i></p>
							<p>info@gmail.com <i class="fa fa-envelope-o"></i></p>
							<p>Australia <i class="fa fa-location-arrow"></i></p>
						</div>
					</div>--%>
				</div>
            </div>
			
			<div class="row">
				<div class="receipt-header receipt-header-mid">
					<div class="col-xs-8 col-sm-8 col-md-8 text-left">
						<div class="receipt-right">
							<h4><b>Name :<%#Eval("name") %></h4>
							<p><b>Mobile :</b><%#Eval("Passenger_Mobile") %></p>
							<p><b>Passport No :<%#Eval("Passport_No") %></p>
							
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4">
						<div class="receipt-left">
							<h4>Passenger Details</h4>
						</div>
					</div>
				</div>
            </div>
			
            <div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Identifier</th>
                            <th>User value</th>
                        </tr>
                    </thead>
                    <tbody>


                        <tr>
                            <td class="col-md-9">JOB TRADE</td>
                            <td class="col-md-3"><%#Eval("Job_Trade") %></td>
                        </tr>

                         <tr>
                            <td class="col-md-9">COMPANY NAME</td>
                            <td class="col-md-3"><%#Eval("Company_Name") %></td>
                        </tr>


                         <tr>
                            <td class="col-md-9">PASSENGER NAME</td>
                            <td class="col-md-3"><%#Eval("name") %></td>
                        </tr>

                          <tr>
                            <td class="col-md-9">PASSPORT NO</td>
                            <td class="col-md-3"><%#Eval("Passport_No") %></td>
                        </tr>
                       
                        <tr>
                            <td class="col-md-9">PP EXPIRY DATE</td>
                            <td class="col-md-3"><%#Eval("Expiry_Date") %></td>
                        </tr>

                        <tr>
                            <td class="col-md-9">DATE OF BIRTH</td>
                            <td class="col-md-3"><%#Eval("Birth") %></td>
                        </tr>

                      

                          <tr>
                            <td class="col-md-9">PASSENGER MOBILE NO</td>
                            <td class="col-md-3"><%#Eval("Passenger_Mobile") %></td>
                        </tr>

                        

                        

                      

                        
                         

                         <tr>
                            <td class="col-md-9">MARITAL STATUS</td>
                            <td class="col-md-3"><%#Eval("Married_Status") %></td>
                        </tr>

                        
                         <tr>
                            <td class="col-md-9">MEDICAL STATUS</td>
                            <td class="col-md-3"><%#Eval("Medical_Status") %></td>
                        </tr>
                        

                         <tr>
                            <td class="col-md-9">AGE</td>
                            <td class="col-md-3"><%#Eval("age") %></td>
                        </tr>
                        
                         <tr>
                            <td class="col-md-9">APPLICATION SENT</td>
                            <td class="col-md-3"><%#Eval("Sent_Work") %></td>
                        </tr>

                         <tr>
                            <td class="col-md-9">WORK PERMIT RECEIVED</td>
                            <td class="col-md-3"><%#Eval("Receive_Work") %></td>
                        </tr>

                          <tr>
                            <td class="col-md-9">INTERVIEW DATE</td>
                            <td class="col-md-3"><%#Eval("interview") %></td>
                        </tr>


                           <tr>
                            <td class="col-md-9">AGENT NAME</td>
                            <td class="col-md-3"><%#Eval("Agent_Name") %></td>
                        </tr>

                        
                         <tr>
                            <td class="col-md-9">AGENT MOBILE NO</td>
                            <td class="col-md-3"><%#Eval("Agent_Mobile") %></td>
                        </tr>
                        
                         <tr>
                            <td class="col-md-9">TRAVEL DATE</td>
                            <td class="col-md-3"><%#Eval("Travel_Date") %></td>
                        </tr>

                         <tr>
                            <td class="col-md-9">REMARKS</td>
                            <td class="col-md-3"><%#Eval("Remarks") %></td>
                        </tr>
                         
                          <tr>
                            <td class="col-md-9">RECEIVED AMOUNT</td>
                            <td class="col-md-3"> <%#Eval("Total_Balance") %>   Taka  </td>
                            <%-- <td class="col-md-3">Detils</td> --%>
                            
                        </tr>

                       
                     <%--   <tr>
                           
                            <td class="text-right"><h2><strong>Edit</strong></h2></td>
                            <td class="text-left text-danger"><h2><strong>
        <asp:Button ID="Button1" runat="server" Text="Button" /></strong></h2></td>
                        </tr>--%>
                    </tbody>
                </table>
            </div>

            </ItemTemplate>

			</asp:Repeater>


			
			
        </div>    
	</div> 
    </form>
</body>
</html>
