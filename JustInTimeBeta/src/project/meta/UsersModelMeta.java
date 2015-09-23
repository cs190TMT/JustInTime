package project.meta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2015-07-29 11:17:24")
/** */
public final class UsersModelMeta extends org.slim3.datastore.ModelMeta<project.model.UsersModel> {

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.UsersModel> email = new org.slim3.datastore.StringAttributeMeta<project.model.UsersModel>(this, "email", "email");

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.UsersModel> fullName = new org.slim3.datastore.StringAttributeMeta<project.model.UsersModel>(this, "fullName", "fullName");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.UsersModel, java.lang.Long> id = new org.slim3.datastore.CoreAttributeMeta<project.model.UsersModel, java.lang.Long>(this, "id", "id", long.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.UsersModel, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<project.model.UsersModel, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

    /** */
    public final org.slim3.datastore.StringAttributeMeta<project.model.UsersModel> password = new org.slim3.datastore.StringAttributeMeta<project.model.UsersModel>(this, "password", "password");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<project.model.UsersModel, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<project.model.UsersModel, java.lang.Long>(this, "version", "version", java.lang.Long.class);

    private static final UsersModelMeta slim3_singleton = new UsersModelMeta();

    /**
     * @return the singleton
     */
    public static UsersModelMeta get() {
       return slim3_singleton;
    }

    /** */
    public UsersModelMeta() {
        super("UsersModel", project.model.UsersModel.class);
    }

    @Override
    public project.model.UsersModel entityToModel(com.google.appengine.api.datastore.Entity entity) {
        project.model.UsersModel model = new project.model.UsersModel();
        model.setEmail((java.lang.String) entity.getProperty("email"));
        model.setFullName((java.lang.String) entity.getProperty("fullName"));
        model.setId(longToPrimitiveLong((java.lang.Long) entity.getProperty("id")));
        model.setKey(entity.getKey());
        model.setPassword((java.lang.String) entity.getProperty("password"));
        model.setVersion((java.lang.Long) entity.getProperty("version"));
        return model;
    }

    @Override
    public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
        project.model.UsersModel m = (project.model.UsersModel) model;
        com.google.appengine.api.datastore.Entity entity = null;
        if (m.getKey() != null) {
            entity = new com.google.appengine.api.datastore.Entity(m.getKey());
        } else {
            entity = new com.google.appengine.api.datastore.Entity(kind);
        }
        entity.setProperty("email", m.getEmail());
        entity.setProperty("fullName", m.getFullName());
        entity.setProperty("id", m.getId());
        entity.setProperty("password", m.getPassword());
        entity.setProperty("version", m.getVersion());
        entity.setProperty("slim3.schemaVersion", 1);
        return entity;
    }

    @Override
    protected com.google.appengine.api.datastore.Key getKey(Object model) {
        project.model.UsersModel m = (project.model.UsersModel) model;
        return m.getKey();
    }

    @Override
    protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
        validateKey(key);
        project.model.UsersModel m = (project.model.UsersModel) model;
        m.setKey(key);
    }

    @Override
    protected long getVersion(Object model) {
        project.model.UsersModel m = (project.model.UsersModel) model;
        return m.getVersion() != null ? m.getVersion().longValue() : 0L;
    }

    @Override
    protected void assignKeyToModelRefIfNecessary(com.google.appengine.api.datastore.AsyncDatastoreService ds, java.lang.Object model) {
    }

    @Override
    protected void incrementVersion(Object model) {
        project.model.UsersModel m = (project.model.UsersModel) model;
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
        project.model.UsersModel m = (project.model.UsersModel) model;
        writer.beginObject();
        org.slim3.datastore.json.Default encoder0 = new org.slim3.datastore.json.Default();
        if(m.getEmail() != null){
            writer.setNextPropertyName("email");
            encoder0.encode(writer, m.getEmail());
        }
        if(m.getFullName() != null){
            writer.setNextPropertyName("fullName");
            encoder0.encode(writer, m.getFullName());
        }
        writer.setNextPropertyName("id");
        encoder0.encode(writer, m.getId());
        if(m.getKey() != null){
            writer.setNextPropertyName("key");
            encoder0.encode(writer, m.getKey());
        }
        if(m.getPassword() != null){
            writer.setNextPropertyName("password");
            encoder0.encode(writer, m.getPassword());
        }
        if(m.getVersion() != null){
            writer.setNextPropertyName("version");
            encoder0.encode(writer, m.getVersion());
        }
        writer.endObject();
    }

    @Override
    protected project.model.UsersModel jsonToModel(org.slim3.datastore.json.JsonRootReader rootReader, int maxDepth, int currentDepth) {
        project.model.UsersModel m = new project.model.UsersModel();
        org.slim3.datastore.json.JsonReader reader = null;
        org.slim3.datastore.json.Default decoder0 = new org.slim3.datastore.json.Default();
        reader = rootReader.newObjectReader("email");
        m.setEmail(decoder0.decode(reader, m.getEmail()));
        reader = rootReader.newObjectReader("fullName");
        m.setFullName(decoder0.decode(reader, m.getFullName()));
        reader = rootReader.newObjectReader("id");
        m.setId(decoder0.decode(reader, m.getId()));
        reader = rootReader.newObjectReader("key");
        m.setKey(decoder0.decode(reader, m.getKey()));
        reader = rootReader.newObjectReader("password");
        m.setPassword(decoder0.decode(reader, m.getPassword()));
        reader = rootReader.newObjectReader("version");
        m.setVersion(decoder0.decode(reader, m.getVersion()));
        return m;
    }
}