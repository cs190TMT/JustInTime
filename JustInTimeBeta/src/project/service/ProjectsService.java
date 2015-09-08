package project.service;

import java.util.ArrayList;
import java.util.List;

import project.dao.ProjectsDao;
import project.dto.ProjectsClientDto;
import project.dto.ProjectsDto;
import project.model.ProjectsModel;

public class ProjectsService {

    ProjectsDao dao = new ProjectsDao();
    
    public ProjectsDto addProject(ProjectsDto input) {
        
        ProjectsModel project = new ProjectsModel();
        project.setProjectName(input.getProjectName());
        project.setProjectDetails(input.getProjectDetails());
        
        if (!this.dao.saveProject(project)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
    
    public ProjectsClientDto getProjectsList() {
        List<ProjectsModel> projectsModel = this.dao.getAllProjects();
        ProjectsClientDto projectList = new ProjectsClientDto();
        ProjectsDto projectDto;
        if(projectsModel.isEmpty()) {
           System.out.println("No recs in dao"); 
        }
        for (ProjectsModel project : projectsModel) {
            projectDto = new ProjectsDto();
            projectDto.setId(project.getId());
            projectDto.setProjectName(project.getProjectName());
            projectDto.setProjectDetails(project.getProjectDetails());
            projectList.getProjectList().add(projectDto);
        }
        if(projectList.getProjectList().isEmpty()) {
            System.out.println("No recs in dto");
        }
        
        return projectList;
    }
}