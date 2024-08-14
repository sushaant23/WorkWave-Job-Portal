package com.servlet;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.entity.Jobs;



@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("");
       	 	String location = req.getParameter("location");
       	 	String category = req.getParameter("category");
       	 	String status = req.getParameter("status");
       	 	String desc = req.getParameter("desc");
       	 	
       	 	Jobs j=new Jobs();
       	 	j.setId(id);
       	 	j.setTitle(title);
       	 	j.setDescription(desc);
       	 	j.setLocation(location);
       	 	j.setCategory(category);
       	 	j.setStatus(status);
       	 	
       	 HttpSession session = req.getSession();
    	 
    	 JobDAO dao = new JobDAO(DBConnect.getConn());
    	 boolean f = dao.updateJobs(j);
    	 
    	 if(f)
    	 {
    		 session.setAttribute("succMsg", "Job Update Success");
    		 resp.sendRedirect("view_jobs.jsp");
    	 }
    	 else
    	 {
    		 session.setAttribute("succMsg", "Something went wrong on server");
    		 resp.sendRedirect("view_jobs.jsp");
    	 }
       	 	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
