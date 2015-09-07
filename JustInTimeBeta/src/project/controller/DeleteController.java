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
import project.dto.TasksDto;
import project.service.TasksService;

/**
 * Main Screen Delete controller.
 * @author <name here>
 *
 */
public class DeleteController extends Controller {
    
    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        TasksDto dto = new TasksDto(); 
        JSONObject json = null;
        
        try {
            json = new JSONObject((String)this.requestScope("data"));
            dto.setId(json.getLong("id"));
            dto = service.removeMasterTask(dto);
        } catch (Exception e) {
            e.printStackTrace();
            dto.getErrorList().add("Server controller error: " +e.getMessage());
        }
        
        json.put("errorList", dto.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }

}
