/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.controller;

import java.util.Map;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

import project.dto.LogsDto;
import project.service.LogsService;

public class AddLogController extends Controller {

    private LogsService service = new LogsService();
    
    @Override
    protected Navigation run() throws Exception {
        Map<String, Object> input = new RequestMap(this.request);
        LogsDto logDto = new LogsDto();
        BeanUtil.copy(input, logDto);
        service.addLog(logDto, this.request.getParameter("projectName"));
        return redirect(this.basePath);
    }
}
