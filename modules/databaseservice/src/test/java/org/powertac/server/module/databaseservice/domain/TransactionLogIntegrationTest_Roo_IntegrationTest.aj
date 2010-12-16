// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.powertac.server.module.databaseservice.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.powertac.server.module.databaseservice.domain.TransactionLogDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TransactionLogIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TransactionLogIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TransactionLogIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: TransactionLogIntegrationTest: @Transactional;
    
    @Autowired
    private TransactionLogDataOnDemand TransactionLogIntegrationTest.dod;
    
    @Test
    public void TransactionLogIntegrationTest.testCountTransactionLogs() {
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", dod.getRandomTransactionLog());
        long count = org.powertac.server.module.databaseservice.domain.TransactionLog.countTransactionLogs();
        org.junit.Assert.assertTrue("Counter for 'TransactionLog' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TransactionLogIntegrationTest.testFindTransactionLog() {
        org.powertac.server.module.databaseservice.domain.TransactionLog obj = dod.getRandomTransactionLog();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.TransactionLog.findTransactionLog(id);
        org.junit.Assert.assertNotNull("Find method for 'TransactionLog' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'TransactionLog' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TransactionLogIntegrationTest.testFindAllTransactionLogs() {
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", dod.getRandomTransactionLog());
        long count = org.powertac.server.module.databaseservice.domain.TransactionLog.countTransactionLogs();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'TransactionLog', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.powertac.server.module.databaseservice.domain.TransactionLog> result = org.powertac.server.module.databaseservice.domain.TransactionLog.findAllTransactionLogs();
        org.junit.Assert.assertNotNull("Find all method for 'TransactionLog' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'TransactionLog' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TransactionLogIntegrationTest.testFindTransactionLogEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", dod.getRandomTransactionLog());
        long count = org.powertac.server.module.databaseservice.domain.TransactionLog.countTransactionLogs();
        if (count > 20) count = 20;
        java.util.List<org.powertac.server.module.databaseservice.domain.TransactionLog> result = org.powertac.server.module.databaseservice.domain.TransactionLog.findTransactionLogEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'TransactionLog' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'TransactionLog' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TransactionLogIntegrationTest.testFlush() {
        org.powertac.server.module.databaseservice.domain.TransactionLog obj = dod.getRandomTransactionLog();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.TransactionLog.findTransactionLog(id);
        org.junit.Assert.assertNotNull("Find method for 'TransactionLog' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTransactionLog(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'TransactionLog' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TransactionLogIntegrationTest.testMerge() {
        org.powertac.server.module.databaseservice.domain.TransactionLog obj = dod.getRandomTransactionLog();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.TransactionLog.findTransactionLog(id);
        boolean modified =  dod.modifyTransactionLog(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.powertac.server.module.databaseservice.domain.TransactionLog merged = (org.powertac.server.module.databaseservice.domain.TransactionLog) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'TransactionLog' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TransactionLogIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", dod.getRandomTransactionLog());
        org.powertac.server.module.databaseservice.domain.TransactionLog obj = dod.getNewTransientTransactionLog(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'TransactionLog' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'TransactionLog' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TransactionLogIntegrationTest.testRemove() {
        org.powertac.server.module.databaseservice.domain.TransactionLog obj = dod.getRandomTransactionLog();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'TransactionLog' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.TransactionLog.findTransactionLog(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'TransactionLog' with identifier '" + id + "'", org.powertac.server.module.databaseservice.domain.TransactionLog.findTransactionLog(id));
    }
    
}
