package project.dao;

import java.util.List;

import org.slim3.datastore.Datastore;

import project.meta.ProjectsModelMeta;
import project.model.ProjectsModel;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Transaction;

public class ProjectsDao {
    public boolean saveProject(ProjectsModel projectsModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            
            Key key = Datastore.allocateId(KeyFactory.createKey("Projects", projectsModel.getProjectName()), "ProjectsModel");
            projectsModel.setKey(key);
            projectsModel.setId(key.getId());
            Datastore.put(projectsModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }
    
    public List<ProjectsModel> getAllProjects() {
        ProjectsModelMeta p = new ProjectsModelMeta();
        return Datastore.query(p).asList();
    }
    
    public List<ProjectsModel> validateProjectName(ProjectsModel task){
        List<ProjectsModel> projectsModels = null;
        
        ProjectsModelMeta meta = new ProjectsModelMeta();
        
        Query.Filter mainFilter = new Query.FilterPredicate("projectName", FilterOperator.EQUAL, task.getProjectName());
        Query.Filter secondFilter = new Query.FilterPredicate("id", FilterOperator.NOT_EQUAL, task.getId());
        
        try {
            projectsModels = Datastore.query(meta).filter(mainFilter).filter(secondFilter).asList();
        } catch (Exception e) {
            
        }
        
        return projectsModels;
    }
}
