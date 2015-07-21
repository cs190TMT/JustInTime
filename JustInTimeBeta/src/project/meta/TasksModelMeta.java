package project.meta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2015-07-21 14:51:38")
/** */
public final class TasksModelMeta extends org.slim3.datastore.ModelMeta<project.model.TasksModel> {

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.TasksModel, java.lang.Long> id = new org.slim3.datastore.CoreAttributeMeta<project.model.TasksModel, java.lang.Long>(this, "id", "id", long.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.TasksModel, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<project.model.TasksModel, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.TasksModel> taskDetails = new org.slim3.datastore.StringAttributeMeta<project.model.TasksModel>(this, "taskDetails", "taskDetails");

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.TasksModel> taskName = new org.slim3.datastore.StringAttributeMeta<project.model.TasksModel>(this, "taskName", "taskName");

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.TasksModel> taskPhase = new org.slim3.datastore.StringAttributeMeta<project.model.TasksModel>(this, "taskPhase", "taskPhase");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.TasksModel, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<project.model.TasksModel, java.lang.Long>(this, "version", "version", java.lang.Long.class);

    private static final TasksModelMeta slim3_singleton = new TasksModelMeta();

    /**
     * @return the singleton
     */
    public static TasksModelMeta get() {
       return slim3_singleton;
    }

    /** */
    public TasksModelMeta() {
        super("TasksModel", project.model.TasksModel.class);
    }

    @Override
    public project.model.TasksModel entityToModel(com.google.appengine.api.datastore.Entity entity) {
        project.model.TasksModel model = new project.model.TasksModel();
        model.setId(longToPrimitiveLong((java.lang.Long) entity.getProperty("id")));
        model.setKey(entity.getKey());
        model.setTaskDetails((java.lang.String) entity.getProperty("taskDetails"));
        model.setTaskName((java.lang.String) entity.getProperty("taskName"));
        model.setTaskPhase((java.lang.String) entity.getProperty("taskPhase"));
        model.setVersion((java.lang.Long) entity.getProperty("version"));
        return model;
    }

    @Override
    public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
        project.model.TasksModel m = (project.model.TasksModel) model;
        com.google.appengine.api.datastore.Entity entity = null;
        if (m.getKey() != null) {
            entity = new com.google.appengine.api.datastore.Entity(m.getKey());
        } else {
            entity = new com.google.appengine.api.datastore.Entity(kind);
        }
        entity.setProperty("id", m.getId());
        entity.setProperty("taskDetails", m.getTaskDetails());
        entity.setProperty("taskName", m.getTaskName());
        entity.setProperty("taskPhase", m.getTaskPhase());
        entity.setProperty("version", m.getVersion());
        entity.setProperty("slim3.schemaVersion", 1);
        return entity;
    }

    @Override
    protected com.google.appengine.api.datastore.Key getKey(Object model) {
        project.model.TasksModel m = (project.model.TasksModel) model;
        return m.getKey();
    }

    @Override
    protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
        validateKey(key);
        project.model.TasksModel m = (project.model.TasksModel) model;
        m.setKey(key);
    }

    @Override
    protected long getVersion(Object model) {
        project.model.TasksModel m = (project.model.TasksModel) model;
        return m.getVersion() != null ? m.getVersion().longValue() : 0L;
    }

    @Override
    protected void assignKeyToModelRefIfNecessary(com.google.appengine.api.datastore.AsyncDatastoreService ds, java.lang.Object model) {
    }

    @Override
    protected void incrementVersion(Object model) {
        project.model.TasksModel m = (project.model.TasksModel) model;
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
        project.model.TasksModel m = (project.model.TasksModel) model;
        writer.beginObject();
        org.slim3.datastore.json.Default encoder0 = new org.slim3.datastore.json.Default();
        writer.setNextPropertyName("id");
        encoder0.encode(writer, m.getId());
        if(m.getKey() != null){
            writer.setNextPropertyName("key");
            encoder0.encode(writer, m.getKey());
        }
        if(m.getTaskDetails() != null){
            writer.setNextPropertyName("taskDetails");
            encoder0.encode(writer, m.getTaskDetails());
        }
        if(m.getTaskName() != null){
            writer.setNextPropertyName("taskName");
            encoder0.encode(writer, m.getTaskName());
        }
        if(m.getTaskPhase() != null){
            writer.setNextPropertyName("taskPhase");
            encoder0.encode(writer, m.getTaskPhase());
        }
        if(m.getVersion() != null){
            writer.setNextPropertyName("version");
            encoder0.encode(writer, m.getVersion());
        }
        writer.endObject();
    }

    @Override
    protected project.model.TasksModel jsonToModel(org.slim3.datastore.json.JsonRootReader rootReader, int maxDepth, int currentDepth) {
        project.model.TasksModel m = new project.model.TasksModel();
        org.slim3.datastore.json.JsonReader reader = null;
        org.slim3.datastore.json.Default decoder0 = new org.slim3.datastore.json.Default();
        reader = rootReader.newObjectReader("id");
        m.setId(decoder0.decode(reader, m.getId()));
        reader = rootReader.newObjectReader("key");
        m.setKey(decoder0.decode(reader, m.getKey()));
        reader = rootReader.newObjectReader("taskDetails");
        m.setTaskDetails(decoder0.decode(reader, m.getTaskDetails()));
        reader = rootReader.newObjectReader("taskName");
        m.setTaskName(decoder0.decode(reader, m.getTaskName()));
        reader = rootReader.newObjectReader("taskPhase");
        m.setTaskPhase(decoder0.decode(reader, m.getTaskPhase()));
        reader = rootReader.newObjectReader("version");
        m.setVersion(decoder0.decode(reader, m.getVersion()));
        return m;
    }
}