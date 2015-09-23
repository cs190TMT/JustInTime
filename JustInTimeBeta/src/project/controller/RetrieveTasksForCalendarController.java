/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.controller;

import java.util.ArrayList;
import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;

import project.dto.TaskCalendarDto;
import project.dto.TasksClientDto;
import project.dto.TasksDto;
import project.service.TasksService;

public class RetrieveTasksForCalendarController extends Controller {

    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        TasksClientDto taskList = new TasksClientDto(); 
        JSONObject json = new JSONObject();
        List<TasksDto> list = new ArrayList<TasksDto>();
        TaskCalendarDto event = new TaskCalendarDto();
        List<TaskCalendarDto> eventList = new ArrayList<TaskCalendarDto>();
        
        try {
            taskList = service.getTaskMasterList();
            list =  taskList.getTaskList();
            if(taskList.getTaskList().isEmpty()) {
                System.out.println("No records in tasklist");
            }
        } catch (Exception e) {
            e.printStackTrace();
            taskList.getErrorList().add("Server controller error: " +e.getMessage());
        }
        
        for (TasksDto i : list){
            System.out.println(i.getTaskName());
        }
        
        for (TasksDto i : list){
                event = new TaskCalendarDto();
                 event.setTitle(i.getTaskName());
                 event.setStart("'2015-09-09'");
                 eventList.add(event);
            }
        System.out.println("eventList size: "+ eventList.size());
       
        
        for (TaskCalendarDto i : eventList){
            System.out.println(i.getTitle());
        }
        
           json.put("events", eventList);
            
        json.put("errorList", taskList.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }

}