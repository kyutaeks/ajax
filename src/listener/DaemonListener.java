package listener;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.io.FileUtils;

import service.FileService;
import service.impl.FileServiceImpl;

public class DaemonListener implements ServletContextListener, Runnable {
	private Thread t;
	private static final long BREAK_TIME = 3000;
	private FileService fs = new FileServiceImpl();

	public DaemonListener() {
		System.out.println("제가 제일 처음이에요!");

	}

	public void contextDestroyed(ServletContextEvent arg0) { // 종료가 되야지만 호출됨 즉, 서버가 꺼짐
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("저는 생성후 바로 실행되요!");
		if (t == null) {
			t = new Thread(this);
			t.setDaemon(true);
		}
		t.start();
	}

	private void readAddrFiles() {

		String path = "D:\\study2\\addr\\input"; //파일들이 실제 있는경로
		String targetPath = "D:\\study2\\addr\\input\\ok"; // 파일을 카피할 경로
		File targetFolder = new File(targetPath);
		File root = new File(path);
		File[] files = root.listFiles();
		for (File file : files) {
			System.out.println("총 파일 갯수 : " + (files.length-1));
			if (!file.isDirectory()) {
				String name = file.getName();
				System.out.println(name + "파일시작!");
				Map<String, String> iMap = fs.insertAddrFromFile(file);
				int targetCnt = Integer.parseInt(iMap.get("targetCnt"));
				int totalCnt = Integer.parseInt(iMap.get("totalCnt"));
				if (targetCnt == totalCnt) {
					try {
						FileUtils.moveFileToDirectory(file, targetFolder, false);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				System.out.println("실행시간 : " + iMap.get("executTime"));
				System.out.println(name + "파일 종료!");
				return;
			}
		}
	}

	@Override
	public void run() {
		while (Thread.currentThread() == t) {
		try {
			Thread.sleep(BREAK_TIME);
			readAddrFiles();

		} catch (InterruptedException e) {

			e.printStackTrace();
		}

		}
	}
}
