package com.java.questions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	HttpSession session=request.getSession();
    	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
    	RequestDispatcher rd1=request.getRequestDispatcher("register.jsp");
    	RequestDispatcher rd2=request.getRequestDispatcher("check.jsp");
    	String sub=request.getParameter("Reg");
    	String sub1=request.getParameter("Choice");
    	
    	if(null!=sub) {
    		String fn=request.getParameter("fName");
    		String ln=request.getParameter("lName");
    		String pass=request.getParameter("passw");
    		String email=request.getParameter("e-mail");
    		String re_email=request.getParameter("psw-repeat");
    		
    		System.out.println(email+" "+re_email);
    		if(pass.equals(re_email)) {
    			DAO dao=new DAO();
    			boolean status=dao.register(email, pass, fn, ln);
    			if(status==true) {
    				session.setAttribute("name", fn+" "+ln);
    				response.sendRedirect("welcome.jsp");
    			}
    			else {
    				out.println("<h1>E-mail id already exist</h1>");
    				rd1.include(request, response);
    			}
    		}
    		else {
    			out.println("<h1>Please enter same password in confirm password</h1>");
    			rd1.include(request, response);
    		}
    	}
    	else if(null!=sub1) {
    		String name=request.getParameter("button");
        	
    		DAO dao=new DAO();
        	if(name.equals("questions")) {
        		boolean status=dao.getDataExist(null);
        		if(status==false) {
        		session.setAttribute("check", "questions");
        		response.sendRedirect("welcome.jsp");
        		}
        		else {
        			out.println("<h3>Your data already exist for today's date!!!\nYou can update your data</h3>");
        			rd2.include(request, response);
        		}
        	}
        	else if(name.equals("update")) {
        		String date=request.getParameter("date");
        		boolean status=dao.getDataExist(date);
        		if(status==true) {
        		session.setAttribute("check", "update"+"\t"+date);
        		response.sendRedirect("welcome.jsp");
        		}
        		else {
        			out.println("<h3>Record doesn't exist!!!</h3>");
        			rd2.include(request, response);
        		}
        	}
    	}
    	else {
    	
    	String id=request.getParameter("id");
		String pass=request.getParameter("pass");
    	
		DAO dao=new DAO();
		String check=dao.loginCheck(id, pass);
	
		if(check!=null) {
			session.setAttribute("name", check);
			response.sendRedirect("check.jsp");
		}
		else {
			out.println("<h1>ID and Password is incorrect</h1>");
			rd.include(request, response);
		}
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
