<%@ Page Language="C#" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default"%>
<%--<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>--%>
<html>
<link rel="stylesheet" href="style1.css">

<body>
	<section>
	 <div class="container">
      <div class="card">
        <div class="card_title">
          <h1>Create Account</h1>
        </div>
        <div class="form">
        <form name="signup" method="post" runat="server" >
          <input type="text" name="username" id="username" placeholder="UserName" />
          <input type="email" name="email" placeholder="Email" id="email" />
          <input type="password" name="password" placeholder="Password" id="password" />
          <asp:button ID="Button1" class="button"  runat="server" OnClick="check_login"  Text="SignUp"/>
          </form>
        </div>
      </div>
    </div>
		</section>
</body>
    <script>
        console.log("Jeevitha");
        $('#logincheckbox,#signupcheckbox').click(() => { $('#emaillog,#pswdlog').val('') });
        $('#logincheckbox,#signupcheckbox').click(() => { $('#username,#email,#password').val('') });
    </script>
</html>
