/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DbConnection;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author harmony
 */
public class ApplicantController extends HttpServlet {
    
    private java.util.Map<String, String[]> sessionMap = new HashMap<String, String[]>();// create HashMap
    
    public String generateRandomNumber(HttpServletRequest request, HttpServletResponse response){
        
        Random r = new Random();

        int check = r.nextInt(9999999);
        
        String stringValueOfCheck = String.valueOf(check);
        
        return stringValueOfCheck;
    }

    public void createApplicantAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, FileNotFoundException, SQLException{
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String role = request.getParameter("role");
        String matNo = request.getParameter("matNo");
        String institute = request.getParameter("institute");
        String faculty = request.getParameter("faculty");
        String department = request.getParameter("department");
        String examType = request.getParameter("examType");
        String examNumber = request.getParameter("examNumber");
        
        String firstIdCharacter = role.substring(0,1);
        System.out.println(firstIdCharacter);
        
        String secondIdCharacter = generateRandomNumber(request, response);
        System.out.println(secondIdCharacter);
        
        String thirdIdCharacter = lastName.substring(0,1).toUpperCase();
        System.out.println(thirdIdCharacter);
        
        String fourthIdCharacter = phone.substring(4, 9);
        System.out.println(fourthIdCharacter);
        
        String fifthIdCharacter = email.substring(0,1).toUpperCase();
        System.out.println(fifthIdCharacter);
        
        String sixthIdCharacter = firstName.substring(0,1);
        System.out.println(sixthIdCharacter);
        
        String id = firstIdCharacter + secondIdCharacter + thirdIdCharacter + fourthIdCharacter + fifthIdCharacter + sixthIdCharacter;
        System.out.println(id);
        
        
        if (!password2.equals(password1)) {

            RequestDispatcher rd = request.getRequestDispatcher("/unmatch_password.jsp");

            rd.forward(request, response);
        } else {
            
            DbConnection createUserAccount = new DbConnection();
            DbConnection createApplicantAccount = new DbConnection();
            
            // Hash User Data	        
            String hPassword = BCrypt.hashpw(password1.trim(), BCrypt.gensalt(15));
            
            createUserAccount.createUserAccount(id,firstName, lastName, phone, email, hPassword,role); 
            createApplicantAccount.createApplicantAccount(id,firstName,lastName,matNo,institute,faculty,department,email,phone,hPassword,examType, examNumber);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/applicant_account_created_successful.jsp");
            rd.forward(request, response);
        }
    }
    
    public void go_to_createApplicantAccountForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        RequestDispatcher rd = request.getRequestDispatcher("/createApplicantAccount.jsp");

        rd.forward(request, response);
    }
    
    public void applicantLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        
        String[] sessionData = (String[])request.getAttribute("sessionData");
        
        HttpSession session = request.getSession(true);
        
        String sessionId = session.getId();

        sessionMap.put(sessionId, sessionData);
        
        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionFirstName = sessionMapValues[1];
        //String sessionLastName = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionFirstName", sessionFirstName);
        //request.setAttribute("sessionLastName", sessionLastName);
        request.setAttribute("sessionUserName", sessionUserName);
        
        RequestDispatcher rd = request.getRequestDispatcher("/applicant/applicantDashboard.jsp");

        rd.forward(request, response);
    }
    
    public void goToViewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionFirstName = sessionMapValues[1];
        String sessionLastName = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];

        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName);
        request.setAttribute("sessionLastName", sessionLastName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/applicant/viewProfile.jsp");

        rd.forward(request, response);
    }
    
    public void goToEditProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionFirstName = sessionMapValues[1];
        String sessionLastName = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];

        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName);
        request.setAttribute("sessionLastName", sessionLastName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/applicant/editProfile.jsp");

        rd.forward(request, response);
    }
    
    public void editProfile(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, ServletException, IOException, FileUploadException {

        //String studentID = request.getParameter("std_id");

        try {
            
            ArrayList<String> filePathArray = new ArrayList();

            String firstName = "";
            String lastName = "";
            String dob = "";
            String gender = "";
            String address = "";
            String city = "";
            String state = "";
            String phone = "";
            String email = "";
            String instituition_name = "";
            String year_of_graduation = "";
            String qualification = "";
            String certificate = "";
            String cert_name = "";
            String cert_file = "";
            String passport = "";
            String allFiles = "";
            String applicant_id = "";
            String sessionId = "";

            String rootPath = System.getProperty("catalina.home");
            ServletContext servletContext = getServletContext();
            String relativePath = servletContext.getInitParameter("fileUploads1.dir");

            File file = new File(rootPath + File.separator + relativePath);
            if (!file.exists()) {
                file.mkdirs();
            }

            // Verify the content type
            String contentType = request.getContentType();

            if ((contentType.indexOf("multipart/form-data") >= 0)) {

                // Create a factory for disk-based file items
                DiskFileItemFactory fileFactory = new DiskFileItemFactory();

                File filesDir = (File) (file);

                fileFactory.setRepository(filesDir);

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(fileFactory);

                // Parse the request to get file items.
                List<FileItem> fileItemsList = upload.parseRequest(request);


                // Process the uploaded items
                Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
                while (fileItemsIterator.hasNext()) {

                    FileItem fileItem = fileItemsIterator.next();

                    if (fileItem.isFormField()) {

                        String name = fileItem.getFieldName();
                        String value = fileItem.getString();

                        if (name.equals("firstName")) {
                            firstName = value;
                        }
                        if (name.equals("lastName")) {
                            lastName = value;
                        }
                        if (name.equals("dob")) {
                            dob = value;
                        }
                        if (name.equals("gender")) {
                            gender = value;
                        }

                        if (name.equals("address")) {
                            address = value;
                        }
                        if (name.equals("city")) {
                            city = value;
                        }
                        if (name.equals("state")) {
                            state = value;
                        }
                        if (name.equals("phone")) {
                            phone = value;
                        }
                        if (name.equals("email")) {
                            email = value;
                        }
                        if (name.equals("phone")) {
                            phone = value;
                        }
                        if (name.equals("instituition_name")) {
                            instituition_name = value;
                        }
                        if (name.equals("year_of_graduation")) {
                            year_of_graduation = value;
                        }
                        if (name.equals("qualification")) {
                            qualification = value;
                        }
                        if (name.equals("cert_name")) {
                            cert_name = value;
                        }
                        if (name.equals("applicant_id")) {
                            applicant_id = value;
                        }
                        
                        if (name.equals("sessionId")) {
                            sessionId = value;
                        }
                        
                    } else {
                        allFiles = rootPath + File.separator + relativePath + File.separator + fileItem.getName();
                        System.out.println("This is what's in allFiles: " + allFiles);
                        File file1 = new File(allFiles);
                        filePathArray.add(allFiles);
                        
                        System.out.println("This is what's in rootPath: " + rootPath);
                        System.out.println("This is what's in relativePath: " + relativePath);
                        System.out.println(fileItem.getName());
                        
                        
                        try {
                            fileItem.write(file1);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }

                }
            }

            certificate = filePathArray.get(0);
            System.out.println("certificate_path is: " + certificate);
            
            cert_file = filePathArray.get(1);
            System.out.println("cert_file_path is: " + cert_file);
            
            passport = filePathArray.get(2);
            System.out.println("passport_path is: " + passport);

            DbConnection editApplicantProfile = new DbConnection();
            DbConnection editApplicantProfileAcademicRecord = new DbConnection();
            DbConnection editApplicantCertification = new DbConnection();
            DbConnection editApplicantPassport = new DbConnection();
            

            editApplicantProfile.editApplicantProfile(applicant_id, firstName, lastName, dob, gender, address, city, state, phone, email);
            editApplicantProfileAcademicRecord.editApplicantProfileAcademicRecord(applicant_id, instituition_name, year_of_graduation, qualification, certificate);
            editApplicantCertification.editApplicantCertification(applicant_id, cert_name, cert_file);
            editApplicantPassport.editApplicantPassport(applicant_id,  passport);
            
            /**registerCompanyData.registerCompanyData(company_name,rc_number, tax_pin, pcn_Number, address, 
                    phone_number, email, state, bank_name, bank_account_name, bank_account_number, account_type,
                    pcn_certificate, cac_certificate);**/

            //String sessionId = request.getParameter("sessionId");

           String[] sessionMapValues = sessionMap.get(sessionId);
            
            request.setAttribute("sessionId", sessionId);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/applicant/edit_profile_successful.jsp");
            rd.forward(request, response);

        } catch (/**ClassNotFoundException | **/FileNotFoundException | FileUploadException error) {
            System.out.print(error);
        }

    }
    
    public void goToViewAllVaccancies(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionFirstName = sessionMapValues[1];
        String sessionLastName = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];

        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName);
        request.setAttribute("sessionLastName", sessionLastName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/applicant/viewAllVacancies.jsp");

        rd.forward(request, response);
    }
    
    public void apply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, FileNotFoundException, SQLException{
        
        String vaccancyId = request.getParameter("vaccancyId");
        String applicantId = request.getParameter("applicantId");
        String companyId = request.getParameter("companyId");
        String sessionId = request.getParameter("sessionId");
                
            DbConnection apply = new DbConnection();
            
            apply.apply(vaccancyId,applicantId,companyId);     
            
            String[] sessionMapValues = sessionMap.get(sessionId);
            
            request.setAttribute("sessionId", sessionId);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/applicant/applicantion_successful.jsp");
            rd.forward(request, response);
        
    }
    
    public void goToViewAppliedJobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionFirstName = sessionMapValues[1];
        String sessionLastName = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];

        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("sessionFirstName", sessionFirstName);
        request.setAttribute("sessionLastName", sessionLastName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/applicant/viewAppliedJobs.jsp");

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
             
             String applicant_action = request.getParameter("applicant_action");
             
             switch (applicant_action) {
                 
                 case "createApplicantAccount":
                    createApplicantAccount(request, response);
                    break;
                case "go_to_createApplicantAccountForm":
                    go_to_createApplicantAccountForm(request, response);
                    break;
                case "applicantLogin":
                    applicantLogin(request, response);
                    break;
                case "goToViewProfile":
                    goToViewProfile(request, response);
                    break;
                case "goToEditProfile":
                    goToEditProfile(request, response);
                    break;
                case "editProfile":
                     editProfile(request, response);
                     break;
                case "goToViewAllVaccancies":
                    goToViewAllVaccancies(request, response);
                    break;
                case "apply":
                    apply(request, response);
                    break;
                case "goToViewAppliedJobs":
                    goToViewAppliedJobs(request, response);
                    break;
                case "logout":
                    logout(request, response);
                    break;
             }
             
         }catch(Exception error){
             
             error.printStackTrace();
         }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
