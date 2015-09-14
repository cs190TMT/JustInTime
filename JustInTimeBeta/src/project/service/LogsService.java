package project.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import project.dao.LogsDao;
import project.dto.LogsClientDto;
import project.dto.LogsDto;
import project.dto.TasksClientDto;
import project.dto.TasksDto;
import project.model.LogsModel;
import project.model.TasksModel;

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
    
    public LogsClientDto getLogsList(String projectName) {
        List<LogsModel> logsModel = this.dao.getLogsList(projectName);
        LogsClientDto logList = new LogsClientDto();
        LogsDto logsDto;
        if(logsModel.isEmpty()) {
            System.out.println("No recs in dao");
        }
        for (LogsModel log : logsModel) {
            logsDto = new LogsDto();
            logsDto.setId(log.getId());
            logsDto.setTaskName(log.getTaskName());
            logList.getLogsList().add(logsDto);
        }
        if(logList.getLogsList().isEmpty()) {
            System.out.println("No recs in dto");
        }
        return logList;
    }
    
}
