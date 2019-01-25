<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>

    <%@ include file="header.html" %>
    <link rel="stylesheet" type="text/css" href="..\css\signup.css">
</head>


<body>
    <form action="signup_db.jsp">
        <div style="margin-left: 20%">
     <div class="modal-body" style="padding-top:250px;margin-left:30%;  ">
         <h2 class="modal-header">SignUp Form</h2>
     <p>Please fill in this form to create an account.</p>
    <hr>
	<br>
	<label for="sid"><b>Student ID:</b></label><br>
    <input type="text" name="sid" placeholder="Enter Smartcard ID" style="text-transform:uppercase" pattern="[a-z]{0-9}" minlength="10" maxlength="10"required>
	<br><br>
    <label for="Name"><b>Name:</b></label><br>
    <input type="text" name="fname" placeholder="Enter Firstname" style="text-transform:capitalize"  required>&emsp;&nbsp;&nbsp;
    <input type="text" name="lname" placeholder="Enter Lastname" style="text-transform:capitalize"  required>
<br><br>
    <label for="password"><b>Password:</b></label><br>
    <input type="password" name="pass" placeholder="Enter Password" style="width:33%" pattern="(?=.*\d)(?=.*[a-z]).{8,}" required><br><br>
	
	 <label for="dob"><b>Date of birth:</b></label><br>
    <input type="date" name="dob" placeholder="Enter date of birth" style="width:33%" required><br><br>
	 
	 <label for="program"><b>Program:</b></label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;
	 <label for="branch"><b>Branch:</b></label><br>

        <%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    PreparedStatement stmt1=con.prepareStatement("select program_name from program_master");
   
    ResultSet rs1=stmt1.executeQuery();
  %>
  <input type="text" name="program" list="program" style="text-transform:capitalize" placeholder="---select---">&emsp;&emsp;
    <datalist id="program" style="width:34%">
      <%
    while(rs1.next())
    {
       String p_name=rs1.getString(1);
       %>
       <option value="<%=p_name%>"><%=p_name%></option>
       <%
    }
    %>
  </datalist>
  <%
    PreparedStatement stmt2=con.prepareStatement("select branch_name from branch_master");
   
    ResultSet rs2=stmt2.executeQuery();
  %>
    <input type="text" name="branch" list="branch" style="text-transform:capitalize" placeholder="---select---">
    <datalist id="branch" style="width:34%">
      <%
    while(rs2.next())
    {
       String b_name=rs2.getString(1);
       %>
       <option value="<%=b_name%>"><%=b_name%></option>
       <%
    }
    %>
  </datalist>
  <%
    
stmt1.execute();
stmt2.execute();
con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>
	</br></br>
	<label for="email"><b>Email:</b></label><br>
    <input type="email"  name="email" placeholder="Enter Email" style="width:33%" required><br><br>

	<label for="contact_no"><b>Contact:</b></label><br>
    <input type="text" name="contact_no" placeholder="Enter Contact no."  style="width:33%" maxlength="10" pattern="[7-9]{1}[0-9]{9}" required><br><br>

	<label for="address"><b>Address:</b></label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
	<label for="city"><b>City:</b></label><br>
    <input type="text" name="address" placeholder="Enter H.no./street address:" style="width:33%" required>&emsp;&emsp;
	<input type="text" name="city" placeholder="Enter City:" style="width:33%" required><br>
	<br><label for="state"><b>State:</b></label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;
	<label for="pin"><b>Pin Code:</b></label><br>
    <input type="text"  name="state" placeholder="Enter State:" style="width:33%" required>&emsp;&emsp;
	
    <input type="text" name="pin" placeholder="Enter Pincode:"  maxlength="6" pattern="[0-9]{6}"style="width:33%" required><br><br>
	
	<label for="nationality"><b>Nationality:</b></label><br>
    <input type="text"  name="nationality" style="text-transform:capitalize" placeholder="Enter Nationality:"  style="width:33%" required><br><br>
	
	<label for="s_que"><b>Security Question:</b></label><br>
		<select name="s_que" placeholder="---select---" style="width:34%">
	<option value="2">---select---</option>
	<option value="132">What is your pet name?</option>
	<option value="554">What is your favourite color?</option>
	
	</select><br><br>
	<label for="s_ans"><b>Security answer:</b></label><br>
    <input type="text" placeholder="Enter Answer" name="s_ans" style="width:33%" required><br><br>
	
	 
    <span> <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px">By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.
      <br>
      <button type="button" class="cancelbtn">Cancel</button>
      <input type="submit" class="signupbtn">Sign Up<br>
      <br></span>
   
	
	  
     </div>
    </div>
      
 </form>
        </body>
</html>