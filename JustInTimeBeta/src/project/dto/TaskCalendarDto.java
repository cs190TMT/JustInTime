package project.dto;

import java.util.List;

public class TaskCalendarDto {
    /**
     * List of errors.
     */
    private List<String> errorList;

    private String title;

    private String start;

    /**
     * Retrieve errorList
     * @return the errorList
     */
    public List<String> getErrorList() {
        return errorList;
    }

    /**
     * Set errorList
     * @param errorList the errorList to set
     */
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }


    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getStart() {
        return this.start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    
  
}
