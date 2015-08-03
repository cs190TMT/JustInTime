package project.dao;

import java.util.List;

import org.slim3.datastore.Datastore;

import project.meta.TasksModelMeta;
import project.model.TasksModel;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Transaction;

public class TasksDao {

    public boolean saveMasterTask(TasksModel tasksModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Tasks", "Master"), "TasksModel");
            tasksModel.setKey(key);
            tasksModel.setId(key.getId());
            Datastore.put(tasksModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }
    
    public boolean saveProjectTask(TasksModel tasksModel, String projectName) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Tasks", projectName), "TasksModel");
            tasksModel.setKey(key);
            tasksModel.setId(key.getId());
            Datastore.put(tasksModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }
    
    public List<TasksModel> getTasksMasterList() {
        TasksModelMeta t = new TasksModelMeta();
        Key parentKey = KeyFactory.createKey("Tasks", "Master");
        return Datastore.query(t, parentKey).asList();
    }
}
