package com.seaport.controller;
 
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seaport.domain.FileMeta;
import com.seaport.domain.User;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingConstant;
 





import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;

@Controller
@RequestMapping("/fileController")
public class FileController {
	
	@Autowired
	IUserService userService;
	@Autowired
	private VikingConstant vikingConstant;
	
	/**
	 * Accepts uploading files request with parameters. 
	 * @param names
	 * @param files
	 * @return
	 */
    @RequestMapping(value="/avatar/{userId}", method = RequestMethod.POST)
    public @ResponseBody List<FileMeta> uploadAvatar(@RequestParam("name") String[] names,
    		@RequestParam("file") MultipartFile[] files, @PathVariable String userId, HttpServletRequest request)  throws Exception  {
    	
    	List<FileMeta> fileMetaList = new ArrayList<FileMeta>();
    	for (int i = 0; i < files.length; i++) {
            MultipartFile multipartFile = files[i];
            /*Data we're going to send back to the client.*/
            FileMeta fileMeta = new FileMeta();
            
             try {
            	String userImgPath = vikingConstant.getUserImgPath();
                File dir = new File(userImgPath);
                if (!dir.exists()) {
                	dir.mkdirs();
                }
                
                User user = userService.getUser(Integer.parseInt(userId));
                user.setImg(userId+"_"+multipartFile.getOriginalFilename());
                
                /*Create the file on server*/
                File serverFile = new File(dir.getAbsolutePath() + File.separator + userId+"_"+multipartFile.getOriginalFilename());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(multipartFile.getBytes());
                stream.close();

                userService.saveUser(user);
                fileMeta.setFileName(user.getImg());
                fileMeta.setFileSize(multipartFile.getSize()/1024+" Kb");
                fileMeta.setFileType(multipartFile.getContentType());
                fileMeta.setUploadOK("Y");
                
            } catch (IOException e) {
                e.printStackTrace();
                fileMeta.setUploadOK("N");
            }
            fileMetaList.add(fileMeta);
    	}
        // [{"fileName":"app_engine-85x77.png","fileSize":"8 Kb","fileType":"image/png","uploadOK":"Y"},...]
        return fileMetaList;
    }

	
	/**
	 * Load requested user avatar image.
	 * @param requestedImage
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value="/getUserImg/{requestedImage}", method = RequestMethod.GET)
	protected HttpEntity<byte[]> getUserImg(@PathVariable String requestedImage, 
											HttpServletRequest request, Model model)  throws Exception  {
		byte[] data = {};
        try {
        	Path path = Paths.get(vikingConstant.getUserImgPath()+requestedImage+".jpg");
        	data = Files.readAllBytes(path);
		} catch (Exception e) {
			return this.getDefaulImg(request);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		headers.setContentLength(data.length);
		
		return new HttpEntity<byte[]>(data, headers);
	}

	/**
	 * Load requested user avatar image.
	 * @param requestedImage
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value="/getUserImg/", method = RequestMethod.GET)
	protected HttpEntity<byte[]> getDefaulImg(HttpServletRequest request)  throws Exception  {
		byte[] data = {};
        try {
        	String userImgPath = request.getServletContext().getRealPath("/")  + File.separator + 
        						 "static"  + File.separator +
        						 "images" + File.separator +
        						 "users" + File.separator + VikingConstant.DEFAULT_USER_IMG;
        						 
        	Path path = Paths.get(userImgPath);
        	data = Files.readAllBytes(path);
		} catch (Exception e) {
				/*Do nothing.*/
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		headers.setContentLength(data.length);
		
		return new HttpEntity<byte[]>(data, headers);
	}
	
}