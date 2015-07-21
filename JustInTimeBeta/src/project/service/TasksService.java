package project.service;

import java.util.ArrayList;

import project.dao.TasksDao;
import project.dto.TasksDto;
import project.model.TasksModel;

public class TasksService {
    
    TasksDao dao = new TasksDao();
    
    public TasksDto addTask(TasksDto input) {
        TasksModel task = new TasksModel();
        task.setTaskName(input.getTaskName());
        task.setTaskDetails(input.getTaskDetails());
        task.setTaskPhase(input.getTaskPhase());
        
        if (!this.dao.saveTask(task)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
}
