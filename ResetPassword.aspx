<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <title>Reset Your Password</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
	<div id="passwordreset" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Password Reset</div>
                          
                        </div>  
                        <div class="panel-body" >
                          
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                       
                                         <asp:TextBox ID="email" class="form-control"  placeholder="Enter your email address that you used to register" runat="server" ValidationGroup="e"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="email Require" ControlToValidate="email" ForeColor="Red" ValidationGroup="e"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid email Require" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="e"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div style="padding-top:25px;" class="col-md-offset-3 col-md-9">
                                   
                                        <asp:Button ID="ResetPass" runat="server" Text="Send Email" class="btn btn-warning" OnClick="ResetPass_Click" ValidationGroup="e" />
                                    </div>
                                </div>
                                
                                  
                                
                            
                         </div>
                    </div>
         </div> 
    </div>

    </form>
</body>
</html>
