package project.model;

import java.io.Serializable;

import com.google.appengine.api.datastore.Key;

import org.slim3.datastore.Attribute;
import org.slim3.datastore.Model;

@Model(schemaVersion = 1)
public class UsersModel implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    
    @Attribute(primaryKey = true)
    private Key key;

    @Attribute(version = true)
    private Long version;
    
    private long id;
    
    private String fullName;
    private String email;
    private String password;

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
        UsersModel other = (UsersModel) obj;
        if (key == null) {
            if (other.key != null) {
                return false;
            }
        } else if (!key.equals(other.key)) {
            return false;
        }
        return true;
    }

    public long getId(){
        return this.id;
    }
    
    public void setId(long id){
        this.id = id;
    }
  
    
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;

    }
    
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;

    }
    
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;

    }

    public void setId(Long id) {
        this.id = id;
    }
    
}
