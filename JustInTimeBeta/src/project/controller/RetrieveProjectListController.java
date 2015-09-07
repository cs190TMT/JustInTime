package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import project.dto.ProjectsClientDto;
import project.service.ProjectsService;

public class RetrieveProjectListController extends Controller {

ProjectsService service = new ProjectsService();
    
    @Override
    protected Navigation run() throws Exception {
        ProjectsClientDto projectList = new ProjectsClientDto(); 
        JSONObject json = new JSONObject();
        
        try {
            projectList = service.getProjectsList();
            if(projectList.getProjectList().isEmpty()) {
                System.out.println("No records in projectlist");
            }
        } catch (Exception e) {
            e.printStackTrace();
            projectList.getErrorList().add("Server controller error: " +e.getMessage());
        }
        
        json.put("projectList", projectList.getProjectList());
        json.put("errorList", projectList.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }
}
