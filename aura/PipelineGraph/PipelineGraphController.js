({
	init : function(component, event, helper) {
        var params = event.getParam("params");
        for (key in params) {
            component.set("v.year", params["year"]);
            component.set("v.fiscalQuarter", params["fiscalQuarter"]);
            component.set("v.userId", params["userId"]);
        }
        
        var globalId = component.getGlobalId();
        var bodyBox = document.getElementById(globalId + "_bodyBox");
        if (component.get("v.graphType").toLowerCase() == 'total') {
            bodyBox.className = bodyBox.className + " total";
        }
        
		helper.getTotalAmount(component);
        helper.getWonAmount(component);
        helper.getLostAmount(component);
        helper.getPushAmount(component);
	},
    
    showOpps : function(component, event, helper) {
        var action;
        var targetId = event.target.id;
        var targetIdPart = targetId.split("_");
        var graphType = component.get("v.graphType").toLowerCase();
        switch (graphType) {
            case "total": action = helper.getActionOpps(component, targetIdPart[1], "");
                          break;
            case "new": action = helper.getActionOpps(component, targetIdPart[1], "New");
                        break;
            case "moved in": action = helper.getActionOpps(component, targetIdPart[1], "Moved");
                             break;
            case "existing": action = helper.getActionOpps(component, targetIdPart[1], "Existing");
                             break;
            default: break;
        }
        if (helper.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    $A.get("e.c:PipelineGraphShowOppsEvent").setParams({
                        "opps": response.getReturnValue()
                    }).fire();
                }
            });
            $A.enqueueAction(action);
        }
    }
    
})