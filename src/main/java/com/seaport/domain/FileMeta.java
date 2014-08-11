package com.seaport.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
 
//ignore "bytes" when return json format
@JsonIgnoreProperties({"bytes"})
public class FileMeta {
 
    private String fileName;
    private String fileSize;
    private String fileType;
    private String uploadOK;
 
//    private byte[] bytes;

	public String getFileName() {
		return fileName;
	}

	public String getUploadOK() {
		return uploadOK;
	}

	public void setUploadOK(String uploadOK) {
		this.uploadOK = uploadOK;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
}