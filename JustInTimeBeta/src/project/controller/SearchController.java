/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import java.util.List;
import project.dto.TasksDto;
import project.service.TasksService;
import project.model.TasksModel;
/**
 * Main Screen Search controller.
 * @author <name here>
 *
 */
public class SearchController extends Controller {
    
    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        
        String ret = "";
        boolean bool = false;
        
        String taskName = this.request.getParameter("taskName");
        String date = this.request.getParameter("date");
        String phase = this.request.getParameter("phase");
        
        List<TasksModel> models = service.getTaskMasterList();
        
        
        int num = models.size();
        
        ret = "{size: " + Integer.toString(num) + ",";
        
        if(models == null){
            ret += "null: true, ";
        }
        else{
            ret += "null: false, ";
        }
        
        ret += "data: [";
        
        
        for(TasksModel model : models){
            ret += "[";
            ret += "id: " + Long.toString(model.getId()) + ",";
            ret += "name: " + model.getTaskName() ;
            ret += "]";
            
            
        }
        
        
        ret += "]}";
        requestScope("ret", ret);
        return forward("queries/search.jsp");
      
    }

}
