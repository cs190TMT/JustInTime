package project.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import project.dao.TasksDao;
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
    
    public List<TasksModel> getTaskMasterList() {
        return this.dao.getTasksMasterList();
    }
}
