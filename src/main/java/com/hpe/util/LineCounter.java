package com.hpe.util;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class LineCounter {
	private static int count = 0;

	public static void count(File file) {
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			if (files != null && files.length > 0) {
				Arrays.stream(files).forEach(LineCounter::count);
			}
		} else {
			try {
				BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
				String temp = bufferedReader.readLine();
				while (temp != null) {
					if (!"".equals(temp)) {
						count++;
					}
					temp = bufferedReader.readLine();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) throws IOException {
		count(new File("D:/IdeaProjects/FindLover/src/main/java"));
		System.out.println("/src/main/java中代码行数：" + count);
		count = 0;
		count(new File("D:/IdeaProjects/FindLover/src/main/resources/templates"));
		System.out.println("/src/main/resources/templates中代码行数：" + count);
	}
}