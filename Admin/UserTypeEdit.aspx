<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin MasterPage.master" AutoEventWireup="true" CodeFile="UserTypeEdit.aspx.cs" Inherits="Admin_UserTypeEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="UserReg.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>


    <div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h5>User Entry</h5>
					
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
								
                                    <asp:TextBox ID="name" class="form-control" placeholder="Enter your Name" runat="server" ValidationGroup="ui" ReadOnly="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Require" ControlToValidate="name" Display="Dynamic" ForeColor="#CC0000" ValidationGroup="ui"></asp:RequiredFieldValidator>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
								
                                    <asp:TextBox ID="email" class="form-control" placeholder="Enter your Email" runat="server" ValidationGroup="ui"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Requird" ControlToValidate="email" Display="Dynamic" ForeColor="#CC0000" ValidationGroup="ui"></asp:RequiredFieldValidator>
								</div>
							</div>
						</div>

<%--						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">UserType</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									
                                     <asp:DropDownList ID="user" runat="server" CssClass="form-control ddl">
                                     <asp:ListItem>Select User Type</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Accounter</asp:ListItem>
                                    <asp:ListItem>DataEntry</asp:ListItem>
                                </asp:DropDownList>      
								</div>
							</div>
						</div>--%>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									 <asp:TextBox ID="password" class="form-control" placeholder="Enter your Password" runat="server" ValidationGroup="ui"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password Required" ControlToValidate="password" Display="Dynamic" ForeColor="Red" ValidationGroup="ui"></asp:RequiredFieldValidator>
								</div>
							</div>
						</div>

					<%--	<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								
                                     <asp:TextBox ID="confirm" class="form-control" placeholder="Confirm your Password" runat="server" TextMode="Password" ValidationGroup="ui"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password Required" ControlToValidate="confirm" Display="Dynamic" ForeColor="Red" ValidationGroup="ui"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not Match" ControlToCompare="password" ControlToValidate="confirm" Display="Dynamic" ForeColor="#FF3300"></asp:CompareValidator>
								</div>
							</div>
						</div>--%>

						<div class="form-group ">
							<%--<a href="http://deepak646.blogspot.in" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>--%>
                            <asp:Button ID="Update_User" runat="server" class="btn btn-danger btn-lg btn-block login-button" Text="Update"  ValidationGroup="ui" onclientclick="Alert_insert()" OnClick="Update_User_Click" />
						</div>
					
				</div>
			</div>
		</div>

    <script type="text/javascript">

        function Alert_insert() {
            if (confirm("Are you sure want to Registered....?")) {

                return true;

            }
            else {
                return false;
            }

        }

    </script> 
</asp:Content>

