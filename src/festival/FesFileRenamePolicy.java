package festival;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FesFileRenamePolicy implements FileRenamePolicy {
	
	@Override
	public File rename(File originFile) {
		long currentTime = System.currentTimeMillis(); // 현재 시간을 밀리세컨으로 가져옴
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random() * 100000);
		
		String name = originFile.getName(); //매개변수로 들어온 파일의 이름을 가져옴
		String ext = null; //확장자를 넣을 변수를 초기화
		int dot = name.lastIndexOf("."); //확장자의 위치를 가져옴 (ex .jpg, .png)
		
		if(dot != -1) { //확장자가 있을 때
			ext = name.substring(dot); //확장자를 변수에 넣음
		} else { //확장자가 없을 때
			ext = ""; //빈칸으로 놔둠
		}
		
		String fileName = "ml_" + sdf.format(new Date(currentTime)) + ranNum + ext; //java.util.Date -> 데이터베이스에 넣는 용도가 아닌 시간만 가져오는 용도이므로 유틸로 임포트
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	}
	
}
