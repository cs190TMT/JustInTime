/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.dao;

import java.util.List;
import java.util.ListIterator;

import org.slim3.datastore.Datastore;

import project.meta.TasksModelMeta;
import project.model.TasksModel;




import com.google.appengine.api.datastore.Query.*;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Transaction;

public class TasksDao {

    public boolean saveMasterTask(TasksModel tasksModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            // Manually allocate key
            Key key =
                Datastore.allocateId(
                    KeyFactory.createKey("Tasks", "Master"),
                    "TasksModel");
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
            // Manually allocate key
            Key key =
                Datastore.allocateId(
                    KeyFactory.createKey("Tasks", projectName),
                    "TasksModel");
            tasksModel.setKey(key);
            tasksModel.setId(key.getId());
            Datastore.put(tasksModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }

    
    public boolean deleteMasterTask(TasksModel task){
        boolean result = true;
        
        TasksModelMeta meta = new TasksModelMeta();
        Query.Filter mainFilter = new Query.FilterPredicate("id", FilterOperator.EQUAL, task.getId());
        
        try {
            TasksModel originalTaskModel = Datastore.query(meta).filter(mainFilter).asSingle();
            if (originalTaskModel != null) {
                
                
                
                Transaction tx = Datastore.beginTransaction();
                Datastore.delete(originalTaskModel.getKey());
                tx.commit();
            } else {
                result = false;
            }
        } catch (Exception e) {
            result = false;
        }
        
        return result;
    }
    
    public List<TasksModel> validateTaskName(String taskName){
        List<TasksModel> tasksModels = null;
        
        TasksModelMeta meta = new TasksModelMeta();
        
        Query.Filter mainFilter = new Query.FilterPredicate("taskName", FilterOperator.EQUAL, taskName);
        
        
        try {
            tasksModels = Datastore.query(meta).filter(mainFilter).asList();
        } catch (Exception e) {
            
        }
        
        return tasksModels;
    }
    
    
    
   
    
    public boolean updateMasterTask(TasksModel task){
        boolean result = true;
        
        TasksModelMeta meta = new TasksModelMeta();
        Query.Filter mainFilter = new Query.FilterPredicate("id", FilterOperator.EQUAL, task.getId());
        
        try {
            TasksModel originalTaskModel = Datastore.query(meta).filter(mainFilter).asSingle();
            if (originalTaskModel != null) {
                originalTaskModel.setTaskName(task.getTaskName());
                originalTaskModel.setTaskDetails(task.getTaskDetails());
                Transaction tx = Datastore.beginTransaction();
                Datastore.put(originalTaskModel);
                tx.commit();
            } else {
                result = false;
            }
        } catch (Exception e) {
            result = false;
        }
        
        return result;
    }

    public List<TasksModel> getTasksMasterList() {
        TasksModelMeta t = new TasksModelMeta();
        Key parentKey = KeyFactory.createKey("Tasks", "Master");
        return Datastore.query(t, parentKey).sort("id", SortDirection.DESCENDING).asList();
    }
    
    public List<TasksModel> getTasksProjectList(String projectName) {
        TasksModelMeta t = new TasksModelMeta();
        Key parentKey = KeyFactory.createKey("Tasks", projectName);
        return Datastore.query(t, parentKey).asList();
    }

    public List<TasksModel> searchTasksMasterList(String name, String date,
            String phase) {
        List<TasksModel> tasksModels = null;

        try {

            TasksModelMeta meta = new TasksModelMeta();
            Key parentKey = KeyFactory.createKey("Tasks", "Master");

            Filter nameFilter = null;
            Filter dateFilter = null;
            Filter phaseFilter = null;

            if (name == null) {
                name = "";
            }
            nameFilter =
                new FilterPredicate(
                    "taskName",
                    FilterOperator.GREATER_THAN_OR_EQUAL,
                    name);

            if (date != null && date != "") {

            }

            if (phase != null) {
                phaseFilter =
                    new FilterPredicate(
                        "taskPhase",
                        FilterOperator.EQUAL,
                        phase);
            }

            tasksModels = Datastore.query(meta, parentKey).sort("id", SortDirection.DESCENDING).asList();

            ListIterator<TasksModel> itr = tasksModels.listIterator();

            while (itr.hasNext()) {

                TasksModel model = itr.next();

                if (model.getTaskName().toLowerCase().startsWith(
                    name.toLowerCase()) == false) {
                    itr.remove();
                }
            }

        } catch (Exception e) {
            System.out.println(e.toString());
            tasksModels = null;
        }
        
        
        
        return tasksModels;
    }
}
