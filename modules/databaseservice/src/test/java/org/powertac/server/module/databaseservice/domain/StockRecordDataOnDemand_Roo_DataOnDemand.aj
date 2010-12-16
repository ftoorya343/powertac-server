// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.powertac.server.module.databaseservice.domain;

import java.util.List;
import java.util.Random;
import org.powertac.server.module.databaseservice.domain.StockRecord;
import org.springframework.stereotype.Component;

privileged aspect StockRecordDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StockRecordDataOnDemand: @Component;
    
    private Random StockRecordDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<StockRecord> StockRecordDataOnDemand.data;
    
    public StockRecord StockRecordDataOnDemand.getNewTransientStockRecord(int index) {
        org.powertac.server.module.databaseservice.domain.StockRecord obj = new org.powertac.server.module.databaseservice.domain.StockRecord();
        return obj;
    }
    
    public StockRecord StockRecordDataOnDemand.getSpecificStockRecord(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        StockRecord obj = data.get(index);
        return StockRecord.findStockRecord(obj.getId());
    }
    
    public StockRecord StockRecordDataOnDemand.getRandomStockRecord() {
        init();
        StockRecord obj = data.get(rnd.nextInt(data.size()));
        return StockRecord.findStockRecord(obj.getId());
    }
    
    public boolean StockRecordDataOnDemand.modifyStockRecord(StockRecord obj) {
        return false;
    }
    
    public void StockRecordDataOnDemand.init() {
        data = org.powertac.server.module.databaseservice.domain.StockRecord.findStockRecordEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'StockRecord' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.powertac.server.module.databaseservice.domain.StockRecord>();
        for (int i = 0; i < 10; i++) {
            org.powertac.server.module.databaseservice.domain.StockRecord obj = getNewTransientStockRecord(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
