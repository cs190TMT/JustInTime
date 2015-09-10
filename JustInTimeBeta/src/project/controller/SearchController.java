/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import project.dto.TasksClientDto;
import project.service.TasksService;
/**
 * Main Screen Search controller.
 * @author <name here>
 *
 */
public class SearchController extends Controller {
    
    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        
        TasksClientDto taskList = new TasksClientDto();

        JSONObject json = new JSONObject();
        
        
        try{
            
            json = new JSONObject((String)this.requestScope("data"));
            
            String taskName = json.getString("taskName");
            
            
            taskList = service.searchTask(taskName, null, null);
            
            
            
            json.put("taskList", taskList.getTaskList());
            json.put("errorList", taskList.getErrorList());
        }catch(Exception e){
            e.printStackTrace();
            taskList.getErrorList().add("Server controller error: " + e.getMessage());
        }
        
        json.put("taskList", taskList.getTaskList());
        json.put("errorList", taskList.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
        /*
        String ret = "";
        boolean bool = false;
        
        String taskName = this.request.getParameter("taskName");
        String date = this.request.getParameter("date");
        String phase = this.request.getParameter("phase");
        
        
        if(taskName == null){
            taskName = "";
        }
        
        TasksClientDto models = service.searchTask(taskName, date, phase);
        
        
        int num = models.getTaskList().size();
        
        ret = "{size: " + Integer.toString(num) + ",";
        
        if(models == null){
            ret += "null: true, ";
        }
        else{
            ret += "null: false, ";
        }
        
        ret += "data: [";
        
        
        for(TasksDto model : models.getTaskList()){
            ret += "[";
            ret += "id: " + Long.toString(model.getId()) + ",";
            ret += "name: " + model.getTaskName() ;
            ret += "]";
            
            
        }
        
        
        ret += "]}";
        requestScope("ret", ret);
        return forward("queries/search.jsp");
        */
    }

}
