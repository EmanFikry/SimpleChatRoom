/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainpackage;

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
@WebServlet(urlPatterns = {"/regServlet"})
public class RegisterationServlet extends HttpServlet {

    public static Vector<UserDTO> users = new Vector<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("uname");
        String email = request.getParameter("uemail");
        String password = request.getParameter("upsw");

        boolean emailExist = false;
        for (UserDTO user : users) {
            if (user.getEmail().equals(email)) {
                emailExist = true;
                request.getServletContext().setAttribute("registerationName", user.getName());
                request.getServletContext().setAttribute("registerationEmail", user.getEmail());
                request.getServletContext().setAttribute("registerationMsg", "Email already exist");
                response.sendRedirect("registration.jsp");
            }
        }
        if (!emailExist) {
            UserDTO newUser = new UserDTO();
            newUser.setEmail(email);
            newUser.setName(name);
            newUser.setPassword(password);
            newUser.setStatus("offline");
            users.add(newUser);
            response.sendRedirect("signin.jsp");
        }

    }

    public static Vector<UserDTO> getUsers() {
        return users;
    }

    public static void setUsers(Vector<UserDTO> users) {
        RegisterationServlet.users = users;
    }

}
