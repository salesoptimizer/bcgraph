public with sharing class PipelineGraphController {
	
	@AuraEnabled
	public static UserModel[] getUsersList() {
		List<UserModel> userModelList = new List<UserModel>();
		Map<Id,Profile> profileIds = new Map<id,profile>([SELECT Id,UserLicenseId 
														  FROM Profile 
														  WHERE UserLicenseId IN (SELECT Id FROM UserLicense WHERE name ='Salesforce')
														  LIMIT 50000]);
		List<User> users = [SELECT Id, Name, ManagerId 
		    			FROM User 
		    			WHERE isActive = true AND profileId in:profileIds.Keyset()
		    			ORDER BY Name ASC
		    			LIMIT 50000];
		if (!users.isEmpty()) {
			Set<Id> managersId = new Set<Id>();
			for (User u: users) {
				managersId.add(u.ManagerId);
			}
			for (User u: users) {
				boolean isManager = managersId.contains(u.Id) ? true : false;
				UserModel um = new UserModel(u.Name, u.Id, isManager);
				if (UserInfo.getUserId() == u.Id) {
					um.isCurrent = true;
				}
				userModelList.add(um);
			}
		}
		return userModelList;
	}
	
	@AuraEnabled
	public static Decimal getTotalOppsAmount(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getTotalAmount();
	}
	
	@AuraEnabled
	public static Decimal getWonOppsAmount(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getWonAmount();
	}
	
	@AuraEnabled
	public static Decimal getLostOppsAmount(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getLostAmount();
	}
	
	@AuraEnabled
	public static Decimal getPushOppsAmount(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getPushAmount();
	}
	
	@AuraEnabled
	public static Opportunity[] getTotalOpps(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getTotalOpportunities();
	}
	
	@AuraEnabled
	public static Opportunity[] getWonOpps(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getWonOpportunities();
	}
	
	@AuraEnabled
	public static Opportunity[] getLostOpps(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getLostOpportunities();
	}
	
	@AuraEnabled
	public static Opportunity[] getPushOpps(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager gm = null;
		if (!String.isBlank(graphType) && year != null && quarter != null) {
			gm = getGraphManager(userId, year, quarter, graphType, onlyMyOpps);
		}
		return gm.getPushOpportunities();
	}
	
	private static GraphManager getGraphManager(Id userId, Integer year, Integer quarter, String graphType, boolean onlyMyOpps) {
		GraphManager manager = null;
		if (!String.isBlank(graphType)) {
			if (graphType.equals('total')) {
				manager = new TotalGraphManager(userId, year, quarter, onlyMyOpps);
			}
			if (graphType.equals('new')) {
				manager = new NewGraphManager(userId, year, quarter, onlyMyOpps);
			}
			if (graphType.equals('existing')) {
				manager = new ExistingGraphManager(userId, year, quarter, onlyMyOpps);
			}
			if (graphType.equals('moved in')) {
				manager = new MovedGraphManager(userId, year, quarter, onlyMyOpps);
			}
		}
		return manager;
	}
	
	class UserModel {
		@AuraEnabled public String userName {get;set;}
		@AuraEnabled public Id userId {get;set;}
		@AuraEnabled public boolean isManager {get;set;}
		@AuraEnabled public boolean isCurrent {get;set;}
		
		public UserModel(String userName, Id userId, boolean isManager) {
			this.userName = userName;
			this.userId = userId;
			this.isManager = isManager;
			this.isCurrent = false;
		}
	}
}