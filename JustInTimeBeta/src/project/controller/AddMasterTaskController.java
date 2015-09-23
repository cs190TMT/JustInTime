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

import project.dto.TasksDto;
import project.service.TasksService;

public class AddMasterTaskController extends Controller {

    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        Map<String, Object> input = new RequestMap(this.request);
        TasksDto taskDto = new TasksDto();
        BeanUtil.copy(input, taskDto);
        service.addMasterTask(taskDto);
        return forward("/project/tasks.jsp");
    }

}