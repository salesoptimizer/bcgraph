({
    init : function(component, event, helper) {
        helper.setYears(component);
        helper.setQuarters(component);
        helper.setUsers(component);
        helper.createGraph(component, component.get("v.userId"), component.get("v.myOpps"));
    },
    
	send : function(component, event, helper) {
        helper.createGraph(component);
	},
	
	onSelectChange : function(component, event, helper) {
	    helper.setCheckbox(component);
	}
})