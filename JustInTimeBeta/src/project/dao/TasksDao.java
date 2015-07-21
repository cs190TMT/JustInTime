package project.dao;

import org.slim3.datastore.Datastore;

import project.model.TasksModel;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Transaction;

public class TasksDao {

    public boolean saveTask(TasksModel tasksModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Account", "Default"), "Tasks");
            tasksModel.setKey(key);
            tasksModel.setId(key.getId());
            Datastore.put(tasksModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }
    
}
