<%-- 
    Document   : intrest
    Created on : Aug 22, 2019, 4:59:36 PM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.google.gson.Gson"%>

<select name="interest" id="interest_id" class="browser-default">
            <option value="" disabled selected>Select Interest</option>
    <%
        int cat_id=Integer.parseInt(request.getParameter("value"));
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
        Statement st=con.createStatement();
        ResultSet r=st.executeQuery("select interest_id, interest_name from interest where cid='"+cat_id+"'");
        while(r.next()){
    %>
    <option value="<%=r.getInt("interest_id")%>"><%=r.getString("interest_name")%></option>
    <%}%>
    </select>
