public with sharing abstract class GraphManager {
	abstract public Decimal getTotalAmount();
	abstract public Decimal getWonAmount();
	abstract public Decimal getLostAmount();
	abstract public Decimal getPushAmount();
	abstract public Opportunity[] getTotalOpportunities();
	abstract public Opportunity[] getWonOpportunities();
	abstract public Opportunity[] getLostOpportunities();
	abstract public Opportunity[] getPushOpportunities();
	
	@TestVisible
	protected Map<String, Date> getQuarterDates(Integer year, Integer quarter) {
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
	
	@TestVisible
	protected List<Id> getUsersIdList(Id userId, boolean onlyMyOpps) {
		List<User> users = new List<User>();
		if (onlyMyOpps) {
			users = [SELECT Id FROM User
				     WHERE Id = :userId
				     AND isActive = true
				     LIMIT 50000];	
		} else {
			users = [SELECT Id FROM User
				     WHERE (Id = :userId
				     OR ManagerId = :userId
				     OR Manager.ManagerId = :userId
				     OR Manager.Manager.ManagerId = :userId
				     OR Manager.Manager.Manager.ManagerId = :userId)
				     AND isActive = true
				     LIMIT 50000];
     	}
		List<Id> usersId = new List<Id>();
		if (!users.isEmpty()) {
			for (User u: users) {
				usersId.add(u.Id);	
			}
		}
		return usersId;
	}
}