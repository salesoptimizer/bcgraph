@isTest
private class PipelineGraphControllerTest {

    static testMethod void getTotalOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Prospecting', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Prospecting', Amount = 200000, CloseDate = Date.newInstance(2016, 3, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2};
         insert opps;
         Id[] oppsId = new Id[] {opps[0].id, opps[1].id}; 
         
         Opportunity[] oppsList = PipelineGraphController.getTotalOpps(null, 2015, '4');
         
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         oppsList = PipelineGraphController.getTotalOpps(null, 2015, '1');
         system.assertEquals(new Opportunity[] {}, oppsList);
    }
    
    static testMethod void getWonOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Id[] oppsId = new Id[] {opps[1].id}; 
         
         Opportunity[] oppsList = PipelineGraphController.getWonOpps(null, 2015, '4');
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         oppsList = PipelineGraphController.getWonOpps(null, 2015, '1');
         system.assertEquals(new Opportunity[] {}, oppsList);
    }
    
    static testMethod void getLostOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Id[] oppsId = new Id[] {opps[1].id}; 
         
         Opportunity[] oppsList = PipelineGraphController.getLostOpps(null, 2015, '4');
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         oppsList = PipelineGraphController.getLostOpps(null, 2015, '1');
         system.assertEquals(new Opportunity[] {}, oppsList);
    }

    static testMethod void getOpenOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Id[] oppsId = new Id[] {opps[0].id}; 
         
         Opportunity[] oppsList = PipelineGraphController.getOpenOpps(null, 2015, '4');
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         oppsList = PipelineGraphController.getOpenOpps(null, 2015, '1');
         system.assertEquals(new Opportunity[] {}, oppsList);
    }
    
    static testMethod void getNewTotalOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Prospecting', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Prospecting', Amount = 200000, CloseDate = Date.newInstance(2016, 3, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2};
         insert opps;
         Id[] oppsId = new Id[] {opps[0].id, opps[1].id}; 
         
         Opportunity[] oppsList = PipelineGraphController.getNewTotalOpps(null, 2015, '4');
         
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         oppsList = PipelineGraphController.getNewTotalOpps(null, 2015, '1');
         system.assertEquals(new Opportunity[] {}, oppsList);
    }
    
    static testMethod void getNewWonOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Id[] oppsId = new Id[] {opps[1].id}; 
         
         Opportunity[] oppsList = PipelineGraphController.getNewWonOpps(null, 2015, '4');
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         oppsList = PipelineGraphController.getNewWonOpps(null, 2015, '1');
         system.assertEquals(new Opportunity[] {}, oppsList);
    }
    
    static testMethod void getNewLostOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Id[] oppsId = new Id[] {opps[1].id}; 
         
         Opportunity[] oppsList = PipelineGraphController.getNewLostOpps(null, 2015, '4');
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         oppsList = PipelineGraphController.getNewLostOpps(null, 2015, '1');
         system.assertEquals(new Opportunity[] {}, oppsList);
    }

    static testMethod void getTotalOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Decimal sum = opps[0].amount + opps[1].amount; 
         
         Decimal totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2015, '4');
         system.assertEquals(sum, totalAmount);
         
         totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getWonOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
         Decimal totalAmount = PipelineGraphController.getWonOppsAmount(null, 2015, '4');
         system.assertEquals(opps[1].amount, totalAmount);
         
         totalAmount = PipelineGraphController.getWonOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getLostOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
         Decimal totalAmount = PipelineGraphController.getLostOppsAmount(null, 2015, '4');
         system.assertEquals(opps[1].amount, totalAmount);
         
         totalAmount = PipelineGraphController.getLostOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getOpenOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
         Decimal totalAmount = PipelineGraphController.getOpenOppsAmount(null, 2015, '4');
         system.assertEquals(opps[0].amount, totalAmount);
         
         totalAmount = PipelineGraphController.getOpenOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getPushOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
        //  OpportunityFieldHistory[] ofh = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
         
         OpportunityFieldHistory ofh = new OpportunityFieldHistory(OpportunityId = opp.Id, Field = 'CloseDate');
         insert ofh;
        //  ofh.NewValue = opp.CloseDate;
        //  system.assertEquals(0, PipelineGraphController.getPushOppsAmount(null, 2015, '4'));
         
        //  Decimal totalAmount = PipelineGraphController.getOpenOppsAmount(null, 2015, '4');
        //  system.assertEquals(opps[0].amount, totalAmount);
         
        //  totalAmount = PipelineGraphController.getOpenOppsAmount(null, 2015, '1');
        //  system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getNewTotalOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Decimal sum = opps[0].amount + opps[1].amount; 
         
         Decimal totalAmount = PipelineGraphController.getNewTotalOppsAmount(null, 2015, '4');
         system.assertEquals(sum, totalAmount);
         
         totalAmount = PipelineGraphController.getNewTotalOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getNewWonOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
         Decimal totalAmount = PipelineGraphController.getNewWonOppsAmount(null, 2015, '4');
         system.assertEquals(opps[1].amount, totalAmount);
         
         totalAmount = PipelineGraphController.getNewWonOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getNewLostOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
         Decimal totalAmount = PipelineGraphController.getNewLostOppsAmount(null, 2015, '4');
         system.assertEquals(opps[1].amount, totalAmount);
         
         totalAmount = PipelineGraphController.getNewLostOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    /*static testMethod void getMovedTotalOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         Decimal sum = opps[0].amount + opps[1].amount; 
         
         Decimal totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2015, '4');
         system.assertEquals(sum, totalAmount);
         
         totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getMovedWonOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
         Decimal totalAmount = PipelineGraphController.getWonOppsAmount(null, 2015, '4');
         system.assertEquals(opps[1].amount, totalAmount);
         
         totalAmount = PipelineGraphController.getWonOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }
    
    static testMethod void getMovedLostOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1};
         insert opps;
         
         Decimal totalAmount = PipelineGraphController.getLostOppsAmount(null, 2015, '4');
         system.assertEquals(opps[1].amount, totalAmount);
         
         totalAmount = PipelineGraphController.getLostOppsAmount(null, 2015, '1');
         system.assertEquals(0, totalAmount);
    }*/
}