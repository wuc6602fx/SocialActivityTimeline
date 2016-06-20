package com.web;

import com.web.*;
import com.model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class ApplyServlet extends HttpServlet{

    public void doGet(HttpServletRequest request,
						HttpServletResponse response)
			throws IOException, ServletException {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String applierName = (String)request.getAttribute("name");
			String applierGrade = (String)request.getAttribute("grade");
			String applierNumber = (String)request.getAttribute("number");
			String applierSex = (String)request.getAttribute("sex");
			ApplyProcess apply = new ApplyProcess();
			Applicant applicant  = new Appliant(applierName, applierGrade, applierNumber, applierSex);
			Event e = (Event) request.getAttribute("event");
			int eID = e.getID();
			EventProcess ep;
			ep.addApplicant2Event(eID,applicant);
			apply.WriteApplier(applicant);
			
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
		    view.forward(request,response);
			}
}