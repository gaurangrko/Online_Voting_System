

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminLogin() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		 
		Dbmanager db=new Dbmanager();
		java.sql.Connection con=db.getConnection();
		
		
		String name=request.getParameter("uName");
		String pass=request.getParameter("password");
		
		
		try {
			
			PreparedStatement st=con.prepareStatement("select* from adminn where aName='"+name+"' and aPassword='"+pass+"'");
			ResultSet rs=((java.sql.Statement) st).executeQuery("select* from adminn where aName='"+name+"' and aPassword='"+pass+"'");
			
			if(rs.next()) {
				
				HttpSession session=request.getSession();
				session.setAttribute("aName",name);
				response.sendRedirect("adminWelcome.jsp");
			}
			
			else {
				response.sendRedirect("invalid.jsp");
			}
		}catch(Exception e){
			    e.printStackTrace();
		}
	}

}
