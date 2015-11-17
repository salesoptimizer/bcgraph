({
	init : function(component, event, helper) {
        var params = event.getParam("params");
        if (helper.isInits(params)) {
            component.set("v.year", params["year"]);
            component.set("v.fiscalQuarter", params["fiscalQuarter"]);
            component.set("v.userId", params["userId"]);
            component.set("v.myOpps", params["myOpps"]);
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
        helper.deselectBars();
	},
    
    showOpps : function(component, event, helper) {
        var action;
        var targetId = event.target.id;
        var targetIdPart = targetId.split("_");
        var graphType = component.get("v.graphType").toLowerCase();
        action = helper.getActionOpps(component, targetIdPart[1])
        if (helper.isInits(action) && helper.isInits(graphType)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter"),
                graphType: graphType,
                onlyMyOpps: component.get("v.myOpps")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    helper.highlightBar(component, targetId+"Box");
                    $A.get("e.c:PipelineGraphShowOppsEvent").setParams({
                        "opps": response.getReturnValue(),
                        "tableName": document.getElementById(targetId+"Box").getElementsByTagName("span")[1].innerHTML
                    }).fire();
                }
            });
            $A.enqueueAction(action);
        }
    }
    
})