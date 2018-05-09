<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reset.aspx.cs" Inherits="Reset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
            <div style="margin-top:50px" class=" col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Create New Password</div>
                    </div>                     
                    <div class="panel-body">
                      
                          <div class="row"> 
                            <div class="form-group">
                                <label for="email" class=" control-label col-sm-3">New password</label>
                                <div class="col-sm-9">
                                   
                                     <asp:TextBox ID="newpassword" class="form-control" runat="server" placeholder="create your new password" ValidationGroup="r" ></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="password required" ControlToValidate="newpassword" Display="Dynamic" ForeColor="Red" ValidationGroup="r"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div style="padding-top:50px;" class="form-group">
                                <label for="email" class=" control-label col-sm-3">Confirm password</label>
                                <div class="col-sm-9">
                                  
                                         <asp:TextBox ID="conpassword" class="form-control" runat="server" placeholder="confirm your new password" ValidationGroup="r" TextMode="Password" ></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="conpassword" Display="Dynamic" ForeColor="#FF3300" ValidationGroup="r"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpassword" ControlToValidate="conpassword" ErrorMessage="Password Not Match" ForeColor="Red" ValidationGroup="r"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Button -->                                 
                                <div class="  col-sm-offset-3 col-sm-9">
                                   
                                    <asp:Button ID="resetpassword" runat="server" class="btn btn-success" Text="Reset Password" OnClick="resetpassword_Click" ValidationGroup="r" />
                                </div>
                            </div>                             
                        </div>
                    </div>
                </div>
            </div>             
        </div>
    </form>
</body>
</html>
