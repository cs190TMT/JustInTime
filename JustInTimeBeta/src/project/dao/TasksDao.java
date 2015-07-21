package project.dao;

import java.util.List;

import org.slim3.datastore.Datastore;

import project.meta.TasksModelMeta;
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
    
    public List<TasksModel> getAllTasks() {
        TasksModelMeta t = new TasksModelMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        return Datastore.query(t, parentKey).asList();
    }
}
