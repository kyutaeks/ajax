package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test {
	public static void main(String[] args) {
		Map map = new HashMap<>();
		Map<Object, Object> map2 = new HashMap<>();
		map.put("name", "이름");
		System.out.println(map);

		List<Map<String, String>> addrList = new ArrayList<>();
		
		for(Map<String,String>ass:addrList) {
			ass.put("a", "b");
			System.out.println(ass);
		}
		
	}
	
}
