/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import project.dao.TasksDao;
import project.dto.TasksClientDto;
import project.dto.TasksDto;
import project.model.TasksModel;

public class TasksService {
    
    TasksDao dao = new TasksDao();
    
    public TasksDto addMasterTask(TasksDto input) {
        TasksModel task = new TasksModel();
        task.setTaskName(input.getTaskName());
        task.setTaskDetails(input.getTaskDetails());
        task.setDateCreated(new Date().toString());
        task.setTimeAlloted(0);
        task.setTimeSpent(0);
        task.setTaskPhase(null);
        
        if (!this.dao.saveMasterTask(task)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
    
    public TasksDto addProjectTask(TasksDto input, String projectName) {
        TasksModel task = new TasksModel();
        task.setTaskName(input.getTaskName());
        task.setTaskDetails(input.getTaskDetails());
        task.setDateCreated(new Date().toString());
        task.setTimeAlloted(input.getTimeAlloted());
        task.setTimeSpent(0);
        task.setTaskPhase(input.getTaskPhase());
        
        if (!this.dao.saveProjectTask(task, projectName)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
    
    public TasksClientDto getTaskMasterList() {
        List<TasksModel> tasksModel = this.dao.getTasksMasterList();
        TasksClientDto taskList = new TasksClientDto();
        TasksDto taskDto;
        if(tasksModel.isEmpty()) {
            System.out.println("No recs in dao");
        }
        for (TasksModel task : tasksModel) {
            taskDto = new TasksDto();
            taskDto.setId(task.getId());
            taskDto.setTaskName(task.getTaskName());
            taskDto.setTaskDetails(task.getTaskDetails());
            taskList.getTaskList().add(taskDto);
        }
        if(taskList.getTaskList().isEmpty()) {
            System.out.println("No recs in dto");
        }
        return taskList;
    }
    
    public TasksClientDto searchTask(String name, String date, String phase){
        List<TasksModel> tasksModel = this.dao.searchTasksMasterList(name, date, phase);
        TasksClientDto taskList = new TasksClientDto();
        TasksDto taskDto;
        
        if(tasksModel == null){
            System.out.println("model is null");
        }
        if(tasksModel.isEmpty()){
            System.out.println("No recs in dao");
        }
        
        for(TasksModel task: tasksModel){
            taskDto = new TasksDto();
            taskDto.setId(task.getId());
            taskDto.setTaskName(task.getTaskName());
            taskDto.setTaskDetails(task.getTaskDetails());
            taskList.getTaskList().add(taskDto);
            
        }
        
        if(taskList.getTaskList().isEmpty()) {
            System.out.println("No recs in dto");
        }
        return taskList;
    }
}
