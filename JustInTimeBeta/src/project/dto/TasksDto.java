package project.dto;

import java.util.List;

public class TasksDto {
    /**
     * List of errors.
     */
    private List<String> errorList;

    private long id;

    private String taskName;

    private String taskDetails;
    
    private String taskPhase;
    
    private String dateCreated;
    
    private int projID;
    
    private float timeAlloted;
    
    private float timeSpent;

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

    /**
     * Retrieve id
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * Set id
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    public String getTaskName() {
        return this.taskName;
    }

    public void setTaskName(String name) {
        this.taskName = name;
    }
    
    public String getTaskDetails() {
        return this.taskDetails;
    }

    public void setTaskDetails(String details) {
        this.taskDetails = details;
    }
    
    public String getTaskPhase() {
        return this.taskPhase;
    }

    public void setTaskPhase(String phase) {
        this.taskPhase = phase;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public float getTimeAlloted() {
        return timeAlloted;
    }

    public void setTimeAlloted(float timeAlloted) {
        this.timeAlloted = timeAlloted;
    }

    public float getTimeSpent() {
        return timeSpent;
    }

    public void setTimeSpent(float timeSpent) {
        this.timeSpent = timeSpent;
    }
    
    public int getProjId(){
        return this.projID;
    }
    
    public void setprojId(int ProjId){
        this.projID = ProjId;
    }
}
