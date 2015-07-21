package project.service;

import java.util.ArrayList;
import java.util.List;

import project.dao.ProjectsDao;
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
    
    public List<ProjectsModel> getProjectsList() {
        return this.dao.getAllProjects();
    }
}
