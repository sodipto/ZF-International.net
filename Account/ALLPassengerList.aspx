<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ALLPassengerList.aspx.cs" Inherits="Account_ALLPassengerList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>ALL Passenger List</title>
     <style type="text/css">
            	.row{
		    margin-top:40px;
		    padding: 0 10px;
		}
		.clickable{
		    cursor: pointer;   
		}

		.panel-heading div {
			margin-top: -18px;
			font-size: 15px;
		}
		.panel-heading div span{
			margin-left:5px;
		}
		.panel-body{
			display: none;
		}
    </style>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">

        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid" style="padding-top:20px;">
       <div  class ="pull-right form-inline">
        
        <asp:TextBox ID="SearchTextbox" class="form-control" runat="server"></asp:TextBox>
         <div class="btn btn-info glyphicon glyphicon-search">
              <asp:Button ID="Search_Button" runat="server" Text="Search" BackColor="Transparent" BorderWidth="0" OnClick="Search_Button_Click" />
             
        </div>             
                
            
    </div>

    <div  class ="pull-left form-inline">
        
        
         <div class="btn btn-danger glyphicon glyphicon-refresh">
              <asp:Button ID="Refresh" runat="server" Text="Refresh" BackColor="Transparent" BorderWidth="0" OnClick="Refresh_Click" />
             
        </div>    
        
        
         <div class="btn btn-danger glyphicon glyphicon-refresh">
             <asp:Button ID="Export_Button"  runat ="server" Text="Print" BackColor="Transparent" BorderWidth="0"   OnClick="Export_Button_Click1" />
             
        </div>  
        
         <div class="btn btn-success glyphicon glyphicon-refresh">
             <asp:Button ID="HomeButton"  runat ="server" Text="Back Home" BackColor="Transparent" BorderWidth="0" OnClick="HomeButton_Click" />
             
        </div>             
               
            
    </div>

  
    	<div style="padding-top: 25px" class="row">
			<div class="col-md-12" style="    padding-right: 5px;
    padding-left: 5px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">All Passenger Payment List</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
					</div>

             <asp:Repeater ID="R1" runat="server">

                 <HeaderTemplate>
					<table   class="table table-striped table-bordered" cellspacing="0" width="100%" id="dev-table">
						<thead>
						<tr>
							
							<th>SR</th>
                            <th>JOB TRADE</th>
                            <th>COMPANY NAME</th>
                            <th>PASSENGER NAME</th>
                            <th>PASSPORT NO</th>
                            <th>PP EXPIRY DATE</th>
                            <th>DATE OF BIRTH</th>
                            <th>PASSENGER MOBILE NO</th>
                            <th>MARITAL STATUS</th>
							<th>AGE</th>
							<th>MEDICAL STATUS</th>
                            <th>APPLICATION SENT</th>
                            <th>WORK PERMIT RECEIVED</th>
                            <th>INTERVIEW DATE</th>
							<th>AGENT NAME</th>
                            <th>AGENT Mobile</th>
                            <th>TRAVEL DATE</th>
                            <th>REMARKS</th>
						    <th>AMOUNT RECEIVED</th>
						
                            <%--<th>Edit</th>
                            <th>Delete</th>--%>
							
							
							
                          
                            
							</tr>
					</thead>
                      </HeaderTemplate>
					

					
                  <ItemTemplate>
                        <tbody>
						<tr>
							<td><%#Eval("sr") %></td>
                            <td><%#Eval("Job_Trade") %></td>
                            <td><%#Eval("Company_Name") %></td>
							<td><%#Eval("name") %></td>
                            <td><%#Eval("Passport_No") %></td>
					        <td><%#Eval("Expiry_Date") %></td>
                            <td><%#Eval("Birth") %></td>
							<td><%#Eval("Passenger_Mobile") %></td>
							<td><%#Eval("Married_Status") %></td>
                            <td><%#Eval("age") %></td>
					        <td><%#Eval("Medical_Status") %></td>
                            <td><%#Eval("Sent_Work") %></td>
					        <td><%#Eval("Receive_Work") %></td>
                           <td><%#Eval("interview") %></td>
                            <td><%#Eval("Agent_Name") %></td>
					        <td><%#Eval("Agent_Mobile") %></td>
                            <td><%#Eval("Travel_Date") %></td>
                            <td><%#Eval("Remarks") %></td>
                            <td><%#Eval("Total_Balance") %></td>
							
                             
                           <%-- <td>Edit</td>
                            <td>Delete</td>--%>


                           
                                        <%--	<td style="text-align:center;">

                                <div class="btn btn-success glyphicon glyphicon-ok">
                                     <asp:Button ID="Button1"  CommandArgument='<%# Eval("username") %>' OnClick="ENameLinkBtn_Click" runat="server" Text="Verify" BackColor="Transparent" BorderWidth="0" />
                                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("username") %>' OnClick="ENameLinkBtn_Click" runat="server" BackColor="Transparent" BorderWidth="0">Edit</asp:LinkButton>
                                </div>

							</td>--%>
                          

                            
						</tr>
						
                         
                     
					</tbody>
                      </ItemTemplate>

                          
             <FooterTemplate>     
					</table>

                       </FooterTemplate>

                        </asp:Repeater>
                            
				</div>
			</div>
			
		</div>

           <div style="overflow: hidden;">

<asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
 <ItemTemplate>
  <asp:LinkButton ID="btnPage"
   style="padding:8px;margin:2px;background:#ffa100;border:solid 1px #666;font:8pt tahoma;"
   CommandName="Page" CommandArgument="<%# Container.DataItem %>"
   runat="server" ForeColor="White" Font-Bold="True">
    <%# Container.DataItem %>
  </asp:LinkButton>
 </ItemTemplate>
</asp:Repeater>

</div>
    </div>
    </form>
</body>
</html>
