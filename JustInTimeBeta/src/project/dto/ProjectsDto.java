package project.dto;

import java.util.List;

public class ProjectsDto {
    /**
     * List of errors.
     */
    private List<String> errorList;

    private long id;

    private String projectName;

    private String projectDetails;

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

    public String getProjectName() {
        return this.projectName;
    }

    public void setProjectName(String name) {
        this.projectName = name;
    }
    
    public String getProjectDetails() {
        return this.projectDetails;
    }

    public void setProjectDetails(String details) {
        this.projectDetails = details;
    }
}
