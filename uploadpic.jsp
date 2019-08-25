<%-- 
    Document   : uploadpic.jsp
    Created on : Aug 16, 2019, 4:04:06 PM
    Author     : Gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String uname=(String)request.getSession().getAttribute("user_sid");
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
            //                     -------------------------- File Transfer Code (Changing Directory) ----------------------------------------
            
                              try{
                    File file ;
                    int maxFileSize = 5000 * 1024;
                    int maxMemSize = 5000 * 1024;
                    String filePath = "C:/Users/Akash/Documents/NetBeansProjects/Forum/web/profile/";
                    String fileName="";
                    String contentType = request.getContentType();
                    System.out.println("In try");
                    if ((contentType.indexOf("multipart/form-data") >= 0)) {
                        System.out.println("In Cond");
                       DiskFileItemFactory factory = new DiskFileItemFactory();
                       factory.setSizeThreshold(maxMemSize);
                       factory.setRepository(new File("c:\\TEMP"));
                       ServletFileUpload upload = new ServletFileUpload(factory);
                       upload.setSizeMax( maxFileSize );
//                       System.out.println("Error here");
                       
                          List fileItems = upload.parseRequest(request);
                          
                          Iterator i = fileItems.iterator();
                          
                          
                          while ( i.hasNext () ) 
                          {
                              System.out.println("In Loop");
                             FileItem fi = (FileItem)i.next();
                             if ( !fi.isFormField () )  {


                                 String fieldName = fi.getFieldName();
                                 fi.getSize();
                                  fileName = fi.getName();
                                 boolean isInMemory = fi.isInMemory();
                                 long sizeInBytes = fi.getSize();
                                 System.out.println(sizeInBytes);
                                 file = new File( filePath + fileName) ;
                                 System.out.println("Hello");
                                 if(sizeInBytes<2000000)
                                 {
                                 fi.write( file ) ;
                                 
                                 }
                                 else
                                 {
                                     String error="Check File Size Of "+fileName;
                                     }
                                 
                                     
                                 System.out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                                  PreparedStatement stmt=con.prepareStatement("update user set dp=? where uname=?");
                                  stmt.setString(1,fileName);
                                  stmt.setString(2,uname);
                                    int j=stmt.executeUpdate();  
                                    response.sendRedirect("profile.jsp");
                            }
                            
                        }
          
                    }
                    else{ 
                            out.println("<html>");
                            out.println("<body>");
                            out.println("<p>No file uploaded</p>"); 
                            out.println("</body>");
                            out.println("</html>");
                        }
                              }
                              catch(Exception e)
                              {
                                  out.println("<script>alert(\'File Size More Than 2MB\')</script>");
                                  response.sendRedirect("profile.jsp");
                                  }

        %>
    </body>
</html>
