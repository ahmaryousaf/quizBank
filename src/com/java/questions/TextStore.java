package com.java.questions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TextStore")
public class TextStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TextStore() {
        super();
    }
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	PrintWriter out=response.getWriter();
		RequestDispatcher rd=request.getRequestDispatcher("check.jsp");
    	ArrayList<String> getData=new ArrayList<String>();
    	String breakList[];
    	String ans=null;
    	DAO dao=new DAO();
    	ArrayList<String> list=dao.getSizeAndQuestions();
    	HttpSession session=request.getSession();
    	
    	if(null== session.getAttribute("name")){
    		  response.sendRedirect("index.jsp");
    	}
    	
    	for(int i=0; i<list.size(); i++) {
    		breakList=list.get(i).split("\t");
    		if(breakList[1].equals("Multiple")) {
    			if(request.getParameter(i+"_1")!=null || request.getParameter(i+"_2")!=null || request.getParameter(i+"_3")!=null || request.getParameter(i+"_4")!=null || request.getParameter(i+"_5")!=null) {
    			if(request.getParameter(i+"_1")!=null) {
        			ans="a";
        		}
//        		else {
//        			ans=",";
//        		}
        		if(request.getParameter(i+"_2")!=null) {
        			if(ans!=null)
        			ans=ans+",b";
        			else 
        				ans="b";
        		}
//        		else {
//        			ans=ans+",";
//        		}
        		if(request.getParameter(i+"_3")!=null) {
        			if(ans!=null)
        			ans=ans+",c";
        			else
        				ans="c";
        		}
//        		else {
//        			ans=ans+",";
//        		}
        		if(request.getParameter(i+"_4")!=null) {
        			if(ans!=null)
        			ans=ans+",d";
        			else
        				ans="d";
        		}
//        		else {
//        			ans=ans+",";
//        		}
        		if(request.getParameter(i+"_5")!=null) {
        			if(ans!=null)
        			ans=ans+",e";
        			else
        				ans="e";
        		}
//        		else {
//        			ans=ans+",";
//        		}
    		}
        		else {
        			ans="null";
        		}
    			getData.add(ans+"\t"+"Multiple");
    		}
    		else if(breakList[1].equals("Text")) {
    			ans=request.getParameter(i+"");
    			getData.add(ans+"\t"+"Text");
    		}
    		else if(breakList[1].equals("Numerical")) {
    			ans=request.getParameter(i+"");
    			getData.add(ans+"\t"+"Numerical");
    		}
    		else if(breakList[1].equals("Single")) {
    			ans=request.getParameter(i+"");
    			getData.add(ans+"\t"+"Single");
    		}
    	}
    	
    	boolean status=dao.textStore(getData);
    	
    	if(status==true) {
    		out.println("<head></head>");
    		out.println("<body>");
    		out.println("<h3>Your data has been entered successfully!!!</h3>");
    		rd.include(request, response);
    		out.println("</head>");
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
