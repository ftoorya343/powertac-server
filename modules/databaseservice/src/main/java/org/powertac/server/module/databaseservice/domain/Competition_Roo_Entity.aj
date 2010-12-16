// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.powertac.server.module.databaseservice.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.powertac.server.module.databaseservice.domain.Competition;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Competition_Roo_Entity {
    
    declare @type: Competition: @Entity;
    
    @PersistenceContext
    transient EntityManager Competition.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Competition.id;
    
    @Version
    @Column(name = "version")
    private Integer Competition.version;
    
    public Long Competition.getId() {
        return this.id;
    }
    
    public void Competition.setId(Long id) {
        this.id = id;
    }
    
    public Integer Competition.getVersion() {
        return this.version;
    }
    
    public void Competition.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Competition.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Competition.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Competition attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Competition.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Competition Competition.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Competition merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Competition.entityManager() {
        EntityManager em = new Competition().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Competition.countCompetitions() {
        return entityManager().createQuery("select count(o) from Competition o", Long.class).getSingleResult();
    }
    
    public static List<Competition> Competition.findAllCompetitions() {
        return entityManager().createQuery("select o from Competition o", Competition.class).getResultList();
    }
    
    public static Competition Competition.findCompetition(Long id) {
        if (id == null) return null;
        return entityManager().find(Competition.class, id);
    }
    
    public static List<Competition> Competition.findCompetitionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Competition o", Competition.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
