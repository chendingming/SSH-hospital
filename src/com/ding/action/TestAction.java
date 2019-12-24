package com.ding.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.Servlet;
import java.io.File;

/**
 * Created by Administrator on 2019/11/18 0018.
 */
public class TestAction extends ActionSupport {

    private File file;
    private String fileContentType;
    private String fileFileName;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String add() throws Exception{
        if(file!=null){
            String realPath= ServletActionContext.getServletContext().getRealPath("/doctorImage");
            File target=new File(realPath,fileFileName);
            FileUtils.copyFile(file,target);
            System.out.println(fileFileName);
        }
        return "success";
    }
}
