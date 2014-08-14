package com.seaport.controller;
 
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seaport.domain.FileMeta;
import com.seaport.domain.User;
import com.seaport.service.IUserService;
 
@Controller
@RequestMapping("/fileController")
public class FileController {
	
	@Autowired
	IUserService userService;
	
	/**
	 * Accepts uploading files request with parameters. 
	 * @param names
	 * @param files
	 * @return
	 */
    @RequestMapping(value="/avatar/{userId}", method = RequestMethod.POST)
    public @ResponseBody List<FileMeta> uploadAvatar(@RequestParam("name") String[] names,
    		@RequestParam("file") MultipartFile[] files, @PathVariable String userId, HttpServletRequest request) {
    	
    	List<FileMeta> fileMetaList = new ArrayList<FileMeta>();
    	for (int i = 0; i < files.length; i++) {
            MultipartFile multipartFile = files[i];
            String nameDD = names[i];
 
             //2.3 create new fileMeta
             FileMeta fileMeta = new FileMeta();
             fileMeta.setFileName(multipartFile.getOriginalFilename());
             fileMeta.setFileSize(multipartFile.getSize()/1024+" Kb");
             fileMeta.setFileType(multipartFile.getContentType());
 
             try {
                // Creating the directory to store file
//                String rootPath = System.getProperty("catalina.home");
                String rootPath = request.getServletContext().getRealPath("/")+ "static\\images\\users\\";
//                File dir = new File(rootPath + File.separator + "tmpFiles");
                File dir = new File(rootPath);
                if (!dir.exists()) {
                	dir.mkdirs();
                }
                
                //21:03:10,900 INFO  [stdout] (http-localhost/127.0.0.1:8080-1) App Deployed Directory path: C:\jboss-eap-6.1\standalone\deployments\viking.war\
                //21:03:11,627 INFO  [stdout] (http-localhost/127.0.0.1:8080-1) getContextPath(): /viking
                
//                System.out.println("\nApp Deployed Directory path: " + request.getServletContext().getRealPath("/"));
//                System.out.println("getContextPath(): " + request.getServletContext().getContextPath());
//                System.out.println("Apache Tomcat Server: " + request.getServletContext().getServerInfo());
//                System.out.println("Servlet API version: " + request.getServletContext().getMajorVersion() + "." +request.getServletContext().getMinorVersion());
//                System.out.println("Tomcat Project Name: " + request.getServletContext().getServletContextName());
                
                User user = userService.getUser(Integer.parseInt(userId));
                user.setImg(userId+"_"+multipartFile.getOriginalFilename());
                // Create the file on server
                String path = dir.getAbsolutePath();
                File serverFile = new File(dir.getAbsolutePath() + File.separator + userId+"_"+multipartFile.getOriginalFilename());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(multipartFile.getBytes());
                stream.close();
                fileMeta.setUploadOK("Y");
                userService.saveUser(user);
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
	 * Accepts uploading files request with parameters. 
	 * @param names
	 * @param files
	 * @return
	 */
    @RequestMapping(value="/upload", method = RequestMethod.POST)
    public @ResponseBody List<FileMeta> upload(@RequestParam("name") String[] names,
    		@RequestParam("file") MultipartFile[] files) {
    	
    	List<FileMeta> fileMetaList = new ArrayList<FileMeta>();
    	for (int i = 0; i < files.length; i++) {
            MultipartFile multipartFile = files[i];
            String nameDD = names[i];
 
             //2.3 create new fileMeta
             FileMeta fileMeta = new FileMeta();
             fileMeta.setFileName(multipartFile.getOriginalFilename());
             fileMeta.setFileSize(multipartFile.getSize()/1024+" Kb");
             fileMeta.setFileType(multipartFile.getContentType());
 
             try {
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists()) {
                	dir.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath() + File.separator + multipartFile.getOriginalFilename());
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(multipartFile.getBytes());
                stream.close();
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
    
    /***************************************************
     * URL: /rest/controller/get/{value}
     * get(): get file as an attachment
     * @param response : passed by the server
     * @param value : value from the URL
     * @return void
     ****************************************************/
//    @RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
//     public void get(HttpServletResponse response,@PathVariable String value){
//         FileMeta getFile = files.get(Integer.parseInt(value));
//         try {     
//                response.setContentType(getFile.getFileType());
//                response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getFileName()+"\"");
//                FileCopyUtils.copy(getFile.getBytes(), response.getOutputStream());
//         }catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//         }
//     }
    
    
}