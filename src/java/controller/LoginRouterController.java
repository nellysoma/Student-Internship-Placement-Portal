package controller;

import dao.DbConnection;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author harmony
 */
public class LoginRouterController extends HttpServlet {

    protected void loginRouter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {

        try {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            DbConnection user_login = new DbConnection();

            String[] user_details = user_login.userLogin(username, password);

            String user_password = user_details[0];
            String firstName = user_details[1];
            String lastName = user_details[2];
            String username1 = user_details[3];
            System.out.println("user name is " + username1);
            String user_role = user_details[4];
            //String userVerificationStatus = user_details[4];

            String[] sessionData = {username1, firstName, lastName};

            
            //check if fetched username is empty
            if (username1.isEmpty()) {

                System.out.println("user name does not exist in database");

                RequestDispatcher rd1 = request.getRequestDispatcher("/wrongLoginCredentials.jsp");

                rd1.forward(request, response);
            } else {

                int result;

                result = user_login.checkApplicantUsernameEntry(username);

                //check if applicant username is in database
                if (result == 1) {

                    //check password
                    if (BCrypt.checkpw(password.trim(), user_password)) {

                        System.out.println("password matches");//password matches

                        if (user_role.equals("applicant")) {
                            //check student verification status
                            DbConnection studentVerificationStatusResult = new DbConnection();
                            String studentVerificationStatus = studentVerificationStatusResult.getStudentVerificatioStatus(username);
                            if (studentVerificationStatus.equals("NOT_VERIFIED")) {

                                RequestDispatcher rd4 = request.getRequestDispatcher("/unverifiedStudent.jsp");

                                rd4.forward(request, response);
                            } else {

                                request.setAttribute("sessionData", sessionData);

                                RequestDispatcher rd2 = request.getRequestDispatcher("/ApplicantController?applicant_action=applicantLogin");

                                rd2.forward(request, response);
                            }

                        }

                    } else {

                        RequestDispatcher rd6 = request.getRequestDispatcher("/wrongLoginCredentials.jsp");

                        rd6.forward(request, response);
                    }

                } else {
                    //check if company username is in database
                    int result1;

                    DbConnection company_login = new DbConnection();

                    result1 = company_login.checkCompanyUsernameEntry(username);

                    if (result1 == 1) {

                        String[] company_details = company_login.companyLogin(username, password);

                        String company_password = company_details[0];
                        String companyName = company_details[1];
                        String rcNumber = company_details[2];
                        String companyUsername = company_details[3];
                        System.out.println("company user name is " + companyUsername);
                        System.out.println("company password name is " + company_password);
                        String company_role = company_details[4];
                        String verificationStatus = company_details[5];

                        String[] companySessionData = {companyUsername, companyName, rcNumber};

                        //check company password
                        if (BCrypt.checkpw(password.trim(), company_password)) {

                            System.out.println("Execution has reached here ");

                            if (company_role.equals("company")) {

                                if (verificationStatus.equals("NOT_VERIFIED")) {

                                    RequestDispatcher rd4 = request.getRequestDispatcher("/unverifiedCompany.jsp");

                                    rd4.forward(request, response);
                                } else {

                                    request.setAttribute("companySessionData", companySessionData);

                                    RequestDispatcher rd3 = request.getRequestDispatcher("/CompanyController?company_action=companyLogin");

                                    rd3.forward(request, response);
                                }
                            }
                        } else {

                            RequestDispatcher rd7 = request.getRequestDispatcher("/wrongLoginCredentials.jsp");

                            rd7.forward(request, response);
                        }
                    } else {

                        //check if admin username is in database
                        int result2;

                        DbConnection admin_login = new DbConnection();

                        result2 = admin_login.checkAdminUsernameEntry(username);

                        if (result2 == 1) {

                            String[] admin_details = admin_login.adminLogin(username, password);

                            String admin_password = admin_details[0];
                            String adminFirstName = admin_details[1];
                            String adminLastName = admin_details[2];

                            String admin_role = admin_details[4];

                            String adminName = adminFirstName + " " + adminLastName;

                            String adminUsername = admin_details[3];
                            System.out.println("user name is " + adminUsername);

                            String[] adminSessionData = {adminUsername, adminName};

                            //check admin password
                            if (admin_password.equals(password)) {

                                System.out.println("admin_password  is " + admin_password);

                                if (admin_role.equals("admin")) {

                                    System.out.println("admin_role  is " + admin_role);

                                    request.setAttribute("adminSessionData", adminSessionData);

                                    RequestDispatcher rd5 = request.getRequestDispatcher("/AdminController?admin_action=adminLogin");

                                    rd5.forward(request, response);
                                }
                            } else {

                                System.out.println("password does not match");//password does not match

                                RequestDispatcher rd1 = request.getRequestDispatcher("/wrongLoginCredentials.jsp");

                                rd1.forward(request, response);
                            }
                        }
                    }
                }
            }

        } catch (Exception error) {

            error.printStackTrace();
        }
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

            String login_action = request.getParameter("login_action");

            switch (login_action) {

                case "loginRouter":
                    loginRouter(request, response);
                    break;
            }

        } catch (Exception error) {

            error.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
