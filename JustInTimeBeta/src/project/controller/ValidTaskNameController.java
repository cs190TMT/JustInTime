package project.controller;

import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;
import org.slim3.controller.Controller;

import project.dto.ProjectsClientDto;
import project.dto.TasksClientDto;
import project.dto.TasksDto;
import project.service.ProjectsService;
import project.service.TasksService;

public class ValidTaskNameController extends Controller{
    
    
    
    protected Navigation run() throws Exception {
        TasksDto dto = new TasksDto(); 
        JSONObject json = null;
        TasksService service = new TasksService();
        int validate = 0;
        
        try {
            json = new JSONObject((String)this.requestScope("data"));
            dto.setId(json.getLong("id"));
            dto.setTaskName(json.getString("taskName"));
            
            TasksClientDto t = service.validateTaskName(dto);
            
            validate = t.getTaskList().size();
        } catch (Exception e) {
            e.printStackTrace();
            dto.getErrorList().add("Server controller error: " +e.getMessage());
        }
        
        json.put("validate", validate);
        json.put("errorList", dto.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }
}
