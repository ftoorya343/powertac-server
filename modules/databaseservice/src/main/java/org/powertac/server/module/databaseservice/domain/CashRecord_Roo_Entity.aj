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
import org.powertac.server.module.databaseservice.domain.CashRecord;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CashRecord_Roo_Entity {
    
    declare @type: CashRecord: @Entity;
    
    @PersistenceContext
    transient EntityManager CashRecord.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long CashRecord.id;
    
    @Version
    @Column(name = "version")
    private Integer CashRecord.version;
    
    public Long CashRecord.getId() {
        return this.id;
    }
    
    public void CashRecord.setId(Long id) {
        this.id = id;
    }
    
    public Integer CashRecord.getVersion() {
        return this.version;
    }
    
    public void CashRecord.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void CashRecord.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CashRecord.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CashRecord attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CashRecord.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public CashRecord CashRecord.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CashRecord merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager CashRecord.entityManager() {
        EntityManager em = new CashRecord().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CashRecord.countCashRecords() {
        return entityManager().createQuery("select count(o) from CashRecord o", Long.class).getSingleResult();
    }
    
    public static List<CashRecord> CashRecord.findAllCashRecords() {
        return entityManager().createQuery("select o from CashRecord o", CashRecord.class).getResultList();
    }
    
    public static CashRecord CashRecord.findCashRecord(Long id) {
        if (id == null) return null;
        return entityManager().find(CashRecord.class, id);
    }
    
    public static List<CashRecord> CashRecord.findCashRecordEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from CashRecord o", CashRecord.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
