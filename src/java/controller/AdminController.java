/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DbConnection;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Company;

/**
 *
 * @author harmony
 */
public class AdminController extends HttpServlet {

    private java.util.Map<String, String[]> sessionMap = new HashMap<String, String[]>();// create HashMap
   
    public void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        
        
        String[] adminSessionData = (String[])request.getAttribute("adminSessionData");
        
        HttpSession session = request.getSession(true);
        
        String sessionId = session.getId();

        sessionMap.put(sessionId, adminSessionData);
        
        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionAdminName = sessionMapValues[1];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionAdminName", sessionAdminName);        
        request.setAttribute("sessionUserName", sessionUserName);
        
        RequestDispatcher rd = request.getRequestDispatcher("/admin/adminDashboard.jsp");

        rd.forward(request, response);
    }
    
    public void goToViewAllCompanies(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionAdminName = sessionMapValues[1];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionAdminName", sessionAdminName);        
        request.setAttribute("sessionUserName", sessionUserName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/viewAllCompanies.jsp");

        rd.forward(request, response);
    }
    
    public void goToSearchCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");
        

        String[] sessionMapValues = sessionMap.get(sessionId);

        String sessionAdminName = sessionMapValues[1];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionAdminName", sessionAdminName);        
        request.setAttribute("sessionUserName", sessionUserName);
        
        try{
            
            String keyword = request.getParameter("keyword");

            DbConnection dbobject = new DbConnection();
            
            List<Company> companySearchList = dbobject.searchCompanyByKeyword(keyword);
            
            request.setAttribute("companySearchList", companySearchList);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/search_company_result.jsp");

        rd.forward(request, response);
        
        } catch (Exception error) {
            error.printStackTrace();
        }
    }
    
    public void viewCompanyToUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         
         String companyId = request.getParameter("companyId");
         String companyName = request.getParameter("companyName");
         String rcNumber = request.getParameter("rcNumber");
         String address = request.getParameter("address");
         String email = request.getParameter("email");
         String phone = request.getParameter("phone");
         String industry = request.getParameter("industry");
         String verificationStatus = request.getParameter("verificationStatus");
         String sessionId = request.getParameter("sessionId");
         
         String[] sessionMapValues = sessionMap.get(sessionId);

         String sessionAdminName = sessionMapValues[1];
         String sessionUserName = sessionMapValues[0];
         
         String[] companyDetails = {companyId,companyName,rcNumber,address,email,phone,industry,verificationStatus};
         
         request.setAttribute("companyDetails", companyDetails);
         
         request.setAttribute("sessionId", sessionId);
         request.setAttribute("sessionAdminName", sessionAdminName);        
         request.setAttribute("sessionUserName", sessionUserName);
         
         RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/viewCompanyToUpdate.jsp");

         rd.forward(request, response);
     }
    
    public void updateCompanyProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         
         String companyId = request.getParameter("companyId");  
         String verificationStatus = request.getParameter("verificationStatus");
         
         String sessionId = request.getParameter("sessionId");
         
         String[] sessionMapValues = sessionMap.get(sessionId);

         String sessionAdminName = sessionMapValues[1];
         String sessionUserName = sessionMapValues[0];
         
         DbConnection dbobject = new DbConnection();
         
         dbobject.updateCompany(companyId,verificationStatus);
         
         request.setAttribute("sessionId", sessionId);
         request.setAttribute("sessionAdminName", sessionAdminName);        
         request.setAttribute("sessionUserName", sessionUserName);
         
         RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/update_company_successful.jsp");

         rd.forward(request, response);
     }
    
    public void goToViewAllStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionAdminName = sessionMapValues[1];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionAdminName", sessionAdminName);        
        request.setAttribute("sessionUserName", sessionUserName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/viewAllStudents.jsp");

        rd.forward(request, response);
    }
    
    public void viewStudentToUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         
         String applicantId = request.getParameter("applicantId");
         String applicantName = request.getParameter("applicantName");
         String email = request.getParameter("email");
         String jamb_exam_number = request.getParameter("jamb_exam_number");
         String jamb_exam_type = request.getParameter("jamb_exam_type");
         String verificationStatus = request.getParameter("verificationStatus");
         String sessionId = request.getParameter("sessionId");
         
         String[] sessionMapValues = sessionMap.get(sessionId);

         String sessionAdminName = sessionMapValues[1];
         String sessionUserName = sessionMapValues[0];
         
         String[] studentDetails = {applicantId,applicantName,email,jamb_exam_number,jamb_exam_type,verificationStatus};
         
         request.setAttribute("studentDetails", studentDetails);
         
         request.setAttribute("sessionId", sessionId);
         request.setAttribute("sessionAdminName", sessionAdminName);        
         request.setAttribute("sessionUserName", sessionUserName);
         
         RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/viewStudentToUpdate.jsp");

         rd.forward(request, response);
     }
    
    public void updateStudentProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         
         String applicantId = request.getParameter("applicantId");  
         String verificationStatus = request.getParameter("verificationStatus");
         
         String sessionId = request.getParameter("sessionId");
         
         String[] sessionMapValues = sessionMap.get(sessionId);

         String sessionAdminName = sessionMapValues[1];
         String sessionUserName = sessionMapValues[0];
         
         DbConnection dbobject = new DbConnection();
         
         dbobject.updateStudentVerificationStatus(applicantId,verificationStatus);
         
         request.setAttribute("sessionId", sessionId);
         request.setAttribute("sessionAdminName", sessionAdminName);        
         request.setAttribute("sessionUserName", sessionUserName);
         
         RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/update_student_successful.jsp");

         rd.forward(request, response);
     }
    
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");
                
        sessionMap.remove(sessionId);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/signin.jsp");
        rd.forward(request, response);
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
             
             String admin_action = request.getParameter("admin_action");
             
             switch (admin_action) {
                 
                 case "adminLogin":
                    adminLogin(request, response);
                    break;
                 case "goToViewAllCompanies":
                    goToViewAllCompanies(request, response);
                    break;
                 case "goToSearchCompany":
                    goToSearchCompany(request, response);
                    break;    
                 case "viewCompanyToUpdate":
                    viewCompanyToUpdate(request, response);
                    break;
                 case "updateCompanyProfile":
                    updateCompanyProfile(request, response);
                    break;
                 case "goToViewAllStudents":
                    goToViewAllStudents(request, response);
                    break;
                 case "viewStudentToUpdate":
                    viewStudentToUpdate(request, response);
                    break;
                 case "updateStudentProfile":
                    updateStudentProfile(request, response);
                    break;
                 case "logout":
                    logout(request, response);
                    break;
             }
             
         }catch(Exception error){
             
             error.printStackTrace();
         }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
