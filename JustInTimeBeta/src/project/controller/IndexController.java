/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.controller;

import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import project.model.TasksModel;
import project.service.TasksService;

/**
 * Main Screen Home controller.
 * @author <name here>
 *
 */
public class IndexController extends Controller {

    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {

        List<TasksModel> taskMasterList = service.getTaskMasterList();
        for (TasksModel tm : taskMasterList) {
            System.out.print(tm.getTaskName());
        }
        
        
        requestScope("taskMasterList", taskMasterList);

        return forward("project/index.jsp");
    }
}
