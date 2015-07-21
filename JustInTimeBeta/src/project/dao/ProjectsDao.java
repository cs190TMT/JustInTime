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
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Account", "Default"), "Projects");
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
        Key parentKey = KeyFactory.createKey("Account", "Default");
        return Datastore.query(p, parentKey).asList();
    }
}
