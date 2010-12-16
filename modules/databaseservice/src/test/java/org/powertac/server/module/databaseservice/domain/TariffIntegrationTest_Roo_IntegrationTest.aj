// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.powertac.server.module.databaseservice.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.powertac.server.module.databaseservice.domain.TariffDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TariffIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TariffIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TariffIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: TariffIntegrationTest: @Transactional;
    
    @Autowired
    private TariffDataOnDemand TariffIntegrationTest.dod;
    
    @Test
    public void TariffIntegrationTest.testCountTariffs() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", dod.getRandomTariff());
        long count = org.powertac.server.module.databaseservice.domain.Tariff.countTariffs();
        org.junit.Assert.assertTrue("Counter for 'Tariff' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TariffIntegrationTest.testFindTariff() {
        org.powertac.server.module.databaseservice.domain.Tariff obj = dod.getRandomTariff();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.Tariff.findTariff(id);
        org.junit.Assert.assertNotNull("Find method for 'Tariff' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Tariff' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TariffIntegrationTest.testFindAllTariffs() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", dod.getRandomTariff());
        long count = org.powertac.server.module.databaseservice.domain.Tariff.countTariffs();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Tariff', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.powertac.server.module.databaseservice.domain.Tariff> result = org.powertac.server.module.databaseservice.domain.Tariff.findAllTariffs();
        org.junit.Assert.assertNotNull("Find all method for 'Tariff' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Tariff' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TariffIntegrationTest.testFindTariffEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", dod.getRandomTariff());
        long count = org.powertac.server.module.databaseservice.domain.Tariff.countTariffs();
        if (count > 20) count = 20;
        java.util.List<org.powertac.server.module.databaseservice.domain.Tariff> result = org.powertac.server.module.databaseservice.domain.Tariff.findTariffEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Tariff' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Tariff' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TariffIntegrationTest.testFlush() {
        org.powertac.server.module.databaseservice.domain.Tariff obj = dod.getRandomTariff();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.Tariff.findTariff(id);
        org.junit.Assert.assertNotNull("Find method for 'Tariff' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTariff(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Tariff' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TariffIntegrationTest.testMerge() {
        org.powertac.server.module.databaseservice.domain.Tariff obj = dod.getRandomTariff();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.Tariff.findTariff(id);
        boolean modified =  dod.modifyTariff(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.powertac.server.module.databaseservice.domain.Tariff merged = (org.powertac.server.module.databaseservice.domain.Tariff) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Tariff' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TariffIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", dod.getRandomTariff());
        org.powertac.server.module.databaseservice.domain.Tariff obj = dod.getNewTransientTariff(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Tariff' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Tariff' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TariffIntegrationTest.testRemove() {
        org.powertac.server.module.databaseservice.domain.Tariff obj = dod.getRandomTariff();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tariff' failed to provide an identifier", id);
        obj = org.powertac.server.module.databaseservice.domain.Tariff.findTariff(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Tariff' with identifier '" + id + "'", org.powertac.server.module.databaseservice.domain.Tariff.findTariff(id));
    }
    
}
