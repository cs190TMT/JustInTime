/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import project.dto.TasksDto;
import project.service.TasksService;

/**
 * Main Screen Update controller.
 * @author <name here>
 *
 */
public class UpdateTaskController extends Controller {
    
    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        TasksDto dto = new TasksDto();
        JSONObject json = null;
        
        try {
            json = new JSONObject((String)this.requestScope("data"));

            dto.setId(json.getLong("id"));
            dto.setTaskName(json.getString("taskName"));
            dto.setTaskDetails(json.getString("taskDetail"));
            if ((dto.getTaskName() == null || dto.getTaskName().isEmpty()) && (dto.getTaskDetails() == null || dto.getTaskDetails().isEmpty())) {
                dto.getErrorList().add("Content is required.. please supply a tweet");
            } else {
                dto = this.service.updateMasterTask(dto);
            }
            
        } catch (Exception e) {
            dto.getErrorList().add("Server controller error: " + e.getMessage());
            if (json == null) {
                json = new JSONObject();
            }
        }
        
        return null;
    }

}
