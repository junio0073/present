package com.svl.present;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinUser
 */
@WebServlet("/JU")
public class JoinUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//post방식의 인코딩 <자바에 직접 넣음>
		request.setCharacterEncoding("UTF-8");

		System.out.print("post!");
		
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String checkPW = request.getParameter("checkPW");
		String E_mailCK = request.getParameter("E_mailCK");
		
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = response.getWriter();

		writer.println("<html><head></head><body>");
		writer.println("아이디 :"+ userID +"<br>");
		writer.println("비밀번호 :"+ userPW +"<br>");
		writer.println("비밀번호 학인 :"+ checkPW +"<br>");
		writer.println("이메일:"+E_mailCK+"<br>");
	}

}
