package com.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tool.Tools;

public class FileDownLoadServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("url");
		String filename=request.getParameter("name");
		path = new String(path.getBytes("ISO-8859-1"), "utf-8");
		download(path,Tools.encode(filename), request, response);
	}

	@SuppressWarnings("deprecation")
	public HttpServletResponse download(String path,String filename, 
			HttpServletRequest request, HttpServletResponse response) {
		try {

			// path��ָ�����ص��ļ���·����
			File file = new File(request.getRealPath("/")  + path);
			// ȡ���ļ��ĺ�׺����
			 String ext = path.substring(path.lastIndexOf(".") +
			 1).toLowerCase();

			// ��������ʽ�����ļ���
			InputStream fis = new BufferedInputStream(new FileInputStream(file));

			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// ���response
			response.reset();
			// ����response��Header
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(filename.getBytes("gbk"), "ISO-8859-1")+"."+ext);
			response.addHeader("Content-Length", "" + file.length());
			OutputStream toClient = new BufferedOutputStream(response
					.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return response;
	}

}
