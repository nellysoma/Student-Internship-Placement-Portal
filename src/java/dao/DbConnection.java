
package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Applicant;
import model.Company;
import model.Vacancy;

/**
 *
 * @author harmony
 */
public class DbConnection {

    private static final String DATABASE_URL = "jdbc:mysql://localhost/siwes?serverTimezone=UTC";//psmcomng_siwes
    private static final String USERNAME = "root";//psmcomng_siwesuser
    private static final String PASSWORD = "root";//Cs!9JVd_JGhk
    private static Connection connection = null;//manage connection

    private Statement selectUser = null;
    private Statement selectApplicantData = null;
    private Statement selectApplicantAcademicData = null;
    private Statement selectApplicantCertificationData = null;
    private Statement selectCompanyUser = null;
    private Statement selectAdminUser = null;
    private Statement checkApplicantUsernameEntry = null;
    private Statement checkCompanyUsernameEntry = null;
    private Statement checkAdminUsernameEntry = null;
    private Statement viewAllCompany = null;
    private Statement searchCompanyByKeyword = null;
    private Statement selectComapnyData = null;
    private Statement viewAllVacancy = null;
    private Statement viewAllJobsApplied = null;
    private Statement viewAllVacancyByCompany = null;
    private Statement viewApplicationsByCompany = null;
    private Statement getStudentVerificatioStatus = null;
    private Statement viewAllApplicants = null;
    
    private PreparedStatement createApplicantAccount = null;
    private PreparedStatement createUserAccount = null;
    private PreparedStatement editApplicantProfile = null;
    private PreparedStatement editApplicantProfileAcademicRecord = null;
    private PreparedStatement editApplicantCertification = null;
    private PreparedStatement registerApplicantIDForAcademicRecord = null;
    private PreparedStatement registerApplicantIDForCertification = null;
    private PreparedStatement editApplicantPassport = null;
    private PreparedStatement createCompanyAccount = null;
    private PreparedStatement createCompanyUserAccount = null;
    private PreparedStatement updateCompany = null;
    private PreparedStatement editCompanyProfile = null;
    private PreparedStatement createNewVacancy = null;
    private PreparedStatement apply = null;
    private PreparedStatement invite = null;
    private PreparedStatement updateStudent = null;
    
    private ResultSet selectUserResult = null;
    private ResultSet selectApplicantDataResult = null;
    private ResultSet selectApplicantAcademicDataResult = null;
    private ResultSet selectApplicantCertificationDataResult = null;
    private ResultSet selectCompanyUserResult = null;
    private ResultSet selectAdminUserResult = null;
    private ResultSet checkApplicantUsernameResultEntry = null;
    private ResultSet checkCompanyUsernameResultEntry = null;
    private ResultSet checkAdminUsernameResultEntry = null;
    private ResultSet viewAllCompanyResult = null;
    private ResultSet searchCompanyByKeywordResult = null;
    private ResultSet selectCompanyDataResult = null;
    private ResultSet viewAllVacancyResult = null;
    private ResultSet viewAllJobsAppliedResult = null;
    private ResultSet viewAllVacancyByCompanyResult = null;
    private ResultSet viewApplicationsByCompanyResult = null;
    private ResultSet getStudentVerificatioStatusResult = null;
    private ResultSet viewAllApplicantResult = null;
    
    FileInputStream fis1;
    FileInputStream fis2;
    FileInputStream fis3;

    public static void connectToDataBase() throws ClassNotFoundException {

        try {

            // Load (and therefore register) the  Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get a Connection to the database
            connection = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);

        } catch (SQLException error) {

            System.out.print(error.getMessage());
            error.printStackTrace();
            System.out.print("What is trying to say here is that, it could not connect to the database");

        }
    }

    private void closeConnection(Connection connection) {
        if (connection == null) {
            return;
        }
        try {
            connection.close();
        } catch (SQLException ex) {
        }
    }

    public void createUserAccount(String id, String first_name, String last_name, String phone, String email,
            String password, String role) throws ClassNotFoundException, FileNotFoundException, SQLException {
        try {

            connectToDataBase();

            createUserAccount = connection.prepareStatement("INSERT INTO user(id,first_name,last_name,"
                    + "phone,email,password,role)VALUES(?,?,?,?,?,?,?)");

            createUserAccount.setString(1, id);
            createUserAccount.setString(2, first_name);
            createUserAccount.setString(3, last_name);
            createUserAccount.setString(4, phone);
            createUserAccount.setString(5, email);
            createUserAccount.setString(6, password);
            createUserAccount.setString(7, role);

            createUserAccount.executeUpdate();
            
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public void createApplicantAccount(String id, String first_name, String last_name,String mat_no, 
            String institute_name,String faculty,String department,String email,String phone,String password,
            String jamb_exam_type,String jamb_exam_number) throws ClassNotFoundException, FileNotFoundException, SQLException {

        String studentName = first_name + " " + last_name;
        String role = "applicant";
        
        try {

            connectToDataBase();

            createApplicantAccount = connection.prepareStatement("INSERT INTO student(applicant_id_number,student_name,"
                    + "mat_no,institute_name,faculty,department,email,phone,password,jamb_exam_type,jamb_exam_number,role)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");

            createApplicantAccount.setString(1, id);
            createApplicantAccount.setString(2, studentName);
            createApplicantAccount.setString(3, mat_no);
            createApplicantAccount.setString(4, institute_name);
            createApplicantAccount.setString(5, faculty);  
            createApplicantAccount.setString(6, department);
            createApplicantAccount.setString(7, email);
            createApplicantAccount.setString(8, phone);
            createApplicantAccount.setString(9, password);
            createApplicantAccount.setString(10, jamb_exam_type);
            createApplicantAccount.setString(11, jamb_exam_number);
            createApplicantAccount.setString(12, role);

            createApplicantAccount.executeUpdate();
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }
    
    private void registerApplicantIDForAcademicRecord(String id) throws ClassNotFoundException, FileNotFoundException, SQLException {

        try {

            connectToDataBase();

            registerApplicantIDForAcademicRecord = connection.prepareStatement("INSERT INTO applicant_academic_record(applicant_id)VALUES(?)");

            registerApplicantIDForAcademicRecord.setString(1, id);                     

            registerApplicantIDForAcademicRecord.executeUpdate();
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }
    
    private void registerApplicantIDForCertification(String id) throws ClassNotFoundException, FileNotFoundException, SQLException {

        try {

            connectToDataBase();

            registerApplicantIDForCertification = connection.prepareStatement("INSERT INTO applicant_certification(applicant_id)VALUES(?)");

            registerApplicantIDForCertification.setString(1, id);                     

            registerApplicantIDForCertification.executeUpdate();
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }

    public String[] userLogin(String username, String password) throws ClassNotFoundException {

        String firstName = "";
        String lastName = "";
        String phone = "";
        String role = "";
        String username1 = "";
        

        try {

            connectToDataBase();

            String sql = "SELECT * FROM user WHERE email = '" + username + "'";

            selectUser = connection.createStatement();

            selectUserResult = selectUser.executeQuery(sql);

            while (selectUserResult.next()) {
                username1 = selectUserResult.getString("email");
                password = selectUserResult.getString("password");
                firstName = selectUserResult.getString("first_name");
                lastName = selectUserResult.getString("last_name");

                phone = selectUserResult.getString("phone");
                role = selectUserResult.getString("role");
                //verificationStatus = selectUserResult.getString("veerification_status");
            }

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
        return new String[]{password, firstName, lastName, username1, role};
    }
    
    public String getStudentVerificatioStatus(String username) throws ClassNotFoundException{
        
        String verificationStatus = "";
        
        try{
            
            connectToDataBase();
            
            String sql = "SELECT verification_status FROM student WHERE email = '" + username + "'";
            
            getStudentVerificatioStatus = connection.createStatement();

            getStudentVerificatioStatusResult = getStudentVerificatioStatus.executeQuery(sql);
            
            while (getStudentVerificatioStatusResult.next()) {
                
                verificationStatus = getStudentVerificatioStatusResult.getString("verification_status");
            }
            
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
        
        return verificationStatus;
    }

    public String[] viewApplicantInformation(String email) throws ClassNotFoundException{
         
         Applicant ap = new Applicant();
         
          
          String applicant_id_number = "";
          String first_name = "";
          String last_name = "";
          String dob = "";
          String gender = "";
          String address = "";
          String city = "";
          String state = "";
          String phone = "";
          String passport = "";
          String applicant_id = "";
          

         try {
             
             String sql = "SELECT * FROM student where email = '"+email+"'";
             
             connectToDataBase();
             
             selectApplicantData = connection.createStatement();
             
             selectApplicantDataResult = selectApplicantData.executeQuery(sql);
             
             selectApplicantDataResult.next();
             
             applicant_id_number = ap.setApplicantIdNumber(selectApplicantDataResult.getString("applicant_id_number"));
             first_name = ap.setFirstName(selectApplicantDataResult.getString("first_name")); 
             last_name = ap.setLastName(selectApplicantDataResult.getString("last_name"));
             dob = ap.setDob(selectApplicantDataResult.getString("dob"));
             gender = ap.setGender(selectApplicantDataResult.getString("gender"));
             address = ap.setAddress(selectApplicantDataResult.getString("address"));
             city = ap.setCity(selectApplicantDataResult.getString("city"));
             state = ap.setState(selectApplicantDataResult.getString("state"));
             phone = ap.setPhone(selectApplicantDataResult.getString("phone"));
             passport = ap.setPassport(selectApplicantDataResult.getString("passport"));
             applicant_id = ap.setApplicantId(selectApplicantDataResult.getString("applicant_id"));
                            
         }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
         
         return new String[]{applicant_id_number,first_name,last_name,dob,gender,address,city,state,phone,email,passport,applicant_id};
    }
    
    public String[] viewApplicantAcademicInformation(String email) throws ClassNotFoundException{
         
         Applicant ap = new Applicant();
         
          
         String instituition_name = "";
         String year_of_graduation = "";
         String qualification = "";
         String certificate = "";
          
          

         try {
             
             String sql = "SELECT * FROM applicant_academic_record where email = '"+email+"'";
             
             connectToDataBase();
             
             selectApplicantAcademicData = connection.createStatement();
             
             selectApplicantAcademicDataResult = selectApplicantAcademicData.executeQuery(sql);
             
             selectApplicantAcademicDataResult.next();
             
             instituition_name = ap.setApplicantIdNumber(selectApplicantAcademicDataResult.getString("instituition_name"));
             year_of_graduation = ap.setFirstName(selectApplicantAcademicDataResult.getString("year_of_graduation")); 
             qualification = ap.setLastName(selectApplicantAcademicDataResult.getString("qualification"));
             certificate = ap.setDob(selectApplicantAcademicDataResult.getString("certificate"));
             
         }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
         
         return new String[]{instituition_name,year_of_graduation,qualification,certificate};
    }
    
    public String[] viewApplicantCertification(String email) throws ClassNotFoundException{
         
         Applicant ap = new Applicant();
         
          String cert_name = "";
          String cert_file = "";
          
         try {
             
             String sql = "SELECT * FROM applicant_certification where email = '"+email+"'";
             
             connectToDataBase();
             
             selectApplicantCertificationData = connection.createStatement();
             
             selectApplicantCertificationDataResult = selectApplicantCertificationData.executeQuery(sql);
             
             selectApplicantCertificationDataResult.next();
             
             cert_name = ap.setApplicantIdNumber(selectApplicantCertificationDataResult.getString("cert_name"));
             cert_file = ap.setFirstName(selectApplicantCertificationDataResult.getString("cert_file")); 
             
             
         }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
         
         return new String[]{cert_name,cert_file};
    }
    
    public void editApplicantProfile(String applicant_id, String first_name, String last_name,
            String dob,String gender,String address,String city,String state,String phone,String email){
        
        try{
            connectToDataBase();
            String sql = "UPDATE applicant SET  first_name = '"+first_name+"',"
                    + "last_name = '"+last_name+"',dob = '"+dob+"',gender = '"+gender+"',address = '"+address+"'"
                    + ",city = '"+city+"',state = '"+state+"',phone = '"+phone+"',email = '"+email+"' WHERE applicant_id_number = '"+applicant_id+"' ";
            editApplicantProfile = connection.prepareStatement(sql);
            editApplicantProfile.executeUpdate();
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public void editApplicantProfileAcademicRecord(String applicant_id, String instituition_name, String year_of_graduation,
            String qualification,String certificate) throws FileNotFoundException{
        
        try{
            connectToDataBase();
            File file = new File(certificate);
            
            String sql = "UPDATE applicant_academic_record SET certificate = ?, instituition_name = '"+instituition_name+"',"
                    + "year_of_graduation = '"+year_of_graduation+"',qualification = '"+qualification+"'WHERE applicant_id = '"+applicant_id+"' ";
            
            editApplicantProfileAcademicRecord = connection.prepareStatement(sql);
            
            fis1 = new FileInputStream(certificate);
            
            editApplicantProfileAcademicRecord.setBinaryStream(1, (InputStream) fis1, (int) (file.length()));
            
            editApplicantProfileAcademicRecord.executeUpdate();
            
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public void editApplicantCertification(String applicant_id, String cert_name, String cert_file) throws FileNotFoundException{
        
        try{
            connectToDataBase();
            File file = new File(cert_file);
            
            String sql = "UPDATE applicant_certification SET cert_file = ?, cert_name = '"+cert_name+"'WHERE applicant_id = '"+applicant_id+"' ";
            
            editApplicantCertification = connection.prepareStatement(sql);
            
            fis2 = new FileInputStream(cert_file);
            
            editApplicantCertification.setBinaryStream(1, (InputStream) fis2, (int) (file.length()));
            
            editApplicantCertification.executeUpdate();
            
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public void editApplicantPassport(String applicant_id, String passport) throws FileNotFoundException{
        
        try{
            connectToDataBase();
            File file = new File(passport);
            
            String sql = "UPDATE applicant SET passport = ? WHERE applicant_id_number = '"+applicant_id+"' ";
            
            editApplicantPassport = connection.prepareStatement(sql);
            
            fis3 = new FileInputStream(passport);
            
            editApplicantPassport.setBinaryStream(1, (InputStream) fis3, (int) (file.length()));
            
            editApplicantPassport.executeUpdate();
            
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public void createCompanyAccount(String company_name, String rc_number, String address, 
             String industry, String email, String phone, String password, String role) throws ClassNotFoundException, FileNotFoundException, SQLException {

        try {

            connectToDataBase();

            createCompanyAccount = connection.prepareStatement("INSERT INTO company(company_name,rc_number,address,"
                    + "industry,email,phone,password,role)VALUES(?,?,?,?,?,?,?,?)");

            createCompanyAccount.setString(1, company_name);
            createCompanyAccount.setString(2, rc_number);
            createCompanyAccount.setString(3, address);
            createCompanyAccount.setString(4, industry);
            createCompanyAccount.setString(5, email);
            createCompanyAccount.setString(6, phone);
            createCompanyAccount.setString(7, password);
            createCompanyAccount.setString(8, role);

            createCompanyAccount.executeUpdate();
            
            createCompanyUserAccount(rc_number,  company_name,  rc_number,  phone,  email, password,  role);
            
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }
     
    public String[] companyLogin(String username, String password) throws ClassNotFoundException {

        String companyName = "";
        String rc_number = "";
        String role = "";
        String username1 = "";
        String verificationStatus = "";

        try {

            connectToDataBase();

            String sql = "SELECT * FROM company WHERE email = '" + username + "'";

            selectCompanyUser = connection.createStatement();

            selectCompanyUserResult = selectCompanyUser.executeQuery(sql);

            while (selectCompanyUserResult.next()) {
                username1 = selectCompanyUserResult.getString("email");
                password = selectCompanyUserResult.getString("password");
                companyName = selectCompanyUserResult.getString("company_name");
                rc_number = selectCompanyUserResult.getString("rc_number");
                role = selectCompanyUserResult.getString("role");
                verificationStatus = selectCompanyUserResult.getString("verification_status");
            }

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
        return new String[]{password, companyName, rc_number, username1, role,verificationStatus};
    }
    
    public void createCompanyUserAccount(String id, String company_name, String rc_number, String phone, String email,
            String password, String role) throws ClassNotFoundException, FileNotFoundException, SQLException {

        try {

            connectToDataBase();

            createCompanyUserAccount = connection.prepareStatement("INSERT INTO user(id,first_name,last_name,"
                    + "phone,email,password,role)VALUES(?,?,?,?,?,?,?)");

            createCompanyUserAccount.setString(1, id);
            createCompanyUserAccount.setString(2, company_name);
            createCompanyUserAccount.setString(3, rc_number);
            createCompanyUserAccount.setString(4, phone);
            createCompanyUserAccount.setString(5, email);
            createCompanyUserAccount.setString(6, password);
            createCompanyUserAccount.setString(7, role);

            createCompanyUserAccount.executeUpdate();
            
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }
    
    public String[] adminLogin(String username, String password) throws ClassNotFoundException {

        String firstName = "";
        String lastName = "";
        String role = "";
        String username1 = "";
        

        try {

            connectToDataBase();

            String sql = "SELECT * FROM admin WHERE username = '" + username + "'";

            selectAdminUser = connection.createStatement();

            selectAdminUserResult = selectAdminUser.executeQuery(sql);

            while (selectAdminUserResult.next()) {
                username1 = selectAdminUserResult.getString("username");
                password = selectAdminUserResult.getString("password");
                firstName = selectAdminUserResult.getString("first_name");
                lastName = selectAdminUserResult.getString("last_name");
                role = selectAdminUserResult.getString("role");
                
            }

        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
        return new String[]{password, firstName, lastName, username1, role};
    }
    
    public int checkApplicantUsernameEntry(String email) throws ClassNotFoundException{
        
        int result = 0;
        try{
            connectToDataBase();
            
            String sql = "SELECT * FROM student WHERE email = '"+email+"'";
            
            checkApplicantUsernameEntry = connection.createStatement();
            
            checkApplicantUsernameResultEntry = checkApplicantUsernameEntry.executeQuery(sql);
            
            if(checkApplicantUsernameResultEntry.next()){
                
               result = 1; 
            }
            
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return result;
    }
    
    public int checkCompanyUsernameEntry(String email) throws ClassNotFoundException{
        
        int result = 0;
        try{
            connectToDataBase();
            
            String sql = "SELECT * FROM company WHERE email = '"+email+"'";
            
            checkCompanyUsernameEntry = connection.createStatement();
            
            checkCompanyUsernameResultEntry = checkCompanyUsernameEntry.executeQuery(sql);
            
            if(checkCompanyUsernameResultEntry.next()){
                
               result = 1; 
            }
            
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return result;
    }
    
    public int checkAdminUsernameEntry(String username) throws ClassNotFoundException{
        
        int result = 0;
        try{
            connectToDataBase();
            
            String sql = "SELECT * FROM admin WHERE username = '"+username+"'";
            
            checkAdminUsernameEntry = connection.createStatement();
            
            checkAdminUsernameResultEntry = checkAdminUsernameEntry.executeQuery(sql);
            
            if(checkAdminUsernameResultEntry.next()){
                
               result = 1; 
            }
            
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return result;
    }
    
    public List<Company> viewAllCompany() throws ClassNotFoundException {
        
        List<Company> result = new ArrayList();
        
        try {
            
            
             String sql = "SELECT @row_num:= @row_num+1 rowNumber,company_id,company_name,rc_number,address,industry,email,phone,verification_status,role FROM company,(SELECT @row_num := 0)r";
            
            connectToDataBase();
            
            viewAllCompany = connection.createStatement();
            
            viewAllCompanyResult = viewAllCompany.executeQuery(sql);
                        
            while(viewAllCompanyResult.next()){
                
            Company c = new Company();
            
            c.setCompanyId(viewAllCompanyResult.getString("company_id"));
            c.setCompanyName(viewAllCompanyResult.getString("company_name"));
            c.setRcNumber(viewAllCompanyResult.getString("rc_number"));
            c.setAddress(viewAllCompanyResult.getString("address"));
            c.setIndustry(viewAllCompanyResult.getString("industry"));
            c.setEmail(viewAllCompanyResult.getString("email"));
            c.setPhone(viewAllCompanyResult.getString("phone"));
            c.setVerificationStatus(viewAllCompanyResult.getString("verification_status"));
            c.setRowNumber(viewAllCompanyResult.getString("rowNumber"));
                       
            result.add(c);
            }   
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        
        return result;
    }
    
    public List<Applicant> viewAllApplicants() throws ClassNotFoundException {
        
        List<Applicant> result = new ArrayList();
        
        try {
            
            
             String sql = "SELECT @row_num:= @row_num+1 rowNumber, student_id,applicant_id_number,"
                     + "student_name,mat_no,institute_name,faculty,department,email,phone,jamb_exam_type,"
                     + "jamb_exam_number,verification_status FROM student,(SELECT @row_num := 0)r";
            
            connectToDataBase();
            
            viewAllApplicants = connection.createStatement();
            
            viewAllApplicantResult = viewAllApplicants.executeQuery(sql);
                        
            while(viewAllApplicantResult.next()){
                
            Applicant a = new Applicant();
            
            a.setApplicantId(viewAllApplicantResult.getString("student_id"));
            a.setStudentName(viewAllApplicantResult.getString("student_name"));
            a.setMatNo(viewAllApplicantResult.getString("mat_no"));
            a.setInstituitionName(viewAllApplicantResult.getString("institute_name"));
            a.setFaculty(viewAllApplicantResult.getString("faculty"));
            a.setDepartment(viewAllApplicantResult.getString("department"));
            a.setEmail(viewAllApplicantResult.getString("email"));
            a.setPhone(viewAllApplicantResult.getString("phone"));
            a.setJambExamType(viewAllApplicantResult.getString("jamb_exam_type"));
            a.setJambExamNumber(viewAllApplicantResult.getString("jamb_exam_number"));
            a.setVerificationStatus(viewAllApplicantResult.getString("verification_status"));
            a.setRowNumber(viewAllApplicantResult.getString("rowNumber"));
                       
            result.add(a);
            }   
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        
        return result;
    }
    
    public List<Company> searchCompanyByKeyword(String keyWord) throws ClassNotFoundException {
        
        List<Company> result = new ArrayList();
        
        try {
            
            String sql = "select * from company"
                + " where company_id like '%"
                + keyWord.trim()
                + "%'"
                + " or company_name like '%"
                + keyWord.trim()
                + "%'";
            
            connectToDataBase();
            
            searchCompanyByKeyword = connection.createStatement();
            
            
            searchCompanyByKeywordResult = searchCompanyByKeyword.executeQuery(sql);
            
            
            while(searchCompanyByKeywordResult.next()){
                
            Company c = new Company();
            
            
            c.setCompanyId(viewAllCompanyResult.getString("company_id"));
            c.setCompanyName(viewAllCompanyResult.getString("company_name"));
            c.setRcNumber(viewAllCompanyResult.getString("rc_number"));
            c.setAddress(viewAllCompanyResult.getString("address"));
            c.setIndustry(viewAllCompanyResult.getString("industry"));
            c.setEmail(viewAllCompanyResult.getString("email"));
            c.setPhone(viewAllCompanyResult.getString("phone"));
            c.setVerificationStatus(viewAllCompanyResult.getString("verification_status"));
            c.setRowNumber(viewAllCompanyResult.getString("row_number"));           
            
            result.add(c);
            } 
            
    }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        
        return result;
    }
    
    public void updateCompany(String company_id, String verification_status){
        
        try{
            connectToDataBase();
            String sql = "UPDATE company SET  verification_status = '"+verification_status+"' WHERE company_id = '"+company_id+"' ";
            updateCompany = connection.prepareStatement(sql);
            updateCompany.executeUpdate();
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public String[] viewCompanyInformation(String email) throws ClassNotFoundException{
         
         Company c = new Company();
         
          
           String company_id = "";
           String company_name = "";
           String rc_number = "";
           String address = "";
           String industry = "";           
           String phone = "";
           String verification_status = "";
    
          

         try {
             
             String sql = "SELECT * FROM company where email = '"+email+"'";
             
             connectToDataBase();
             
             selectComapnyData = connection.createStatement();
             
             selectCompanyDataResult = selectComapnyData.executeQuery(sql);
             
             selectCompanyDataResult.next();
             
             company_id = c.setCompanyId(selectCompanyDataResult.getString("company_id"));
             company_name = c.setCompanyName(selectCompanyDataResult.getString("company_name"));
             rc_number = c.setRcNumber(selectCompanyDataResult.getString("rc_number"));
             address = c.setAddress(selectCompanyDataResult.getString("address"));
             industry = c.setIndustry(selectCompanyDataResult.getString("industry"));
             phone = c.setPhone(selectCompanyDataResult.getString("phone"));
             verification_status = c.setVerificationStatus(selectCompanyDataResult.getString("verification_status"));
             
                            
         }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
         
         return new String[]{company_id,company_name,rc_number,address,industry,phone,verification_status,email};
    }
    
    public void editCompanyProfile(String company_id, String company_name, String rc_number,
            String address,String industry,String phone,String email){
        
        try{
            connectToDataBase();
            String sql = "UPDATE company SET  company_name = '"+company_name+"',"
                    + "rc_number = '"+rc_number+"',address = '"+address+"',industry = '"+industry+"',email = '"+email+"'"
                    + ",phone = '"+phone+"' WHERE company_id = '"+company_id+"' ";
            editCompanyProfile = connection.prepareStatement(sql);
            editCompanyProfile.executeUpdate();
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public void createNewVacancy(String company_id, String company_name, String state_location, 
             String job_title, String job_description, String salary, String qualification) throws ClassNotFoundException, FileNotFoundException, SQLException {

        try {

            connectToDataBase();

            createNewVacancy = connection.prepareStatement("INSERT INTO vaccancy(company_id,company_name,state_location,job_title,"
                    + "job_description,salary,qualification)VALUES(?,?,?,?,?,?,?)");

            createNewVacancy.setString(1, company_id);
            createNewVacancy.setString(2, company_name);
            createNewVacancy.setString(3, state_location);
            createNewVacancy.setString(4, job_title);
            createNewVacancy.setString(5, job_description);
            createNewVacancy.setString(6, salary);
            createNewVacancy.setString(7, qualification);
            
            createNewVacancy.executeUpdate();
            
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }
    
    public List<Vacancy> viewAllVacancy() throws ClassNotFoundException {
        
        List<Vacancy> result = new ArrayList();
        
        try {
            
            
             String sql = "SELECT @row_num:= @row_num+1 rowNumber,vaccancy_id,company_id,company_name,state_location,job_title,job_description,salary,qualification FROM vaccancy,(SELECT @row_num := 0)r";
            
            connectToDataBase();
            
            viewAllVacancy = connection.createStatement();
            
            viewAllVacancyResult = viewAllVacancy.executeQuery(sql);
                        
            while(viewAllVacancyResult.next()){
                
            Vacancy v = new Vacancy();
            
            v.setVaccancyId(viewAllVacancyResult.getString("vaccancy_id"));
            v.setCompanyId(viewAllVacancyResult.getString("company_id"));
            v.setCompanyName(viewAllVacancyResult.getString("company_name"));
            v.setLocation(viewAllVacancyResult.getString("state_location"));
            v.setJobTitle(viewAllVacancyResult.getString("job_title"));
            v.setJobDescription(viewAllVacancyResult.getString("job_description"));
            v.setSalary(viewAllVacancyResult.getString("salary"));
            v.setQualification(viewAllVacancyResult.getString("qualification"));
            v.setRowNumber(viewAllVacancyResult.getString("rowNumber"));
                       
            result.add(v);
            }   
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        
        return result;
    }
    
    public void apply(String vaccancy_id, String applicant_id,String company_id) throws ClassNotFoundException, FileNotFoundException, SQLException {

        try {

            connectToDataBase();

            apply = connection.prepareStatement("INSERT INTO application(vaccancy_id,applicant_id,company_id)VALUES(?,?,?)");

            apply.setString(1, vaccancy_id);
            apply.setString(2, applicant_id);
            apply.setString(3, company_id);
            
            apply.executeUpdate();
            
        } catch (SQLException error) {

            error.printStackTrace();
            System.out.print(error);
        } finally {
            closeConnection(connection);
        }
    }
    
    public List<Vacancy> viewAllJobsApplied(String applicantId) throws ClassNotFoundException {
        
        List<Vacancy> result = new ArrayList();
        
        try {
            
            
             //String sql = "SELECT @row_num:= @row_num + 1 AS row_number,application_id,vaccancy_id,applicant_id,invite_status FROM vaccancy,(SELECT @row_num := 0)r";
             String sql = "SELECT @row_num:= @row_num+1 rowNumber,vaccancy.company_name,vaccancy.state_location,vaccancy.job_title,vaccancy.job_description,\n" +
"vaccancy.salary,vaccancy.qualification, application.invite_status FROM vaccancy INNER JOIN application  ON application.vaccancy_id = vaccancy.vaccancy_id\n" +
",(SELECT @row_num := 0)r WHERE application.applicant_id = '"+applicantId+"'";
            
            connectToDataBase();
            
            viewAllJobsApplied = connection.createStatement();
            
            viewAllJobsAppliedResult = viewAllJobsApplied.executeQuery(sql);
                        
            while(viewAllJobsAppliedResult.next()){
                
            
            Vacancy v = new Vacancy();
            
            v.setInviteStatus(viewAllJobsAppliedResult.getString("invite_status"));
            //v.setVaccancyId(viewAllJobsAppliedResult.getString("vaccancy_id"));
            //v.setCompanyId(viewAllJobsAppliedResult.getString("company_id"));
            v.setCompanyName(viewAllJobsAppliedResult.getString("company_name"));
            v.setLocation(viewAllJobsAppliedResult.getString("state_location"));
            v.setJobTitle(viewAllJobsAppliedResult.getString("job_title"));
            v.setJobDescription(viewAllJobsAppliedResult.getString("job_description"));
            v.setSalary(viewAllJobsAppliedResult.getString("salary"));
            v.setQualification(viewAllJobsAppliedResult.getString("qualification"));
            v.setRowNumber(viewAllJobsAppliedResult.getString("rowNumber"));
                       
            result.add(v);
            }   
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        
        return result;
    }
    
    public List<Vacancy> viewAllVacancyByCompany(String companyId) throws ClassNotFoundException {
        
        List<Vacancy> result = new ArrayList();
        
        try {
            
            
             String sql = "SELECT @row_num:= @row_num+1 rowNumber,vaccancy_id,company_id,company_name,state_location,job_title,job_description,salary,qualification FROM vaccancy,(SELECT @row_num := 0)r WHERE company_id = '"+companyId+"'";
            
            connectToDataBase();
            
            viewAllVacancyByCompany = connection.createStatement();
            
            viewAllVacancyByCompanyResult = viewAllVacancyByCompany.executeQuery(sql);
                        
            while(viewAllVacancyByCompanyResult.next()){
                
            Vacancy v = new Vacancy();
            
            v.setVaccancyId(viewAllVacancyByCompanyResult.getString("vaccancy_id"));
            v.setCompanyId(viewAllVacancyByCompanyResult.getString("company_id"));
            v.setCompanyName(viewAllVacancyByCompanyResult.getString("company_name"));
            v.setLocation(viewAllVacancyByCompanyResult.getString("state_location"));
            v.setJobTitle(viewAllVacancyByCompanyResult.getString("job_title"));
            v.setJobDescription(viewAllVacancyByCompanyResult.getString("job_description"));
            v.setSalary(viewAllVacancyByCompanyResult.getString("salary"));
            v.setQualification(viewAllVacancyByCompanyResult.getString("qualification"));
            v.setRowNumber(viewAllVacancyByCompanyResult.getString("rowNumber"));
                       
            result.add(v);
            }   
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        
        return result;
    }
    
    public List<Applicant> viewApplicationsByCompany(String company_id) throws ClassNotFoundException {

        List<Applicant> result = new ArrayList();

        try {

            String sql = "SELECT @row_num:= @row_num+1 rowNumber,student.applicant_id_number,"
                    + "student.student_name,student.phone,student.email,"
                    + "application.invite_status,application.vaccancy_id FROM student INNER JOIN application ON "
                    + "application.applicant_id = student.applicant_id_number"                  
                    + ",(SELECT @row_num := 0)r WHERE application.company_id = '" + company_id + "'";

            connectToDataBase();

            viewApplicationsByCompany = connection.createStatement();

            viewApplicationsByCompanyResult = viewApplicationsByCompany.executeQuery(sql);

            while (viewApplicationsByCompanyResult.next()) {

                Applicant a = new Applicant();

                a.setApplicantIdNumber(viewApplicationsByCompanyResult.getString("applicant_id_number"));
                a.setFirstName(viewApplicationsByCompanyResult.getString("student_name"));
                //a.setLastName(viewApplicationsByCompanyResult.getString("last_name"));
                //a.setGender(viewApplicationsByCompanyResult.getString("gender"));
                a.setPhone(viewApplicationsByCompanyResult.getString("phone"));
                a.setEmail(viewApplicationsByCompanyResult.getString("email"));
                //a.setQualification(viewApplicationsByCompanyResult.getString("qualification"));
                a.setInviteStatus(viewApplicationsByCompanyResult.getString("invite_status"));
                a.setRowNumber(viewApplicationsByCompanyResult.getString("rowNumber"));
                a.setVacancyId(viewApplicationsByCompanyResult.getString("vaccancy_id"));

                result.add(a);
                
                System.out.print(result);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection(connection);
        }

        return result;
    }   
    
    public void invite(String vacancy_id, String applicant_id){
        String inviteStatus = "INVITED";
        try{
            connectToDataBase();
            String sql = "UPDATE application SET  invite_status = '"+inviteStatus+"'"                    
                    + " WHERE vaccancy_id = '"+vacancy_id+"' AND applicant_id = '"+applicant_id+"' ";
            invite = connection.prepareStatement(sql);
            invite.executeUpdate();
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
    
    public void updateStudentVerificationStatus(String student_id, String verification_status){
        
        try{
            connectToDataBase();
            String sql = "UPDATE student SET  verification_status = '"+verification_status+"' WHERE student_id = '"+student_id+"' ";
            updateStudent = connection.prepareStatement(sql);
            updateStudent.executeUpdate();
        }catch(ClassNotFoundException | SQLException error){
            
            error.printStackTrace();
        }
    }
}

