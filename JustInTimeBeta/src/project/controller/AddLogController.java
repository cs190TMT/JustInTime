/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.controller;

import java.util.Date;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import project.dto.LogsDto;
import project.service.LogsService;

public class AddLogController extends Controller {

    private LogsService service;
    
    @Override
    protected Navigation run() throws Exception {
        LogsDto logDto = new LogsDto();
        logDto.setTaskName(this.request.getParameter("taskName"));
        logDto.setTaskPhase(this.request.getParameter("taskPhase"));
        logDto.setTimeStamp(new Date().toString());
        logDto.setTimeSpent(Float.valueOf(this.request.getParameter("timeSpent")));
        service.addLog(logDto, this.request.getParameter("projectName"));
        return redirect(this.basePath);
    }

}
