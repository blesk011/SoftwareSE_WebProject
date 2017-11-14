package com.wedeal.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wedeal.command.CommandAction;

@WebServlet(
		urlPatterns = { 
				"/Controller", 
				"*.do"
		}, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "commandMapping.properties")
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//��ɾ�� ��ɾ� ó�� Ŭ������ ������ ����
	private Map<String, Object> commandMap = new HashMap<String, Object>();      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    //��ɾ�� ó��Ŭ������ ���εǾ� �ִ� properties ������ �о 
    //HashMap��ü�� commandMap�� ����
	public void init(ServletConfig config) throws ServletException {
		System.out.println("1");
		//initParams���� propertyConfig�� ���� �о��
		String props = config.getInitParameter("propertyConfig");
		System.out.println("2");
		String realFolder = "/property"; //properties������ ����� ����
		//�����ø����̼� ��Ʈ ���
		ServletContext context = config.getServletContext();
		System.out.println("3");
		//realFolder�� �����ø����̼� �ý��ۻ��� �����η� ����
		String realPath = context.getRealPath(realFolder) +"\\"+props;
							    
		//��ɾ�� ó��Ŭ������ ���������� ������ Properties��ü ����
		Properties pr = new Properties();
		System.out.println("4");
		FileInputStream f = null;
		try{
			//command.properties������ ������ �о��
			f = new FileInputStream(realPath); 
			//command.properties�� ������ Properties��ü pr�� ����
			System.out.println("5");
			pr.load(f);
			
			System.out.println("6");
		}catch (IOException e) {
			e.printStackTrace();
		}finally {
			if (f != null) try { f.close(); } catch(IOException ex) {}
		}
		//Set��ü�� iterator()�޼ҵ带 ����� Iterator��ü�� ��
		Iterator<?> keyIter = pr.keySet().iterator();
		//Iterator��ü�� ����� ��ɾ�� ó��Ŭ������ commandMap�� ����
		while( keyIter.hasNext() ) {
			String command = (String)keyIter.next();
			System.out.println(command);
			String className = pr.getProperty(command);
			System.out.println(className);
			try{
				Class<?> commandClass = Class.forName(className);//�ش� ���ڿ��� Ŭ������ �����.
				System.out.println("7");
			    Object commandInstance = commandClass.newInstance();//�ش�Ŭ������ ��ü�� ����
			    System.out.println("8");
			    commandMap.put(command, commandInstance);// Map��ü�� commandMap�� ��ü ����
				System.out.println("9");
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			}catch (InstantiationException e) {
				e.printStackTrace();
			}catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(
		HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response);//��ûó�� �޼ҵ� ȣ��
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(
		HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestPro(request, response);//��ûó�� �޼ҵ� ȣ��
	}
	
	//���������� ��û�� �м��ϰ�, �ش� ������ ó���� �� �� ���� ��
	//ó�� ����� �信 ����
	private void requestPro(
		HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		String view = null;
		CommandAction com=null;
		try {
			String command = request.getRequestURI();
			System.out.println(command);
	        if(command.indexOf(request.getContextPath()) == 0) 
	           command = command.substring(request.getContextPath().length());
	        System.out.println(command);
	        com = (CommandAction)commandMap.get(command);  
	        view = com.requestPro(request, response);
		}catch(Throwable e) {
			e.printStackTrace();
		}
		request.setAttribute("cont",view);
	    RequestDispatcher dispatcher = 
	       request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
}
