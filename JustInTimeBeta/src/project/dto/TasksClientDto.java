package project.dto;

import java.util.ArrayList;
import java.util.List;

public class TasksClientDto {

    private List<String> errorList = new ArrayList<String>();
    
    private List<TasksDto> taskList = new ArrayList<TasksDto>();

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    public List<TasksDto> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<TasksDto> taskList) {
        this.taskList = taskList;
    }
}
