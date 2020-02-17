package com.java.questions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class DAO {
	
	private int uId;
	private String dateTime=null;
	
	private void setUserId(int id) {
		this.uId=id;
		System.out.println(uId);
	}
	
	private int getUserId() {
		System.out.println("this is " + uId);
		return uId;
	}
		
	public String loginCheck(String id, String pass) {
		
		Connection con=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String fullName=null;
		String query="select id, UserId, Password, fName, lName from login where UserId='"+id+"' and password='"+pass+"';";
		
		try {
			if(con==null || con.isClosed()) {
				con=DbUtil.getConnection();
			}
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			
			if(rs.next()) {
				setUserId(rs.getInt("id"));
//				uId=rs.getInt("id");
				String fn=rs.getString("fName");
				String ln=rs.getString("lName");
				fullName=fn+" "+ln;
			}
//			setUserId(uId);
		}
		catch(Exception e){
			System.out.println(e);
		}
		return fullName;
	}
	
	public ArrayList<String> getQuestions(){
		ArrayList<String> list=new ArrayList<String>();
		Connection con=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String query="select q.id ,q.question, qo.option, q.ques_type\n" + 
				"from questions q left join ques_options qo\n" + 
				"on q.id=qo.ques_id ;";
		
		try {
			if(con==null || con.isClosed()) {
				con=DbUtil.getConnection();
			}
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			while(rs.next()) {
				String ques=rs.getString("question");
				String option=rs.getString("option");
				String type=rs.getString("ques_type");
				list.add(ques+"\t"+option+"\t"+type);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		return list;
	}
	
	public boolean register(String email, String pass, String fn, String ln) {
		Connection con=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String query1="select UserId from login where UserId='"+email+"';";
		String query2="select id from login where UserId="+email+"";
		try {
			if(con==null || con.isClosed()) {
				con=DbUtil.getConnection();
			}
			st=con.prepareStatement(query1);
			rs=st.executeQuery();
			if(!rs.next()) {
			String query="insert into login(UserId,Password, fName, lName) values(?, ?, ?, ?);";
			st=con.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, pass);
			st.setString(3, fn);
			st.setString(4, ln);
			st.execute();
			
			st=con.prepareStatement(query2);
			rs=st.executeQuery();
			if(rs.next()) {
				setUserId(rs.getInt("id"));
//				uId=rs.getInt("id");
			}
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public ArrayList<String> getSizeAndQuestions(){
		ArrayList<String> list=new ArrayList<String>();
		Connection con=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String query="select question, ques_type \n" + 
				"from questions;";
		
		try {
			if(con==null || con.isClosed()) {
				con=DbUtil.getConnection();
			}
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			while(rs.next()) {
				String ques=rs.getString("question");
				String type=rs.getString("ques_type");
				list.add(ques+"\t"+type);
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		return list;
	}
	
	public boolean textStore(ArrayList<String> list) {
		Connection con=null;
		PreparedStatement st=null;
		Statement stmt=null;
		String line[];
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		try {
			if(con==null || con.isClosed()) {
				con=DbUtil.getConnection();
			}
			
			String query1="";
			int z=1;
			for(int i=0; i<list.size(); i++) {
				String query="insert into text_answers(question_id, UserId, answer, date_time) values(?, ?, ?, ?);";
			
			line=list.get(i).split("\t");
			query1 ="update text_answers \n" + 
					"set answer='"+line[0]+"' \n" + 
					"where cast(date_time as date)='"+dateTime+"' \n" + 
					"and UserId="+getUserId()+" and question_id="+z+";";
				
				if(dateTime==null) {
					System.out.println("date null");
					st=con.prepareStatement(query);
					st.setString(1, i+1+"");
					st.setInt(2, getUserId());
					st.setString(3, line[0]);
					st.setString(4, dtf.format(now));
					st.execute();
				}
				else {
					System.out.println("not null");
					stmt=con.createStatement();
					stmt.executeUpdate(query1);
					z++;
				}
			}
			dateTime=null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public ArrayList<String> getUpdateData(String date){
		ArrayList<String> list=new ArrayList<String>();
		Connection con=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		dateTime=date;
		String query="select q.id ,q.question, qo.option, q.ques_type, answer\n" + 
				"from questions q left join ques_options qo\n" + 
				"on q.id=qo.ques_id\n" + 
				"left join text_answers ta\n" + 
				"on q.id=ta.question_id \n" + 
				"where cast(date_time as date)='"+date+"' \n" + 
				"and UserId="+getUserId()+";";
		try {
			if(con==null || con.isClosed()) {
				con=DbUtil.getConnection();
			}
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			while(rs.next()) {
				String ques=rs.getString("question");
				String opt=rs.getString("option");
				String type=rs.getString("ques_type");
				String ans=rs.getString("answer");
				
				list.add(ques+"\t"+opt+"\t"+type+"\t"+ans);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean getDataExist(String date){
		Connection con=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
		LocalDateTime now = LocalDateTime.now();
		String query=null;
		if(date==null) {
			System.out.println(dtf.format(now)+"\t"+getUserId());
		query="select * \n" + 
				"from text_answers\n" + 
				"where cast(date_time as date)='"+dtf.format(now)+"' and UserId="+getUserId()+";";
		}
		else {
			System.out.println("else");
			query="select *\n" + 
					"from text_answers\n" + 
					"where cast(date_time as date)='"+date+"' and UserId="+getUserId()+";";
		}
			
		try {
			if(con==null || con.isClosed()) {
				con=DbUtil.getConnection();
			}
			st=con.prepareStatement(query);
			rs=st.executeQuery();
			if(rs.next()) {
				System.out.println("data not exist");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
