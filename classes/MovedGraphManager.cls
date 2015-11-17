public with sharing class MovedGraphManager extends GraphManager {
	private Id userId {get;set;}
	private Integer year {get;set;}
	private Integer quarter {get;set;}
	private boolean onlyMyOpps {get;set;}
	
	public MovedGraphManager(Id userId, Integer year, Integer quarter, boolean onlyMyOpps) {
		this.userId = userId == null ? UserInfo.getUserId() : userId;
		this.year = year == null ? Date.today().year() : year;
		this.quarter = quarter;
		this.onlyMyOpps = onlyMyOpps;
	}
	
	override public Decimal getTotalAmount() {
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
							  AND Id IN :getMovedInIds()
							  AND isClosed = false
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		for (AggregateResult agRes: aggResults) {
	  			sum += (Decimal) agRes.get('sum');
	  		}
	  	}
		return sum;
	}
	
	override public Decimal getWonAmount() {
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
							  AND Id IN :getMovedInIds()
							  AND isWon = true AND isClosed = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		for (AggregateResult agRes: aggResults) {
	  			sum += (Decimal) agRes.get('sum');
	  		}
	  	}
		return sum;
	}
	
	override public Decimal getLostAmount() {
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
							  AND Id IN :getMovedInIds()
							  AND isWon = false AND isClosed = true
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		for (AggregateResult agRes: aggResults) {
	  			sum += (Decimal) agRes.get('sum');
	  		}
	  	}
		return sum;
	}
	
	override public Decimal getPushAmount() {
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		Set<Id> oppsId = getMovedInIds();
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		Set<Id> filteredIds = new Set<Id>();
		if (!ofhList.isEmpty()) {
			for (OpportunityFieldHistory ofh: ofhList) {
				Date newDate = (Date) ofh.NewValue;
				if (oppsId.contains(ofh.OpportunityId) && newDate > dates.get('lstDate')) {
					filteredIds.add(ofh.OpportunityId);
				}
			} 
		}
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
							  AND Id IN :filteredIds
							  GROUP BY OwnerId
							  LIMIT 50000];
		Decimal sum = 0; 
	  	if (!aggResults.isEmpty()) {
	  		for (AggregateResult agRes: aggResults) {
	  			sum += (Decimal) agRes.get('sum');
	  		}
	  	}
		return sum;
	}
	
	override public Opportunity[] getTotalOpportunities() {
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
				FROM Opportunity
				WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
				AND Id IN :getMovedInIds()
				AND isClosed = false
				LIMIT 50000];
	}
	
	override public Opportunity[] getWonOpportunities() {
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
				FROM Opportunity
				WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
				AND Id IN :getMovedInIds()
				AND isWon = true AND isClosed = true
				LIMIT 50000];
	}
	
	override public Opportunity[] getLostOpportunities() {
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
				FROM Opportunity
				WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
				AND Id IN :getMovedInIds()
				AND isWon = false AND isClosed = true 
				LIMIT 50000];
	}
	
	override public Opportunity[] getPushOpportunities() {
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		Set<Id> oppsId = getMovedInIds();
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		List<Id> filteredIds = new List<Id>();
		if (!ofhList.isEmpty()) {
			for (OpportunityFieldHistory ofh: ofhList) {
				Date newDate = (Date) ofh.NewValue;
				if (oppsId.contains(ofh.OpportunityId) && newDate > dates.get('lstDate')) {
					filteredIds.add(ofh.OpportunityId);
				}
			}  
		}
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
			    FROM Opportunity
			    WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
			    AND Id IN (SELECT OpportunityId FROM OpportunityFieldHistory WHERE OpportunityId IN :filteredIds)
			    LIMIT 50000];
	}
	
	public Set<Id> getMovedInIds() {
		Set<Id> filteredIds = new Set<Id>();
		OpportunityFieldHistory[] ofhList = [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000];
		if (!ofhList.isEmpty()) {
			Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
			for (OpportunityFieldHistory ofh: ofhList) {
				Date prevDate = (Date) ofh.OldValue;
				Date newDate = (Date) ofh.NewValue;
				if (newDate >= dates.get('fstDate') && newDate <= dates.get('lstDate') &&
					prevDate < dates.get('fstDate')) {
					filteredIds.add(ofh.OpportunityId);
				}
			} 
		}
		return filteredIds;
	}
}