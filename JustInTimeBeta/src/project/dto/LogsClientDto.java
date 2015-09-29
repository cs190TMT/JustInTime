package project.dto;

import java.util.ArrayList;
import java.util.List;

public class LogsClientDto {
    private List<String> errorList = new ArrayList<String>();
    
    private List<LogsDto> logsList = new ArrayList<LogsDto>();

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    public List<LogsDto> getLogsList() {
        return logsList;
    }

    public void setLogsList(List<LogsDto> logsList) {
        this.logsList = logsList;
    }
}
