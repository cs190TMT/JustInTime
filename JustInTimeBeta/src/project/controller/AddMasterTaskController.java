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

import project.dto.TasksDto;
import project.service.TasksService;

public class AddMasterTaskController extends Controller {

    private TasksService service = new TasksService();

    @Override
    public Navigation run() throws Exception {
        TasksDto dto = new TasksDto();
        JSONObject json = null;
        
        try {
            json = new JSONObject((String) this.requestScope("data"));

            dto.setTaskName(json.getString("taskName")  );
            dto.setTaskDetails(json.getString("taskDetails"));
            if ((dto.getTaskName() == null) || dto.getTaskName().isEmpty() || (dto.getTaskDetails() == null) || dto.getTaskDetails().isEmpty()) {
                dto.getErrorList().add("Missing content");
            } else {
                dto = this.service.addMasterTask(dto);
            }
        } catch (Exception e) {
            dto.getErrorList().add("Server controller error: " + e.getMessage());
            if (json == null) {
                json = new JSONObject();
            }
        }

        json.put("errorList", dto.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }

}
