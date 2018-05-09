<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin MasterPage.master" AutoEventWireup="true" CodeFile="SentWorkPermit.aspx.cs" Inherits="Admin_SentWorkPermit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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





    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
               
            
    </div>

  
    	<div style="padding-top: 25px" class="row">
			<div class="col-md-12" style="    padding-right: 5px;
    padding-left: 5px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">SENT FOR WORK PERMIT LIST</h3>
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
							
                            <th>PASSENGER NAME</th>
							
                            <th>DATE OF BIRTH</th>
                            <th>PASSPORT NO</th>
						
                            <th>PP EXPIRY DATE</th>

                            
						
							<th>JOB TRADE</th>
                            
							
                            <th>REMARKS</th>
						
                           
                           
							
                            
						
                            <%--<th>Edit</th>
                            <th>Delete</th>--%>
							
							
							
                          
                            
							</tr>
					</thead>
                      </HeaderTemplate>
					

					
                  <ItemTemplate>
                        <tbody>
						<tr>
							<td><%#Eval("id") %></td>
							
                            <td><%#Eval("name") %></td>
					
                            <td><%#Eval("Birth") %></td>
							<td><%#Eval("Passport_No") %></td>
							
                             <td><%#Eval("Expiry_Date") %></td>
                            
							
							
                             <td><%#Eval("Job_Trade") %></td>
                            
							<td><%#Eval("Remarks") %></td>
                            
					
                            
							
							
                             
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
</asp:Content>

