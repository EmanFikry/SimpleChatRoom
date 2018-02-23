package mainpackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eman-PC
 */
@WebServlet(urlPatterns = {"/MsgServlet"})
public class MessagesServlet extends HttpServlet {

    public static Vector<MessageDTO> messages = new Vector<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        MessageDTO msgDTO = new MessageDTO();
        String name = request.getParameter("nameField");
        String msg = request.getParameter("msgField");
        msgDTO.setName((String) request.getSession(false).getAttribute("userName"));
        msgDTO.setMessage(msg);
        messages.add(msgDTO);

    }

    private String buildJSONFromVector(Vector<MessageDTO> msgs) {
        Gson json = new Gson();
        return json.toJson(msgs);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.print(buildJSONFromVector(messages));
    }

}
