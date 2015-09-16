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
public class UpdateController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        TasksDto dto = new TasksDto(); 
        JSONObject json = null;
        TasksService service = new TasksService();
        
        try {
            json = new JSONObject((String)this.requestScope("data"));
            dto.setId(json.getLong("id"));
            dto.setTaskName(json.getString("taskName"));
            dto.setTaskDetails(json.getString("taskDetails"));
            dto = service.updateMasterTask(dto);
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
