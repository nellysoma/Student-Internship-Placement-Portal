/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author harmony
 */
public class SchoolController extends HttpServlet {

    
    public void schoolLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        RequestDispatcher rd = request.getRequestDispatcher("/school/schoolDashboard.jsp");

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
             
             String school_action = request.getParameter("school_action");
             
             switch (school_action) {
                 
                case "schoolLogin":
                    schoolLogin(request, response);
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
