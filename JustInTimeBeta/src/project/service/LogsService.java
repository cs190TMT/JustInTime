package project.service;

import java.util.ArrayList;

import project.dao.LogsDao;
import project.dto.LogsDto;
import project.model.LogsModel;

public class LogsService {

    LogsDao dao = new LogsDao();
    
    public LogsDto addLog(LogsDto input, String projName) {
        LogsModel log = new LogsModel();
        log.setTimeStamp(input.getTimeStamp());
        log.setTaskName(input.getTaskName());
        log.setTaskPhase(input.getTaskPhase());
        log.setTimeSpent(input.getTimeSpent());
        
        if (!this.dao.saveLog(log, projName)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
    
}
