package project.dto;

import java.util.ArrayList;
import java.util.List;

public class ProjectsClientDto {

    private List<String> errorList = new ArrayList<String>();
    
    private List<ProjectsDto> projectList = new ArrayList<ProjectsDto>();

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    public List<ProjectsDto> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<ProjectsDto> projectList) {
        this.projectList = projectList;
    }
}
