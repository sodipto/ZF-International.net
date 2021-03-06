﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin MasterPage.master" AutoEventWireup="true" CodeFile="BalanceDetails.aspx.cs" Inherits="Admin_BalanceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <div class="row">
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
					<table class="table table-striped table-bordered" cellspacing="0" width="100%" id="dev-table">
						<thead>
						<tr>
							
							   <th>SR</th>
							
                            <th>JOB TRADE</th>
                            <th>COMPANY NAME</th>
                            <th>PASSENGER NAME</th>
							<th>PASSPORT NO</th>
                            <th>PP EXPIRY DATE</th>
                            <th>DATE OF BIRTH</th>
                            <th>AGENT NAME</th>
                            <th>AMOUNT RECEIVED</th>
						    <th>Date</th>
						
                          
							
							
							
                          
                            
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
                            <td><%#Eval("passportNo") %></td>
                            <td><%#Eval("Expiry_Date") %></td>
                            <td><%#Eval("Birth") %></td>
                            <td><%#Eval("Agent_Name") %></td>
							
                            
                            <td><%#Eval("Balance") %></td>
							
							
                             <td><%#Eval("T_Date") %></td>
							
							
                           
							


                           
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
	
</asp:Content>

