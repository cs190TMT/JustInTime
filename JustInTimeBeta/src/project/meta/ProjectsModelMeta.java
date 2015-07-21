package project.meta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2015-07-21 16:21:44")
/** */
public final class ProjectsModelMeta extends org.slim3.datastore.ModelMeta<project.model.ProjectsModel> {

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.ProjectsModel, java.lang.Long> id = new org.slim3.datastore.CoreAttributeMeta<project.model.ProjectsModel, java.lang.Long>(this, "id", "id", long.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.ProjectsModel, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<project.model.ProjectsModel, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.ProjectsModel> projectDetails = new org.slim3.datastore.StringAttributeMeta<project.model.ProjectsModel>(this, "projectDetails", "projectDetails");

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.ProjectsModel> projectName = new org.slim3.datastore.StringAttributeMeta<project.model.ProjectsModel>(this, "projectName", "projectName");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.ProjectsModel, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<project.model.ProjectsModel, java.lang.Long>(this, "version", "version", java.lang.Long.class);

    private static final ProjectsModelMeta slim3_singleton = new ProjectsModelMeta();

    /**
     * @return the singleton
     */
    public static ProjectsModelMeta get() {
       return slim3_singleton;
    }

    /** */
    public ProjectsModelMeta() {
        super("ProjectsModel", project.model.ProjectsModel.class);
    }

    @Override
    public project.model.ProjectsModel entityToModel(com.google.appengine.api.datastore.Entity entity) {
        project.model.ProjectsModel model = new project.model.ProjectsModel();
        model.setId(longToPrimitiveLong((java.lang.Long) entity.getProperty("id")));
        model.setKey(entity.getKey());
        model.setProjectDetails((java.lang.String) entity.getProperty("projectDetails"));
        model.setProjectName((java.lang.String) entity.getProperty("projectName"));
        model.setVersion((java.lang.Long) entity.getProperty("version"));
        return model;
    }

    @Override
    public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
        project.model.ProjectsModel m = (project.model.ProjectsModel) model;
        com.google.appengine.api.datastore.Entity entity = null;
        if (m.getKey() != null) {
            entity = new com.google.appengine.api.datastore.Entity(m.getKey());
        } else {
            entity = new com.google.appengine.api.datastore.Entity(kind);
        }
        entity.setProperty("id", m.getId());
        entity.setProperty("projectDetails", m.getProjectDetails());
        entity.setProperty("projectName", m.getProjectName());
        entity.setProperty("version", m.getVersion());
        entity.setProperty("slim3.schemaVersion", 1);
        return entity;
    }

    @Override
    protected com.google.appengine.api.datastore.Key getKey(Object model) {
        project.model.ProjectsModel m = (project.model.ProjectsModel) model;
        return m.getKey();
    }

    @Override
    protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
        validateKey(key);
        project.model.ProjectsModel m = (project.model.ProjectsModel) model;
        m.setKey(key);
    }

    @Override
    protected long getVersion(Object model) {
        project.model.ProjectsModel m = (project.model.ProjectsModel) model;
        return m.getVersion() != null ? m.getVersion().longValue() : 0L;
    }

    @Override
    protected void assignKeyToModelRefIfNecessary(com.google.appengine.api.datastore.AsyncDatastoreService ds, java.lang.Object model) {
    }

    @Override
    protected void incrementVersion(Object model) {
        project.model.ProjectsModel m = (project.model.ProjectsModel) model;
        long version = m.getVersion() != null ? m.getVersion().longValue() : 0L;
        m.setVersion(Long.valueOf(version + 1L));
    }

    @Override
    protected void prePut(Object model) {
    }

    @Override
    protected void postGet(Object model) {
    }

    @Override
    public String getSchemaVersionName() {
        return "slim3.schemaVersion";
    }

    @Override
    public String getClassHierarchyListName() {
        return "slim3.classHierarchyList";
    }

    @Override
    protected boolean isCipherProperty(String propertyName) {
        return false;
    }

    @Override
    protected void modelToJson(org.slim3.datastore.json.JsonWriter writer, java.lang.Object model, int maxDepth, int currentDepth) {
        project.model.ProjectsModel m = (project.model.ProjectsModel) model;
        writer.beginObject();
        org.slim3.datastore.json.Default encoder0 = new org.slim3.datastore.json.Default();
        writer.setNextPropertyName("id");
        encoder0.encode(writer, m.getId());
        if(m.getKey() != null){
            writer.setNextPropertyName("key");
            encoder0.encode(writer, m.getKey());
        }
        if(m.getProjectDetails() != null){
            writer.setNextPropertyName("projectDetails");
            encoder0.encode(writer, m.getProjectDetails());
        }
        if(m.getProjectName() != null){
            writer.setNextPropertyName("projectName");
            encoder0.encode(writer, m.getProjectName());
        }
        if(m.getVersion() != null){
            writer.setNextPropertyName("version");
            encoder0.encode(writer, m.getVersion());
        }
        writer.endObject();
    }

    @Override
    protected project.model.ProjectsModel jsonToModel(org.slim3.datastore.json.JsonRootReader rootReader, int maxDepth, int currentDepth) {
        project.model.ProjectsModel m = new project.model.ProjectsModel();
        org.slim3.datastore.json.JsonReader reader = null;
        org.slim3.datastore.json.Default decoder0 = new org.slim3.datastore.json.Default();
        reader = rootReader.newObjectReader("id");
        m.setId(decoder0.decode(reader, m.getId()));
        reader = rootReader.newObjectReader("key");
        m.setKey(decoder0.decode(reader, m.getKey()));
        reader = rootReader.newObjectReader("projectDetails");
        m.setProjectDetails(decoder0.decode(reader, m.getProjectDetails()));
        reader = rootReader.newObjectReader("projectName");
        m.setProjectName(decoder0.decode(reader, m.getProjectName()));
        reader = rootReader.newObjectReader("version");
        m.setVersion(decoder0.decode(reader, m.getVersion()));
        return m;
    }
}