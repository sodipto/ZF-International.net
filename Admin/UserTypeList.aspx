<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin MasterPage.master" AutoEventWireup="true" CodeFile="UserTypeList.aspx.cs" Inherits="Admin_UserTypeList" %>

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
     <div  class ="form-inline" style="text-align:center;">
            <h3>Select User For Edit</h3>
       
    <%--<asp:TextBox ID="SearchTextbox" validationgroup="s" class="form-control" runat="server"></asp:TextBox>--%>

                             <asp:DropDownList ID="UserTable" runat="server" Class="form-control" OnSelectedIndexChanged="UserTable_SelectedIndexChanged">
                                   
                                    <asp:ListItem>Accounter</asp:ListItem>
                                    <asp:ListItem>DataEntry</asp:ListItem>
                                </asp:DropDownList>  
       
         <div class="btn btn-danger glyphicon glyphicon-search">
              <asp:Button ID="Search_Button" validationgroup="s" runat="server" Text="Search" BackColor="Transparent" BorderWidth="0" OnClick="Search_Button_Click"/>
            
        </div> 
          
    </div>


       	<div class="row">
			<div class="col-md-12" style="    padding-right: 5px;
    padding-left: 5px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">All Passenger Withdraw List</h3>
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
                            <th>Name</th>
                            
                            <th>Email</th>
                             <th>Password</th>
						
                            <th>Edit</th>
							
							
							
                          
                            
							</tr>
					</thead>
                      </HeaderTemplate>
					

					
                  <ItemTemplate>
                        <tbody>
						<tr>
							<td><%#Eval("id") %></td>
                            <td><%#Eval("name") %></td>
                            <td><%#Eval("email") %></td>
                              <td><%#Eval("password") %></td>
							
							
							
                             
							


                           
                                       <td style="text-align:center;">

                                <div class="btn btn-success glyphicon glyphicon-ok">
                                    
                                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("id") %>' OnClick="Edit_Click" runat="server" BackColor="Transparent" BorderWidth="0">Edit</asp:LinkButton>
                                </div>

							</td>
                          

                            
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
</asp:Content>

