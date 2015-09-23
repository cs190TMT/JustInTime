package project.dto;

import java.util.List;

public class UsersDto {
    
    private List<String> errorList;
    
    private String fullName;
    private String email;
    private String password;
    
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
    
    public String getFullName(){
        return this.fullName;
    }
    
    public String getEmail(){
        return this.email;
    }
    
    public String getPassword(){
        return this.password;
    }
    
    
    public void setFullName(String fullName){
        this.fullName = fullName;
    }
    
    public void setEmail(String email){
        this.fullName = email;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
}
