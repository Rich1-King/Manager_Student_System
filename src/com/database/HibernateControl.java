package com.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Created by rich1 on 6/15/16.
 */
public class HibernateControl{

    private static HibernateControl instance = null;

    private Configuration conf;
    private ServiceRegistry serviceRegistry;
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction translate;

    public static HibernateControl getInstance()
    {
        if(instance == null)
        {
            instance = new HibernateControl();
            instance.Open();
        }
        return instance;
    }

    //open database
    private void Open()
    {
        conf = new Configuration().configure();
        serviceRegistry = new ServiceRegistryBuilder()
                .applySettings(conf.getProperties()).buildServiceRegistry();
        sessionFactory = conf.buildSessionFactory(serviceRegistry);
    }

    public Session getSession()
    {
        session = sessionFactory.openSession();
        translate =  session.beginTransaction();
        return this.session;
    }
    //execute mand
    public void execute()
    {
        translate.commit();
    }

    //close database
    public void close()
    {
        session.close();
    }
}
