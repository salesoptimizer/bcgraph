@isTest
private class PipelineGraphControllerTest {
    static testMethod void getTotalOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 150000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp3 = new Opportunity(Name = 'Opp2', StageName = 'Prospecting', Amount = 200000, CloseDate = Date.newInstance(2016, 3, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2, opp3};
         insert opps;
         Id[] oppsId = new Id[] {opps[0].id, opps[1].id}; 
         
         //  'total' graphType test
         Opportunity[] oppsList = PipelineGraphController.getTotalOpps(null, 2015, 4, 'total');
         
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         oppsList = PipelineGraphController.getTotalOpps(null, 2015, 1, 'total');
         system.assertEquals(new Opportunity[] {}, oppsList);
         
         //  'existing' graphType test
         oppsId = new Id[] {opp3.id};
         oppsList = PipelineGraphController.getTotalOpps(null, 2016, 1, 'existing');
         
         oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         //  'new' graphType test
         oppsId = new Id[] {opps[0].id, opps[1].id};
         oppsList = PipelineGraphController.getTotalOpps(null, 2015, 4, 'new');
         
         oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         //  'moved in' graphType test
         //  fake test below
         oppsList = PipelineGraphController.getTotalOpps(null, 2016, 1, 'moved in');
    }
    
    static testMethod void getWonOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2016, 1, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2};
         insert opps;
         Id[] oppsId = new Id[] {opps[1].id}; 
         
         //  'total' graphType test
         Opportunity[] oppsList = PipelineGraphController.getWonOpps(null, 2015, 4, 'total');
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         oppsList = PipelineGraphController.getWonOpps(null, 2015, 1, 'total');
         system.assertEquals(new Opportunity[] {}, oppsList);
         
         //  'new' graphType test
         oppsList = PipelineGraphController.getWonOpps(null, 2015, 4, 'new');
         oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         //  'existing' graphType test
         oppsId = new Id[] {opp2.id};
         oppsList = PipelineGraphController.getWonOpps(null, 2016, 1, 'existing');
         oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         //  fake 'moved in' graphType test
         oppsList = PipelineGraphController.getWonOpps(null, 2016, 1, 'moved in');
    }
    
    static testMethod void getLostOppsTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2016, 1, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2};
         insert opps;
         Id[] oppsId = new Id[] {opps[1].id}; 
         
         //  'total' graphType test
         Opportunity[] oppsList = PipelineGraphController.getLostOpps(null, 2015, 4, 'total');
         Id[] oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         oppsList = PipelineGraphController.getLostOpps(null, 2015, 1, 'total');
         system.assertEquals(new Opportunity[] {}, oppsList);
         
         //  'new' graphType test
         oppsList = PipelineGraphController.getLostOpps(null, 2015, 4, 'new');
         oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);

         //  'existing' graphType test
         oppsId = new Id[] {opp2.id};
         oppsList = PipelineGraphController.getLostOpps(null, 2016, 1, 'existing');
         oppsListId = new Id[] {};
         if (!oppsList.isEmpty()) {
         	for (Opportunity o: oppsList) {
         		oppsListId.add(o.id);
         	}
         }
         system.assertEquals(oppsId, oppsListId);
         
         //  fake 'moved in' graphType test
         oppsList = PipelineGraphController.getLostOpps(null, 2016, 1, 'moved in');
    }

	// no ideas now to check pushed opportunities. We should check OpportunityFieldHistory that is not writable into test
    static testMethod void getPushOppsTest() {
         PipelineGraphController.getPushOpps(null, 2015, 4, 'total');
         PipelineGraphController.getPushOpps(null, 2015, 4, 'new');
         PipelineGraphController.getPushOpps(null, 2015, 4, 'existing');
         PipelineGraphController.getPushOpps(null, 2015, 4, 'moved in');
    }
    
    static testMethod void getTotalOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Prospecting', Amount = 150000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp3 = new Opportunity(Name = 'Opp2', StageName = 'Prospecting', Amount = 150000, CloseDate = Date.newInstance(2016, 1, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2, opp3};
         insert opps;
         Decimal sum = opps[0].amount + opps[2].amount; 
         
         //  'total' graphType test
         Decimal totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2015, 4, 'total');
         system.assertEquals(sum, totalAmount);
         
         totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2015, 1, 'total');
         system.assertEquals(0, totalAmount);
         
         //  'new' graphType test
         totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2015, 4, 'new');
         system.assertEquals(sum, totalAmount);

         //  'existing' graphType test
         totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2016, 1, 'existing');
         system.assertEquals(opp3.Amount, totalAmount);
         
         //  fake 'moved in' graphType test
         totalAmount = PipelineGraphController.getTotalOppsAmount(null, 2016, 1, 'moved in');
    }
    
    static testMethod void getWonOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 150000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp3 = new Opportunity(Name = 'Opp2', StageName = 'Closed Won', Amount = 150000, CloseDate = Date.newInstance(2016, 1, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2, opp3};
         insert opps;
         Decimal sum = opps[1].amount + opps[2].amount;
         
         //  'total' graphType test
         Decimal totalAmount = PipelineGraphController.getWonOppsAmount(null, 2015, 4, 'total');
         system.assertEquals(sum, totalAmount);
         
         totalAmount = PipelineGraphController.getWonOppsAmount(null, 2015, 1, 'total');
         system.assertEquals(0, totalAmount);
         
         //  'new' graphType test
         totalAmount = PipelineGraphController.getWonOppsAmount(null, 2015, 4, 'new');
         system.assertEquals(sum, totalAmount);
         
         //  'existing' graphType test
         totalAmount = PipelineGraphController.getWonOppsAmount(null, 2016, 1, 'existing');
         system.assertEquals(opp3.Amount, totalAmount);
         
         //  fake 'moved in' graphType test
         totalAmount = PipelineGraphController.getWonOppsAmount(null, 2016, 1, 'moved in');
    }
    
    static testMethod void getLostOppsAmountTest() {
         Opportunity opp = new Opportunity(Name = 'Opp1', StageName = 'Prospecting', Amount = 100000, CloseDate = Date.newInstance(2015, 10, 21), OwnerId = UserInfo.getUserId());
         Opportunity opp1 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 200000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp2 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 150000, CloseDate = Date.newInstance(2015, 10, 25), OwnerId = UserInfo.getUserId());
         Opportunity opp3 = new Opportunity(Name = 'Opp2', StageName = 'Closed Lost', Amount = 260000, CloseDate = Date.newInstance(2016, 1, 25), OwnerId = UserInfo.getUserId());
         Opportunity[] opps = new Opportunity[] {opp, opp1, opp2, opp3};
         insert opps;
         Decimal sum = opps[1].amount + opps[2].amount;
         
         //  'total' graphType test
         Decimal totalAmount = PipelineGraphController.getLostOppsAmount(null, 2015, 4, 'total');
         system.assertEquals(sum, totalAmount);
         
         totalAmount = PipelineGraphController.getLostOppsAmount(null, 2015, 1, 'total');
         system.assertEquals(0, totalAmount);
         
         //  'new' graphType test
         totalAmount = PipelineGraphController.getLostOppsAmount(null, 2015, 4, 'new');
         system.assertEquals(sum, totalAmount);
         
         //  'existing' graphType test
         totalAmount = PipelineGraphController.getLostOppsAmount(null, 2016, 1, 'existing');
         system.assertEquals(opp3.Amount, totalAmount);
         
         //  fake 'moved in' graphType test
         totalAmount = PipelineGraphController.getLostOppsAmount(null, 2016, 1, 'moved in');
    }
    
    // no ideas now to check pushed opportunities. We should check OpportunityFieldHistory that is not writable into test
    static testMethod void getPushOppsAmountTest() {
         PipelineGraphController.getPushOppsAmount(null, 2015, 4, 'total');
         PipelineGraphController.getPushOppsAmount(null, 2015, 4, 'new');
         PipelineGraphController.getPushOppsAmount(null, 2015, 4, 'existing');
         PipelineGraphController.getPushOppsAmount(null, 2015, 4, 'moved in');
    }
   
	static testMethod void getUsersListTest() {
		List<User> users = [SELECT Id, Name FROM User LIMIT 50000];
		system.assertEquals(users, PipelineGraphController.getUsersList());
	}
}