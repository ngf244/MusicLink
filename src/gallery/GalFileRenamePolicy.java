package gallery;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class GalFileRenamePolicy implements FileRenamePolicy{
	
	@Override
	public File rename(File originFile) {
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random() * 100000);
		
		String name = originFile.getName(); // 파일의 이름 가져오기
		String ext = null; // 확장자를 받아놓을 변수를 초기화
		int dot = name.lastIndexOf("."); // 확장자의 위치를 가져오기 
		if(dot != -1) {
			ext = name.substring(dot);
		} else {
			ext = "";
		}
		
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext; 
		File newFile = new File(originFile.getParent(), fileName);
		 
		return newFile;
	}
}
