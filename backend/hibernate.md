# Hibernate Learning
## 1. Steps for adding an object in DB
* **Database**
	 * create DB
	 * আগে থেকে কোনো  টেবিল না বানালেও  হবে। 
* **POJO class**
	 * @Entity: property গুলো কে টেবিলের কলাম হিসেবে ব্যবহার করার জন্য এই Annotation দিতে হয়। 
	 * @Id: primary key mention করতে এটা ব্যবহার করার জন্য দিতে হয়। 
* **pom.xml**
	 * database dependency দিতে হবে। আমি MySQL use করব তাই mysql-connector add করেছি। 
	 * hibernate-core dependency add করতে হবে। 
	 * N:B: dependency গুলো পাওয়া যাবে [এখানে](https://mvnrepository.com/)
* **hibernate configuration file**
	 * এই directory(src/main/java) তে  file create করতে হবে। 
	 * file এর নাম by default "hibernate.cfg.xml" এইটা থাকে। চাইলে অন্য নাম দেওয়া যায়। কিন্তু সেক্ষেত্রে configure("") করার সময় ফাইলের নাম দিতে হয় parameter হিসেবে। 
	 * database dialect: "org.hibernate.dialect.MySQL5Dialect"
	 * driver class : "com.mysql.jdbc.Driver"
	 * url: "jdbc:mysql://localhost:port_number/database_name"
	 * username: "root"
	 * password: "mysql"(আমার ক্ষেত্রে localhost এর জন্য এইটা) 
* **add properties in .cfg file**
	 * hbm2ddl.auto : 
		   * update ব্যবহার করলে table না থাকলে create করবে আর থাকলে value insert করবে। 
		   * create ব্যবহার করলে প্রতিবার  table বানাবে আর আগের (যদি থাকে) table কে drop করবে। 
	 * show_sql: query console এ দেখতে চাইলে এই  property কে true করে দিতে হয়। 
* **to save obj**
	 * create obj
	 * set properties value
	 * save(obj)
* **code**
        Alien alien = new Alien();
        alien.setAid(4);
        alien.setAname("nohai"); 
        alien.setAcolor("blue");

>       Configuration con = new Configuration().configure().addAnnotatedClass(Alien.class);
        ServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        SessionFactory sf = con.buildSessionFactory(reg);
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        session.save(alien);
        tx.commit();
## 2. fetch data from DB
_সব কিছু আগের মতোই শুধু এখানে save এর পরিবর্তে get() বা load use করতে হবে।_
> obj = (Object) session.get(class_name.class , primary_key)
* **get vs load method**
 * 
	   * get সব সময় ই  DB এ  hit করে। fetched data কাজে না লাগলেও। 
	   * load শুধু মাত্র দরকার লাগলে hit করে। 
 * 
	   * get obj return করে সব সময়। 
	   * load proxy obj return করে যদি ওই obj কাজে না লাগে। 
 * 
	   * get thows nullpointer exception
	   * load throws object nt found exception

## 3. Annotations
	* @Entity
	* @Id
	* @Table
	* @Column
	* @Transient
	* @Embeddable
	* @@Cacheable
	* @Cache(usage = CacheConcurrencyStrategy.READ_ONLY)

* **@Entity(name="table_name") এভাবে নাম mention করে দেওয়া যায়। mention না করলে default নাম use হয়।**

## 4. Hibernate Caching
* first level cache by default hibernate এ থাকে। 
### second level caching steps
* **update pom.xml**
  * add echache
  * add hibernate-echache (same version of hibernate-core)
* **update .cfg file**
	>  `<property name="hibernate.cache.use_second_level_cache">true</property>
	 >  <property name="hibernate.cache.region.factory_class">org.hibernate.cache.ehcache.EhCacheRegionFactory</property>`
* **update POJO class**
  * @Cacheable
  * @Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
## 5. JPA
* **update pom.xml**
	 * MySQL
	 * hibernate-core
* **create POJO** (আগের মতো করেই) 
* **create xml**
	 * এই directory(src/main/resources/META-INF) তে .xml file create করতে হবে। 
	 * file এর নাম persistence.xml দিতে হবে। 
* **code for xml file**
> `<persistence version="2.1"
      xmlns="http://xmlns.jcp.org/xml/ns/persistence" 
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence 
      http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd">
>     <persistence-unit name="pu">
	<properties>
	   <property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver"/>
	   <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:port_number/database_name"/>
	   <property name="javax.persistence.jdbc.user" value="root"/>
	   <property name="javax.persistence.jdbc.password" value="mysql"/>
	</properties>
      </persistence-unit></persistence>`
* **to insert an object into DB**
  >     Alien alien = new Alien();
    	alien.setAid(102);
    	alien.setAname("Haque");
    	alien.setAcolor("blue");
    	
   > 	EntityManagerFactory emf = Persistence.createEntityManagerFactory("pu");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(alien);
		em.getTransaction().commit();

## 6. Mapping Relations
###### বুঝিনি এখনো ভাল মতো। 
## 7. others
 * **HQL**: SQL query এর মতোই। 
 * **EAGER vs LAZY**
	  * EAGER সব সময় ই query করে। 
	  * LAZY শুধু মাত্র দরকারের সময় করে। 
 * **query cache**
 * **persistence life cycle**
	  * Transient
	  * Persistent
	  * Detached
	  * Removed
	  * Garbage


 
