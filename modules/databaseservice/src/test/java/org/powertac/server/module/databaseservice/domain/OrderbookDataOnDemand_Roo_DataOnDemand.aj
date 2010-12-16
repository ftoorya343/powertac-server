// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.powertac.server.module.databaseservice.domain;

import java.util.List;
import java.util.Random;
import org.powertac.server.module.databaseservice.domain.Orderbook;
import org.springframework.stereotype.Component;

privileged aspect OrderbookDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OrderbookDataOnDemand: @Component;
    
    private Random OrderbookDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<Orderbook> OrderbookDataOnDemand.data;
    
    public Orderbook OrderbookDataOnDemand.getNewTransientOrderbook(int index) {
        org.powertac.server.module.databaseservice.domain.Orderbook obj = new org.powertac.server.module.databaseservice.domain.Orderbook();
        return obj;
    }
    
    public Orderbook OrderbookDataOnDemand.getSpecificOrderbook(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Orderbook obj = data.get(index);
        return Orderbook.findOrderbook(obj.getId());
    }
    
    public Orderbook OrderbookDataOnDemand.getRandomOrderbook() {
        init();
        Orderbook obj = data.get(rnd.nextInt(data.size()));
        return Orderbook.findOrderbook(obj.getId());
    }
    
    public boolean OrderbookDataOnDemand.modifyOrderbook(Orderbook obj) {
        return false;
    }
    
    public void OrderbookDataOnDemand.init() {
        data = org.powertac.server.module.databaseservice.domain.Orderbook.findOrderbookEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Orderbook' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.powertac.server.module.databaseservice.domain.Orderbook>();
        for (int i = 0; i < 10; i++) {
            org.powertac.server.module.databaseservice.domain.Orderbook obj = getNewTransientOrderbook(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}
