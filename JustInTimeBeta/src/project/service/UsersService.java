package project.service;

import java.util.ArrayList;

import project.dao.UsersDao;
import project.dto.UsersDto;
import project.model.UsersModel;



public class UsersService {
    
    UsersDao dao = new UsersDao();
    public UsersDto addUser(UsersDto input) {
        UsersModel user = new UsersModel();
        
        user.setFullName(input.getFullName());
        user.setEmail(input.getEmail());
        user.setPassword(input.getPassword());
        
        
        if (!this.dao.addUser(user)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
}
