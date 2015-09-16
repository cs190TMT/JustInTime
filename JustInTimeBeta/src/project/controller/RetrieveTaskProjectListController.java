/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import project.dto.TasksClientDto;
import project.service.TasksService;

public class RetrieveTaskProjectListController extends Controller {

    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        TasksClientDto taskList = new TasksClientDto(); 
        JSONObject json = new JSONObject((String) this.requestScope("data"));
        
        try {
            taskList = service.getTaskProjectList(json.getString("projectName"));
            if(taskList.getTaskList().isEmpty()) {
                System.out.println("No records in tasklist");
            }
        } catch (Exception e) {
            e.printStackTrace();
            taskList.getErrorList().add("Server controller error: " +e.getMessage());
        }
        
        json.put("taskList", taskList.getTaskList());
        json.put("errorList", taskList.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }

}
