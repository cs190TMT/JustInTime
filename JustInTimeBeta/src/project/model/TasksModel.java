/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.model;

import java.io.Serializable;

import com.google.appengine.api.datastore.Key;

import org.slim3.datastore.Attribute;
import org.slim3.datastore.Model;

@Model(schemaVersion = 1)
public class TasksModel implements Serializable {
    
    private static final long serialVersionUID = 1l;
    
    @Attribute(primaryKey = true)
    private Key key;
    
    @Attribute(version = true)
    private Long version;
    
    private long id;
    
    private String taskName;
    
    private String taskDetails;
    
    private String taskPhase;
    
    private String dateCreated;
    
    private int projID;
    
    private float timeAlloted;
    
    private float timeSpent;

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((key == null) ? 0 : key.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        TasksModel other = (TasksModel) obj;
        if (key == null) {
            if (other.key != null) {
                return false;
            }
        } else if (!key.equals(other.key)) {
            return false;
        }
        return true;
    }
    
    /**
     * Returns the key.
     *
     * @return the key
     */
    public Key getKey() {
        return key;
    }

    /**
     * Sets the key.
     *
     * @param key
     *            the key
     */
    public void setKey(Key key) {
        this.key = key;
    }

    /**
     * Returns the version.
     *
     * @return the version
     */
    public Long getVersion() {
        return version;
    }
    
    /**
     * Sets the version.
     *
     * @param version
     *            the version
     */
    public void setVersion(Long version) {
        this.version = version;
    }
    
    public long getId() {
        return this.id;
    }
    
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
        return this.dateCreated;
    }
    
    public void setDateCreated(String date) {
        this.dateCreated = date;
    }
    
    public float getTimeAlloted() {
        return this.timeAlloted;
    }
    
    public void setTimeAlloted(float time) {
        this.timeAlloted = time;
    }
    
    public float getTimeSpent() {
        return this.timeSpent;
    }
    
    public void setTimeSpent(float time) {
        this.timeSpent = time;
    }
    
    public int getProjId(){
        return this.projID;
    }
    
    public void setprojId(int ProjId){
        this.projID = ProjId;
    }
}
