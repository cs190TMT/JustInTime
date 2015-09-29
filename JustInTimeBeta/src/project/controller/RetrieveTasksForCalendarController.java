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

import project.dto.LogsClientDto;
import project.dto.LogsDto;
import project.dto.TaskCalendarDto;
import project.dto.TasksClientDto;
//import project.dto.TasksDto;
import project.service.LogsService;
//import project.service.TasksService;

public class RetrieveTasksForCalendarController extends Controller {

    //TasksService service = new TasksService();
    LogsService service = new LogsService();
    
    @Override
    protected Navigation run() throws Exception {
        TasksClientDto taskList = new TasksClientDto(); 
        JSONObject json = new JSONObject((String) this.requestScope("data"));
        List<LogsDto> list = new ArrayList<LogsDto>();
        TaskCalendarDto event = new TaskCalendarDto();
        List<TaskCalendarDto> eventList = new ArrayList<TaskCalendarDto>();
        LogsClientDto logList = new LogsClientDto(); 
        
        try {
           // taskList = service.getTaskMasterList();
            logList = service.getLogsList(json.getString("projectName"));
            list =  logList.getLogsList();
            if(taskList.getTaskList().isEmpty()) {
                System.out.println("No records in tasklist");
            }
        } catch (Exception e) {
            e.printStackTrace();
            taskList.getErrorList().add("Server controller error: " +e.getMessage());
        }
        System.out.println("hello");
        for (LogsDto i : list){
            System.out.println("hello" + i.getTaskName());
            System.out.println("time" + i.getTimeSpent());
            System.out.println("time hehe" + i.getTimeStamp());
        }
        
        for (LogsDto i : list){
                event = new TaskCalendarDto();
                 event.setTitle(i.getTaskName() + "  -  " + i.getTimeSpent() + " hours" );
                // event.setStart(start);
                 event.setStart(i.getTimeStamp());
               //  event.setStart("'2015-09-09'");
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