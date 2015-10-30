({
	showOpps : function(component, event, helper) {
		component.set("v.opps", event.getParam("opps"));
        var hostname = window.location.hostname.split(".");
        component.set("v.hostname", hostname[0]);
	},
    
    clearOpps : function(component, event, helper) {
		component.set("v.opps", null);
	}
})