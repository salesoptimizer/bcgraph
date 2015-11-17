public with sharing class NewGraphManager extends GraphManager {
	private Id userId {get;set;}
	private Integer year {get;set;}
	private Integer quarter {get;set;}
	private boolean onlyMyOpps {get;set;}
	
	public NewGraphManager(Id userId, Integer year, Integer quarter, boolean onlyMyOpps) {
		this.userId = userId == null ? UserInfo.getUserId() : userId;
		this.year = year == null ? Date.today().year() : year;
		this.quarter = quarter;
		this.onlyMyOpps = onlyMyOpps;
	}
	
	override public Decimal getTotalAmount() {
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps) 
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
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
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
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
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
							  AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
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
		AggregateResult[] aggResults = [SELECT SUM(Amount)sum
							  FROM Opportunity
							  WHERE OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps) AND CreatedDate >= :dates.get('fstDate')
							  AND Id IN :getPushedOppsIds()
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
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
				FROM Opportunity
				WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate')
				AND isClosed = false
				LIMIT 50000];
	}
	
	override public Opportunity[] getWonOpportunities() {
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
				FROM Opportunity
				WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = true AND isClosed = true
				LIMIT 50000];
	}
	
	override public Opportunity[] getLostOpportunities() {
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
				FROM Opportunity
				WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
				AND CloseDate >= :dates.get('fstDate') AND CloseDate <= :dates.get('lstDate') 
				AND isWon = false AND isClosed = true
				LIMIT 50000];
	}
	
	override public Opportunity[] getPushOpportunities() {
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		return [SELECT Id, Name, Amount, CloseDate, CreatedDate, FiscalYear, StageName
			    FROM Opportunity
			    WHERE CreatedDate >= :dates.get('fstDate') AND OwnerId IN :getUsersIdList(this.userId, this.onlyMyOpps)
			    AND Id IN :getPushedOppsIds()
			    LIMIT 50000];
	}
	
	private Set<Id> getPushedOppsIds() {
		Set<Id> filteredIds = new Set<Id>();
		Map<String, Date> dates = getQuarterDates(this.year, this.quarter);
		for (OpportunityFieldHistory ofh: [SELECT OpportunityId, OldValue, NewValue FROM OpportunityFieldHistory WHERE Field = 'CloseDate' LIMIT 50000]) {
			Date prevDate = (Date) ofh.OldValue;
			Date newDate = (Date) ofh.NewValue;
			if (prevDate >= dates.get('fstDate') && prevDate <= dates.get('lstDate') &&
				newDate > dates.get('lstDate')) {
				filteredIds.add(ofh.OpportunityId);
			}
		}
		return filteredIds;
	}
}