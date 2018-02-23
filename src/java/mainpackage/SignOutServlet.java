/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static mainpackage.RegisterationServlet.users;

/**
 *
 * @author Eman-PC
 */
@WebServlet(urlPatterns = {"/signOutServlet"})
public class SignOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("userEmail");
        for (UserDTO user : users) {
            if (user.getEmail().equals(email)) {
                user.setStatus("offline");
            }
        }
        session.invalidate();
        response.sendRedirect("signin.jsp");

    }

}
