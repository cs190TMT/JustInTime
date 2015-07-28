/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.controller;

//import java.util.Date;
import java.util.Map;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

import project.dto.LogsDto;
import project.service.LogsService;

public class AddLogController extends Controller {

    private LogsService service;
    
    @Override
    protected Navigation run() throws Exception {
        Map<String, Object> input = new RequestMap(this.request);
        LogsDto logDto = new LogsDto();
        BeanUtil.copy(input, logDto);
        //logDto.setTaskName(this.request.getParameter("taskName"));
        //logDto.setTaskPhase(this.request.getParameter("taskPhase"));
        //logDto.setTimeStamp(new Date().toString());
        //logDto.setTimeSpent(Float.valueOf(this.request.getParameter("timeSpent")));
        service.addLog(logDto);
        return redirect(this.basePath);
    }

}
