package com.kh.team2.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class AdminFileUploadUtil {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID(); // 겹치지 않는 고유한 값 생성
		System.out.println("uuid:" + uuid);
		String uuidName = uuid + "_" + originalName;
		System.out.println("uuidName:" + uuidName);
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdir();
		}
//		// 업로드 된 원본 이미지를 메모리에 로딩
//		BufferedImage sourceImg = ImageIO.read(new File(uploadPath));
//		// pom.xml =>> imgscalr-lib
//		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 600);
		String filePath = uploadPath + File.separator + uuidName;
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		String formatName = getFormatName(originalName);
		System.out.println("formatName: " + formatName);
		boolean isImage = isImage(formatName);
		System.out.println(isImage);
		if (isImage == true) {
			makeThumbnail(uploadPath,uuidName);
		}
		return uploadPath + File.separator + uuidName;
	}

	// 날짜에 해당하는 폴더 계산 -> 2020/01/20
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = "" + cal.get(Calendar.YEAR); // "2020"
		String monthPath = yearPath + File.separator + (cal.get(Calendar.MONTH) + 1); // 2020/01
		String datePath = monthPath + File.separator + cal.get(Calendar.DATE); // 2020/01/20
		System.out.println("datePath: " + datePath);
		String dirPath = uploadPath + File.separator + datePath;
		System.out.println("dirPath" + dirPath);
		File f = new File(dirPath);
		if (!f.exists()) {// 파일 생성
			f.mkdirs();// 하위 폴더 까지 생성
		}
		return datePath;
	}

	// 확장자 확인
	public static String getFormatName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String formatName = fileName.substring(dotIndex + 1);
		return formatName;
	}

	public static boolean isImage(String formatName) {
		String[] arrFormat = { "JPG", "PNG", "GIF" };
		for (String aFormat : arrFormat) {
			if (formatName.toUpperCase().equals(aFormat)) {
				return true;
			}
		}
		return false;
	}

	// 썸네일 이미지 생성
	public static void makeThumbnail(String uploadPath, String uuidName) throws IOException {
		// 원본 파일
		String uploadedPath = uploadPath + File.separator + uuidName;
		// 업로드 된 원본 이미지를 메모리에 로딩
		BufferedImage sourceImg = ImageIO.read(new File(uploadedPath));
		// pom.xml =>> imgscalr-lib
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		String thumbnailName = uploadPath + File.separator +  "s_" + uuidName;
		File target = new File(thumbnailName);
		ImageIO.write(destImg, getFormatName(uuidName), target);
	}
	public static void delete(String fileName,String uploadPath) throws Exception {
		List<String> list = new ArrayList<String>();
		list.add(fileName);
		delete(list,uploadPath);
	}
	// 삭제
	public static void delete(List<String> fileNames, String uploadPath) throws Exception {
		
		for (String fileName : fileNames) {
			String filePath = uploadPath + File.separator + fileName.replace("/", "\\");
			File f = new File(filePath);
			if (f.exists()) {
				f.delete();
			}
			String formatName = AdminFileUploadUtil.getFormatName(fileName);
			boolean isImage = AdminFileUploadUtil.isImage(formatName);
			if (isImage == true) {
				int slashIndex = fileName.lastIndexOf("/");
				String front = fileName.substring(0, slashIndex + 1);
				String rear = fileName.substring(slashIndex + 1);
				String thumbnailName = front + "s_" + rear;
				String thumbnailPath = uploadPath + File.separator + thumbnailName.replace("/", "\\");
				File fThumb = new File(thumbnailPath);
				if (fThumb.exists()) {
					fThumb.delete();
				}
			}
		}
	}
}
