package project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.repackaged.org.json.JSONObject;
import org.slim3.util.RequestMap;

import project.dto.LogsClientDto;
import project.dto.LogsDto;
import project.dto.TaskCalendarDto;
import project.dto.TasksClientDto;
import project.dto.TasksDto;
import project.service.LogsService;
import project.service.TasksService;

public class RetrieveLogsController extends Controller {
    
    LogsService service = new LogsService();

    @Override
    protected Navigation run() throws Exception {
        // TODO Auto-generated method stub
        Map<String, Object> input = new RequestMap(this.request);
        LogsClientDto logList = new LogsClientDto(); 
        JSONObject json = new JSONObject();
        List<LogsDto> list = new ArrayList<LogsDto>();
        TaskCalendarDto event = new TaskCalendarDto();
        List<TaskCalendarDto> eventList = new ArrayList<TaskCalendarDto>();
        
        try {
            logList = service.getLogsList(this.request.getParameter("projectName"));
            list =  logList.getLogsList();
            if(logList.getLogsList().isEmpty()) {
                System.out.println("No records in tasklist");
            }
        } catch (Exception e) {
            e.printStackTrace();
            logList.getErrorList().add("Server controller error: " +e.getMessage());
        }
        
        for (LogsDto i : list){
            System.out.println("log"+ i.getTaskName());
        }
        
        for (LogsDto i : list){
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
            
        json.put("errorList", logList.getErrorList());
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
        return null;
    }

}