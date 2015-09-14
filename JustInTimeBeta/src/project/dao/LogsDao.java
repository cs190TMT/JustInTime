package project.dao;

import java.util.List;

import org.slim3.datastore.Datastore;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Transaction;

import project.meta.LogsModelMeta;
import project.meta.TasksModelMeta;
import project.model.LogsModel;
import project.model.TasksModel;

public class LogsDao {

    public boolean saveLog(LogsModel logModel, String projectName) {
        boolean result = true;
        try{
            Transaction tx = Datastore.beginTransaction();
            
            Key key = Datastore.allocateId(KeyFactory.createKey("Logs", projectName), "LogsModel");
            logModel.setKey(key);
            logModel.setId(key.getId());
            Datastore.put(logModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        
        return result;
    }
    //made by dk not sure tho
    public List<LogsModel> getLogsList(String projectName) {
        LogsModelMeta t = new LogsModelMeta();
        Key parentKey = KeyFactory.createKey("Logs", projectName);
        return Datastore.query(t, parentKey).asList();
    }
    
}
