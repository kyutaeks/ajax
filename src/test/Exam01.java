package test;

import java.util.Map;

import com.google.gson.Gson;

public class Exam01 {
	public static void main(String[] args) {
		String jsonStr = "{\"key\":1}";
		Gson gson = new Gson();
		Map<String,Double> m = gson.fromJson(jsonStr, Map.class);
		System.out.println(m);
	}
}
