public with sharing class PipelineGraphController {
	
	@AuraEnabled
	public static User[] getUsersList() {
		return [SELECT Id, Name FROM User LIMIT 50000];
	}
	
	@AuraEnabled
	public static Decimal getExistingTotalOppsAmount(Id userId, Integer year, String quarter) {
		return getExistingTotalOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getExistingWonOppsAmount(Id userId, Integer year, String quarter) {
		return getExistingWonOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getExistingLostOppsAmount(Id userId, Integer year, String quarter) {
		return getExistingLostOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getExistingPushOppsAmount(Id userId, Integer year, String quarter) {
		return getExistingPushOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getMovedTotalOppsAmount(Id userId, Integer year, String quarter) {
		return getMovedTotalOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getMovedWonOppsAmount(Id userId, Integer year, String quarter) {
		return getMovedWonOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getMovedLostOppsAmount(Id userId, Integer year, String quarter) {
		return getMovedLostOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getMovedPushOppsAmount(Id userId, Integer year, String quarter) {
		return getMovedPushOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getNewTotalOppsAmount(Id userId, Integer year, String quarter) {
		return getNewTotalOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getNewWonOppsAmount(Id userId, Integer year, String quarter) {
		return getNewWonOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getNewLostOppsAmount(Id userId, Integer year, String quarter) {
		return getNewLostOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getNewPushOppsAmount(Id userId, Integer year, String quarter) {
		return getNewPushOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getTotalOppsAmount(Id userId, Integer year, String quarter) {
		PipelineGraphController.GraphManager gm = new PipelineGraphController.TotalGraphManager(userId, year, Integer.valueOf(quarter));
		return gm.getTotalAmount();
		// return getTotalOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getWonOppsAmount(Id userId, Integer year, String quarter) {
		PipelineGraphController.GraphManager gm = new PipelineGraphController.TotalGraphManager(userId, year, Integer.valueOf(quarter));
		return gm.getWonAmount();
		// return getWonOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getLostOppsAmount(Id userId, Integer year, String quarter) {
		PipelineGraphController.GraphManager gm = new PipelineGraphController.TotalGraphManager(userId, year, Integer.valueOf(quarter));
		return gm.getLostAmount();
		// return getLostOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Decimal getPushOppsAmount(Id userId, Integer year, String quarter) {
		PipelineGraphController.GraphManager gm = new PipelineGraphController.TotalGraphManager(userId, year, Integer.valueOf(quarter));
		return gm.getPushAmount();
		// return getPushOpportunitiesAmount(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getExistingTotalOpps(Id userId, Integer year, String quarter) {
		return getExistingTotalOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getExistingWonOpps(Id userId, Integer year, String quarter) {
		return getExistingWonOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getExistingLostOpps(Id userId, Integer year, String quarter) {
		return getExistingLostOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getExistingPushOpps(Id userId, Integer year, String quarter) {
		return getExistingPushOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getMovedTotalOpps(Id userId, Integer year, String quarter) {
		return getMovedTotalOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getMovedWonOpps(Id userId, Integer year, String quarter) {
		return getMovedWonOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getMovedLostOpps(Id userId, Integer year, String quarter) {
		return getMovedLostOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getMovedPushOpps(Id userId, Integer year, String quarter) {
		return getMovedPushOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getNewTotalOpps(Id userId, Integer year, String quarter) {
		return getNewTotalOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getNewWonOpps(Id userId, Integer year, String quarter) {
		return getNewWonOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getNewLostOpps(Id userId, Integer year, String quarter) {
		return getNewLostOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getNewPushOpps(Id userId, Integer year, String quarter) {
		return getNewPushOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getTotalOpps(Id userId, Integer year, String quarter) {
		return getTotalOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getWonOpps(Id userId, Integer year, String quarter) {
		return getWonOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getLostOpps(Id userId, Integer year, String quarter) {
		return getLostOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	@AuraEnabled
	public static Opportunity[] getPushOpps(Id userId, Integer year, String quarter) {
		return getPushOpportunities(userId, year, Integer.valueOf(quarter));
	}
	
	public static Decimal getExistingTotalOpportunitiesAmount(Id userId, Integer year, Integer quarter) {	
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);	
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
							  AND isClosed = false
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0;
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getExistingWonOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
							  AND isWon = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getExistingLostOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
							  AND isWon = false AND isClosed = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getExistingPushOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
							  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
							  AND isClosed = false
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getMovedTotalOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.NewValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
							  AND isClosed = false
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getMovedWonOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.NewValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
							  AND isWon = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getMovedLostOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.NewValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
							  AND isWon = false AND isClosed = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getMovedPushOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		Set<Id> oppsId = new Set<Id>();
		for (Opportunity opp: getMovedTotalOpportunities(userId, year, quarter)) {
			oppsId.add(opp.Id);
		}
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate') && oppsId.contains(ofh.OpportunityId)) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getNewTotalOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId = :userId 
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
							  AND isClosed = false
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getNewWonOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId = :userId
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
							  AND isWon = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getNewLostOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId = :userId
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
							  AND isWon = false AND isClosed = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	public static Decimal getNewPushOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId AND CreatedDate >= :dates.get('fstDate')
							  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}
	
	/*public static Decimal getTotalOpportunitiesAmount(Id userId, Integer year, Integer quarter) {	
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);	
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
							  AND isClosed = false
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0;
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}*/
	
	/*public static Decimal getWonOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
							  AND isWon = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}*/
	
	/*public static Decimal getLostOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
							  AND isWon = false AND isClosed = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}*/
	
	/*public static Decimal getPushOpportunitiesAmount(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId = :userId
							  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
							  AND isClosed = false
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		sum = (Decimal) aggResults[0].get('sum');
	  	}
		return sum;
	}*/
	
	public static Opportunity[] getExistingTotalOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isClosed = false
				LIMIT 50000];
	}
	
	public static Opportunity[] getExistingWonOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = true AND isClosed = true
				LIMIT 50000];
	}
	
	public static Opportunity[] getExistingLostOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = false AND isClosed = true
				LIMIT 50000];
	}
	
	public static Opportunity[] getExistingPushOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
			    FROM Opportunity
			    WHERE OwnerId = :userId AND CreatedDate <= :dates.get('fstDate')
			    AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
			    AND isClosed = false
			    LIMIT 50000];
	}
	
	public static Opportunity[] getMovedTotalOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.NewValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		}
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE FiscalQuarter = :quarter AND OwnerId = :userId
				AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
				AND isClosed = false
				LIMIT 50000];
	}
	
	public static Opportunity[] getMovedWonOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.NewValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId
				AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
				AND isWon = true
				LIMIT 50000];
	}
	
	public static Opportunity[] getMovedLostOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.NewValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		}
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId
				AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
				AND isWon = false AND isClosed = true 
				LIMIT 50000];
	}
	
	public static Opportunity[] getMovedPushOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		}  
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
			    FROM Opportunity
			    WHERE OwnerId = :userId
			    AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
			    LIMIT 50000];
	}
	
	public static Opportunity[] getNewTotalOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId = :userId
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
				AND isClosed = false
				LIMIT 50000];
	}
	
	public static Opportunity[] getNewWonOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId = :userId
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = true AND isClosed = true
				LIMIT 50000];
	}
	
	public static Opportunity[] getNewLostOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId = :userId
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = false AND isClosed = true
				LIMIT 50000];
	}
	
	public static Opportunity[] getNewPushOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
			    FROM Opportunity
			    WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId = :userId
			    AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
			    AND isClosed = false
			    LIMIT 50000];
	}
	
	public static Opportunity[] getTotalOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isClosed = false
				LIMIT 50000];
	}
	
	public static Opportunity[] getWonOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = true AND isClosed = true
				LIMIT 50000];
	}
	
	public static Opportunity[] getLostOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
				FROM Opportunity
				WHERE OwnerId = :userId
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = false AND isClosed = true
				LIMIT 50000];
	}
	
	public static Opportunity[] getPushOpportunities(Id userId, Integer year, Integer quarter) {
		userId = userId == null ? UserInfo.getUserId() : userId;
		Map<String, Date> dates = getQuarterDates(year, quarter);
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		for (OpportunityFieldHistory ofh: ofhList) {
			Date chgdDate = (Date) ofh.OldValue;
			if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		} 
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear
			    FROM Opportunity
			    WHERE OwnerId = :userId
			    AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
			    AND isClosed = false
			    LIMIT 50000];
	}
	
	abstract class GraphManager {
		abstract public Decimal getTotalAmount();
		abstract public Decimal getWonAmount();
		abstract public Decimal getLostAmount();
		abstract public Decimal getPushAmount();
		// abstract public Decimal getTotalOpps();
		// abstract public Decimal getWonOpps();
		// abstract public Decimal getLostOpps();
		// abstract public Decimal getPushOpps();
	}
	
	class TotalGraphManager extends GraphManager {
		private Id userId {get;set;}
		private Integer year {get;set;}
		private Integer quarter {get;set;}
		
		public TotalGraphManager(Id userId, Integer year, Integer quarter) {
			this.userId = userId;
			this.year = year;
			this.quarter = quarter;
		}
		
		override public Decimal getTotalAmount() {
			this.userId = this.userId == null ? UserInfo.getUserId() : this.userId;
			Map<String, Date> dates = getQuarterDates(this.year, this.quarter);	
			AggregateResult[] aggResults = [SELECT SUM(Amount)sum
								  FROM Opportunity
								  WHERE OwnerId = :this.userId
								  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
								  AND isClosed = false
								  GROUP BY OwnerId
								  LIMIT 50000];
			Decimal sum = 0;
		  	if (!aggResults.isEmpty()) {
		  		sum = (Decimal) aggResults[0].get('sum');
		  	}
			return sum;
		}
		override public Decimal getWonAmount() {
			this.userId = this.userId == null ? UserInfo.getUserId() : this.userId;
			Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
			AggregateResult[] aggResults = [SELECT SUM(Amount)sum
								  FROM Opportunity
								  WHERE OwnerId = :this.userId
								  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
								  AND isWon = true
								  GROUP BY OwnerId
								  LIMIT 50000];
			Decimal sum = 0; 
		  	if (!aggResults.isEmpty()) {
		  		sum = (Decimal) aggResults[0].get('sum');
		  	}
			return sum;
		}
		override public Decimal getLostAmount() {
			this.userId = this.userId == null ? UserInfo.getUserId() : this.userId;
			Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
			AggregateResult[] aggResults = [SELECT SUM(Amount)sum
								  FROM Opportunity
								  WHERE OwnerId = :this.userId
								  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
								  AND isWon = false AND isClosed = true
								  GROUP BY OwnerId
								  LIMIT 50000];
			Decimal sum = 0; 
		  	if (!aggResults.isEmpty()) {
		  		sum = (Decimal) aggResults[0].get('sum');
		  	}
			return sum;
		}
		override public Decimal getPushAmount() {
			this.userId = this.userId == null ? UserInfo.getUserId() : this.userId;
			Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
			OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
			List<Id> filteredIds = new List<Id>();
			for (OpportunityFieldHistory ofh: ofhList) {
				Date chgdDate = (Date) ofh.OldValue;
				if (chgdDate >= dates.get('fstDate') && chgdDate <= dates.get('lstDate')) {
					filteredIds.add(ofh.OpportunityId);
				}
			} 
			AggregateResult[] aggResults = [SELECT SUM(Amount)sum
								  FROM Opportunity
								  WHERE OwnerId = :this.userId
								  AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
								  AND isClosed = false
								  GROUP BY OwnerId
								  LIMIT 50000];
			Decimal sum = 0; 
		  	if (!aggResults.isEmpty()) {
		  		sum = (Decimal) aggResults[0].get('sum');
		  	}
			return sum;
		}
		// public Decimal getTotalOpps(){return null;}
		// public Decimal getWonOpps(){return null;}
		// public Decimal getLostOpps(){return null;}
		// public Decimal getPushOpps(){return null;}
	}
	
	private static Map<String, Date> getQuarterDates(Integer year, Integer quarter) {
		Map<String, Date> dates = new Map<String, Date>();
		if (quarter == 1) {
			dates.put('fstDate', Date.newInstance(year, 1, 1));
			dates.put('lstDate', Date.newInstance(year, 3, 31));
		} else if (quarter == 2) {
			dates.put('fstDate', Date.newInstance(year, 4, 1));
			dates.put('lstDate', Date.newInstance(year, 6, 30));
		} else if (quarter == 3) {
			dates.put('fstDate', Date.newInstance(year, 7, 1));
			dates.put('lstDate', Date.newInstance(year, 9, 30));
		} else if (quarter == 4) {
			dates.put('fstDate', Date.newInstance(year, 10, 1));
			dates.put('lstDate', Date.newInstance(year, 12, 31));
		}
		return dates;
	}
	
}