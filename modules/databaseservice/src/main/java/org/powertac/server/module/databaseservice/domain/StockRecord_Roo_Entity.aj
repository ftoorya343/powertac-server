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
import org.powertac.server.module.databaseservice.domain.StockRecord;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StockRecord_Roo_Entity {
    
    declare @type: StockRecord: @Entity;
    
    @PersistenceContext
    transient EntityManager StockRecord.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long StockRecord.id;
    
    @Version
    @Column(name = "version")
    private Integer StockRecord.version;
    
    public Long StockRecord.getId() {
        return this.id;
    }
    
    public void StockRecord.setId(Long id) {
        this.id = id;
    }
    
    public Integer StockRecord.getVersion() {
        return this.version;
    }
    
    public void StockRecord.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void StockRecord.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void StockRecord.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            StockRecord attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void StockRecord.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public StockRecord StockRecord.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StockRecord merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager StockRecord.entityManager() {
        EntityManager em = new StockRecord().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long StockRecord.countStockRecords() {
        return entityManager().createQuery("select count(o) from StockRecord o", Long.class).getSingleResult();
    }
    
    public static List<StockRecord> StockRecord.findAllStockRecords() {
        return entityManager().createQuery("select o from StockRecord o", StockRecord.class).getResultList();
    }
    
    public static StockRecord StockRecord.findStockRecord(Long id) {
        if (id == null) return null;
        return entityManager().find(StockRecord.class, id);
    }
    
    public static List<StockRecord> StockRecord.findStockRecordEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from StockRecord o", StockRecord.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
