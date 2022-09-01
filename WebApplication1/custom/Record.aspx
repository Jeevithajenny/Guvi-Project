<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">       
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <title>View</title>    
   <style>
       table { 
	width: 750px; 
	border-collapse: collapse; 
	margin:50px auto;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #eee; 
	}

th { 
	background: #3498db; 
	color: white; 
	font-weight: bold; 
	}

td, th { 
	padding: 10px; 
	border: 1px solid #ccc; 
	text-align: left; 
	font-size: 18px;
	}

/* 
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table { 
	  	width: 100%; 
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}

	td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);

		color: #000;
		font-weight: bold;
	}

}
</style>
</head>
<body class='default'>
   <table id="display">
  <thead>
    <tr>
        <th>ID</th>
      <th>Date</th>
      <th>Description</th>
      <th>Income</th>
      <th>Expense</th>
        <th>Balance</th>
    </tr>
      <button id="homepage"><a href="charts.aspx">Back to Homepage</a></button>
  </thead>
  <tbody>
  </tbody>
       
</table>

</body>
    
<script>
    console.log("Jeevi") 

     $(document).ready(function () {
           str_reponsetext = $.ajax({
            type: "POST",
            cache: false,
               async: false,
               url: "Record_input.aspx",
            dataType: "text", error: ""
            }).responseText; 
         str_reponsetext = eval("(" + str_reponsetext + ")");
         for (let i = 0; i < str_reponsetext.Table.length; i++)
         {
               $('#display tr:last').after(`<tr><td>${str_reponsetext["Table"][i]["ID"]}</td><td>${str_reponsetext["Table"][i]["date"]}</td><td>${str_reponsetext["Table"][i]["description"]}</td><td>${str_reponsetext["Table"][i]["income"]}</td><td>${str_reponsetext["Table"][i]["expense"]}</td><td>${str_reponsetext["Table"][i]["balance"]}</td ></tr > `)
         }
         
    })
</script>
</html>
