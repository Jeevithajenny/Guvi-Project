<%--<%@ Page Language="C#" CodeFile="Dashboard.aspx.cs" Inherits="WebApplication1.Dashboard"%>--%>
<%--<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>--%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="table.css">
       
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="utf-8" />
    <title>Dashboard</title>    
   <style>
      
    </style>
</head>
<body>
    <form name="entry" method="post" runat="server" onsubmit="table_entry()" >
  <table id="Entry" class="content-table">
  <thead>
    <tr>
      <th><input type="button" value="Add Row" id="addrow"></th>
      <th>Date</th>
      <th>Description</th>
      <th>Income</th>
      <th>Expense</th>
      <th>Balance</th>
    </tr>
  </thead>
  <tbody>
    <tr> 
         <td> </td>
      <td><input id="date" name="date" type="datetime-local" required /> </td>
      <td><input id="description" name="description" type="text" value="" required></td>
      <td><input id="income" name="income"  type="number" value="0" required></td>
      <td><input id="expense" name="expense" type="number" value="0" required></td>
        <td><input id="balance" name="balance" type="number" value="0" disabled></td>
    </tr>
   
  </tbody>
</table>
        <button id="table_form_button" type="submit" align-item="center" value="Submit">Submit</button>
        
         <%--<asp:button ID="Button2" class="button"  runat="server" OnClick="table_entry"  Text="Submit"/>--%>
        </form><br />
    <button id="homepage"><a href="charts.aspx">Back to Homepage</a></button>
</body>
    <script>
        $(document).ready(function () {
           str_reponsetext = $.ajax({
            type: "POST",
            cache: false,
               async: false,
               url: "input.aspx?&flag_value=load",
            dataType: "text", error: ""
            }).responseText; 
            str_reponsetext = eval("(" + str_reponsetext + ")");
            $('#balance').val(str_reponsetext.data);
            global_balance = str_reponsetext.data;
        })
        console.log("Jeevi");
        let global_balance = 0;
        $('#addrow').click(() => {
            
            $('#Entry tr:last').after("<tr><td><input name='delete' class='delete' type='button' value='Delete Row' /> </td><td><input name='date' type='datetime-local' /> </td><td><input name='description' type='text' required></td><td><input name='income' type='number' value='0' required></td><td><input name='expense' type='number' value='0'></td><td><input  name='balance' type='number' disabled value='"+$('#Entry tr:last').find('[name=balance]').val()+"'></td ></tr > ")
            math_calculation();

        });
        $("#Entry").on('click', '.delete', function () {
            $(this).closest('tr').remove();
            math_calculation();
        });
        function table_entry()
        {
            jsonObj=[];
        $('#Entry').find('tbody').find('tr').each((i)=>{
        debugger
        let date = $('#Entry').find('tbody').find('tr').find('[name=date]')[i].value
        let description = $('#Entry').find('tbody').find('tr').find('[name=description]')[i].value
        let income =  $('#Entry').find('tbody').find('tr').find('[name=income]')[i].value
               let expense = $('#Entry').find('tbody').find('tr').find('[name=expense]')[i].value
            let balance =  $('#Entry').find('tbody').find('tr').find('[name=balance]')[i].value
                item = {}
                item ["date"] = date;
                item ["description"] = description;
             item ["income"] = income;
                item ["expense"] = expense;
            item ["balance"] = balance;

            jsonObj.push(item);

            })

           str_reponsetext = $.ajax({
            type: "POST",
            cache: false,
               async: false,
               url: "input.aspx?json=" + JSON.stringify(jsonObj),
            dataType: "text", error: ""
        }).responseText; 
        }
        const math_calculation = () => {
            $('[name=income],[name=expense]').bind('input', function () {
                //global_balance = 0;
                global_balance = str_reponsetext.data;
                $('#Entry').find('tbody').find('tr').each((i) => {
                let income = $('#Entry').find('tbody').find('tr').find('[name=income]')[i].value
                let expense = $('#Entry').find('tbody').find('tr').find('[name=expense]')[i].value
                $('#Entry').find('tbody').find('tr').find('[name=balance]')[i].value = parseInt(global_balance) + (income - expense);
                global_balance = $('#Entry').find('tbody').find('tr').find('[name=balance]')[i].value;
            })
        });
        }
        math_calculation();
        
     </script>
</html>
