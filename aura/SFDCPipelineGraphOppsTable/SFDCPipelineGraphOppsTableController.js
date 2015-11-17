({
	showOpps : function(component, event, helper) {
		component.set("v.opps", event.getParam("opps"));
		component.set("v.tableName", event.getParam("tableName"));
	},
    
    clearOpps : function(component, event, helper) {
		component.set("v.opps", null);
	}
})