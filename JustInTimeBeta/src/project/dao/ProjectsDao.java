package project.dao;

import java.util.List;

import org.slim3.datastore.Datastore;

import project.meta.ProjectsModelMeta;
import project.model.ProjectsModel;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
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
}
