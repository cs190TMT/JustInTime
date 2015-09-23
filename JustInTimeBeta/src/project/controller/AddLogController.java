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

import project.dto.LogsDto;
import project.service.LogsService;

public class AddLogController extends Controller {

    private LogsService service = new LogsService();
    
    @Override
    protected Navigation run() throws Exception {
        LogsDto dto = new LogsDto();
        JSONObject json = null;
        
        try {
            json = new JSONObject((String) this.requestScope("data"));

            dto.setTaskName(json.getString("taskName")  );
            dto.setTimeSpent((float)json.getDouble("timeSpent"));
            dto.setTaskPhase(json.getString("taskPhase"));
            
            
            if(dto.getTimeSpent() == 0 || dto.getTimeSpent() < 0){
                dto.getErrorList().add("Invalid number of hours");
            }
            else if ((dto.getTaskName() == null) || dto.getTaskName().isEmpty() || dto.getTaskPhase().isEmpty()) {
                dto.getErrorList().add("Missing content");
            } else {
                dto = this.service.addLog(dto, json.getString("projectName"));
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
