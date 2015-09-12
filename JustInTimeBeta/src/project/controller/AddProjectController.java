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

import project.dto.ProjectsDto;
import project.service.ProjectsService;

public class AddProjectController extends Controller {

    private ProjectsService service = new ProjectsService();

    @Override
    public Navigation run() throws Exception {
        ProjectsDto dto = new ProjectsDto();
        JSONObject json = null;
        
        try {
            json = new JSONObject((String) this.requestScope("data"));

            dto.setProjectName(json.getString("taskName")  );
            dto.setProjectDetails(json.getString("taskDetails"));
            if ((dto.getProjectName() == null) || dto.getProjectName().isEmpty() || (dto.getProjectDetails() == null) || dto.getProjectDetails().isEmpty()) {
                dto.getErrorList().add("Missing content");
            } else {
                dto = this.service.addProject(dto);
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
