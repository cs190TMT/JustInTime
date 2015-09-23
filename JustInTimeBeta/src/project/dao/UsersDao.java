package project.dao;

import org.slim3.datastore.Datastore;


import project.model.UsersModel;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Transaction;

public class UsersDao {
    public boolean addUser(UsersModel usersModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Account", "Default"), "Users");
            usersModel.setKey(key);
            usersModel.setId(key.getId());
            Datastore.put(usersModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }
    
}
