package test;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import service.FileService;
import service.impl.FileServiceImpl;

public class ReadFile {

	public static void main(String[] args) {
		FileService fs = new FileServiceImpl();
		String path = "D:\\study2\\addr\\input";
		String targetPath = "D:\\study2\\addr\\input\\ok";
		File targetFolder = new File(targetPath);
		File root = new File(path);
		File[] files = root.listFiles();
		for (File file : files) {
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
}
