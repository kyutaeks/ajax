package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MovieService;
import service.impl.MovieServiceImpl;
import utils.Command;

public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieService ms = new MovieServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = Command.getCmd(request);
		if ("list".equals(cmd)) {
			request.setAttribute("list", ms.selectMovieList());
			RequestDispatcher rd = request.getRequestDispatcher("/views/movie/movie_list");
			rd.forward(request, response);
		} else {
			try {
				int miNum = Integer.parseInt(cmd);
				Map<String, String> movie = ms.selectMovieByMiNum(miNum);
				request.setAttribute("movie", movie);
				RequestDispatcher rd = request.getRequestDispatcher("/views/movie/view");
				rd.forward(request, response);
			} catch (Exception e) {
				throw new ServletException("올바른 상세조회 값이 아닙니다.");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd = Command.getCmd(request);
		if ("insert".equals(cmd)) {
			HttpSession hs = request.getSession();
			if (hs.getAttribute("user") == null) {
				Command.goResultPage(request, response, "/", "로그인하세요.");

				return;
			}
			Map<String, String> movie = Command.getSingleMap(request);
			String msg = "영화등록실패!";
			String url = "/movie/list";
			if (ms.insertMovie(movie) == 1) {
				msg = "영화등록성공!";
				
			}
			Command.goResultPage(request, response, msg, url);
		} else if ("delete".equals(cmd)) {
			HttpSession hs = request.getSession();
			if (hs.getAttribute("user") == null) {
				Command.goResultPage(request, response, "/", "로그인하세요.");
				return;
			}
			int miNum = Integer.parseInt(request.getParameter("mi_num"));

			String msg = "삭제에 실패하였습니다.";
			String url = "/movie/list";
			if (ms.deleteMovie(miNum) == 1) {
				msg = "삭제에 성공하였습니다.";
				
			}
			Command.goResultPage(request, response, msg, url);
			RequestDispatcher rd = request.getRequestDispatcher("/views/msg/result");
			rd.forward(request, response);
		}
	}
}
