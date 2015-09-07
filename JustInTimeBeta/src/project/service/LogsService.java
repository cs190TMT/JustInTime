package project.service;

import java.util.ArrayList;
import java.util.Date;

import project.dao.LogsDao;
import project.dto.LogsDto;
import project.model.LogsModel;

public class LogsService {

    LogsDao dao = new LogsDao();
    
    public LogsDto addLog(LogsDto input, String projectName) {
        LogsModel log = new LogsModel();
        log.setTimeStamp(input.getTimeStamp());
        log.setTaskName(input.getTaskName());
        log.setTaskPhase(input.getTaskPhase());
        log.setTimeSpent(input.getTimeSpent());
        log.setTimeStamp(new Date().toString());
        
        if (!this.dao.saveLog(log, projectName)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
    
}
