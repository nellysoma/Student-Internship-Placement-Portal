<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%
  String id =  request.getParameter("imgid");//Integer.parseInt(request.getParameter("imgid"));
  try{      
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/psmcomng_siwes","psmcomng_siwesuser","Cs!9JVd_JGhk");
    Statement st=con.createStatement();
    String strQuery = "select passport from applicant where email ='"+id+"'";
    ResultSet rs = st.executeQuery(strQuery);

    String imgLen="";
    if(rs.next()){
      imgLen = rs.getString("passport");
       }  
    rs = st.executeQuery(strQuery);
    if(rs.next()){
      int len = imgLen.length();
      byte [] rb = new byte[len];
      InputStream readImg = rs.getBinaryStream(1);
      int index=readImg.read(rb, 0, len);  
      st.close();
      response.reset();
      response.getOutputStream().write(rb,0,len); 
      response.getOutputStream().flush();    
        
    }
  }
  catch (SQLException e){
    e.printStackTrace();
    out.print(e);
  }
%>
