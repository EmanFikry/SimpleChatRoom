/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainpackage;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eman-PC
 */
@WebServlet(urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(buildJSONFromVector(RegisterationServlet.getUsers()));

    }

    private String buildJSONFromVector(Vector<UserDTO> users) {
        Gson json = new Gson();
        return json.toJson(users);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("loginemail");
        String password = request.getParameter("loginpas");

        //get users vector
        //check if user exists
        Vector<UserDTO> users = RegisterationServlet.getUsers();
        boolean userExist = false;
        boolean passRight = false;
        for (UserDTO user : users) {
            if (user.getEmail().equals(email)) {
                userExist = true;
                if (user.getPassword().equals(password)) {
                    user.setStatus("online");
                    HttpSession session = request.getSession(true);
                    session.setAttribute("userName", user.getName());
                    session.setAttribute("userEmail", user.getEmail());
                    passRight = true;
                    response.sendRedirect("newDisplay.jsp");
                }
            }
        }

        if (!userExist) {
            response.sendRedirect("registration.jsp");

        }
        if (userExist && !passRight) {
            request.getServletContext().setAttribute("loginMsg", "Wrong Password");
            request.getServletContext().setAttribute("loginEmail", email);
            response.sendRedirect("signin.jsp");
        }

    }

}
