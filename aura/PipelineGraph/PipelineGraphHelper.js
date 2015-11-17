({
	getTotalAmount : function(component) {
		var globalId = component.getGlobalId();
        var totalHeight = document.getElementById(globalId + "_bodyBox").offsetHeight - 72;
        var action = component.get("c.getTotalOppsAmount");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter"),
                graphType: component.get("v.graphType").toLowerCase(),
                onlyMyOpps: component.get("v.myOpps")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var amount = response.getReturnValue();
                    component.set("v.totalAmount", amount);
                    this.drawGraphIfAmountsReady(component, totalHeight);
                }
            });
            $A.enqueueAction(action);
        }
	},
    
    getWonAmount : function(component) {
        var globalId = component.getGlobalId();
        var totalHeight = document.getElementById(globalId + "_bodyBox").offsetHeight - 72;
        var action = component.get("c.getWonOppsAmount");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter"),
                graphType: component.get("v.graphType").toLowerCase(),
                onlyMyOpps: component.get("v.myOpps")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var amount = response.getReturnValue();
                    component.set("v.wonAmount", amount);
                    this.drawGraphIfAmountsReady(component, totalHeight);
                }
            });
            $A.enqueueAction(action);
        }
	},
    
    getLostAmount : function(component) {
        var globalId = component.getGlobalId();
        var totalHeight = document.getElementById(globalId + "_bodyBox").offsetHeight - 72;
        var action = component.get("c.getLostOppsAmount");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter"),
                graphType: component.get("v.graphType").toLowerCase(),
                onlyMyOpps: component.get("v.myOpps")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var amount = response.getReturnValue();
                    component.set("v.lostAmount", amount);
                    this.drawGraphIfAmountsReady(component, totalHeight);
                }
            });
            $A.enqueueAction(action);
        }
	},
    
    getPushAmount : function(component) {
        var globalId = component.getGlobalId();
        var totalHeight = document.getElementById(globalId + "_bodyBox").offsetHeight - 72;
        var action = component.get("c.getPushOppsAmount");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter"),
                graphType: component.get("v.graphType").toLowerCase(),
                onlyMyOpps: component.get("v.myOpps")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var amount = response.getReturnValue();
                    component.set("v.pushAmount", amount);
                    this.drawGraphIfAmountsReady(component, totalHeight);
                }
            });
            $A.enqueueAction(action);
        }
	},
	
	getActionOpps : function(component, barType) {
	    var action;
	    if (this.isInits(barType) && barType.length > 0) {
    	    switch (barType) {
                case "totalBar": action = component.get("c.getTotalOpps");
                                 break;
                case "wonBar":   action = component.get("c.getWonOpps");
                                 break;
                case "lostBar":  action = component.get("c.getLostOpps");
                                 break;
                case "pushBar":  action = component.get("c.getPushOpps");
                                 break;
                default: break;
            }
	    }
	    return action;
	},
	
	drawGraphIfAmountsReady : function(component, totalHeight) {
	    var totalAmount = component.get("v.totalAmount");
        var wonAmount = component.get("v.wonAmount");
        var lostAmount = component.get("v.lostAmount");
        var pushAmount = component.get("v.pushAmount");
        if (this.isInits(totalAmount) && this.isInits(wonAmount) && this.isInits(lostAmount) && this.isInits(pushAmount)) {
            this.resizeGraph(component, totalHeight);
        }
	},
	
	isInits : function(obj) {
	    return obj !== null && obj !== undefined;
	},
	
	resizeGraph : function(component, totalHeight) {
	    var amounts = [];
	    var globalId = component.getGlobalId();
	    amounts.push(["total", Number(component.get("v.totalAmount"))]);
	    amounts.push(["won", Number(component.get("v.wonAmount"))]);
	    amounts.push(["lost", Number(component.get("v.lostAmount"))]);
	    amounts.push(["push", Number(component.get("v.pushAmount"))]);
	    if (amounts.length > 0) {
    	    amounts.sort(function (a, b) {
    	        var result  = 0;
    	        if (a[1] < b[1]) result = 1;
    	        if (a[1] > b[1]) result = -1;
    	        return result;
    	    });
    	    var maxAmount = amounts[0][1];
    	    for (var i = 0; i < amounts.length; i++) {
    	        var bar = document.getElementById(globalId + "_" + amounts[i][0] + "Bar");
    	        var height = 0;
    	        if (maxAmount > 0) {
    	            height = totalHeight * (amounts[i][1] / maxAmount);
    	        }
    	        height = height > 0 ? height : 1;
        		bar.style.height = height + "px";
        		var top = totalHeight - height;
                document.getElementById(globalId + "_" + amounts[i][0] + "BarBox").style.top = top + "px";
    	    }
	    }
	},
	
	highlightBar : function(component, targetId) {
	    this.deselectBars();
	    var targetBar = document.getElementById(targetId);
	    targetBar.className = targetBar.className + " selectedBar";
	},
	
	deselectBars : function() {
	    var selectedBars = document.getElementsByClassName("selectedBar");
	    if (selectedBars.length > 0) {
	        for (var i = 0; i < selectedBars.length; i++) {
	            selectedBars[i].className = selectedBars[i].className.split(" ")[0];
	        }
	    }
	}
})