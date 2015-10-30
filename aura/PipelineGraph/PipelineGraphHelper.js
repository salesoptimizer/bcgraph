({
	getTotalAmount : function(component) {
		var globalId = component.getGlobalId();
        var totalHeight = document.getElementById(globalId + "_bodyBox").offsetHeight - 72;
        var action = this.getActionOppsAmount(component, component.get("v.graphType").toLowerCase(), "Total");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter")
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
        var action = this.getActionOppsAmount(component, component.get("v.graphType").toLowerCase(), "Won");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter")
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
        var action = this.getActionOppsAmount(component, component.get("v.graphType").toLowerCase(), "Lost");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter")
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
        var action = this.getActionOppsAmount(component, component.get("v.graphType").toLowerCase(), "Push");
        if (this.isInits(action)) {
            action.setParams({
                userId: component.get("v.userId"),
                year: component.get("v.year"),
                quarter: component.get("v.fiscalQuarter")
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
	
	getActionOppsAmount : function(component, graphType, type) {
	    var action;
	    if (this.isInits(graphType) && graphType.length > 0 &&
	        this.isInits(type) && type.length > 0) {
    	    switch (graphType) {
                case "new":   	 	 action = component.get("c.getNew" + type + "OppsAmount");
                               	  	 break;
                case "moved in":     action = component.get("c.getMoved" + type + "OppsAmount");
                               	 	 break;
                case "existing":     action = component.get("c.getExisting" + type + "OppsAmount");
                                     break;
                case "total": 		 action = component.get("c.get" + type + "OppsAmount");
                                     break;
                default: break;
            }
	    }
	    return action;
	},
	
	getActionOpps : function(component, barType, graphType) {
	    var action;
	    if (this.isInits(barType) && barType.length > 0 &&
	        this.isInits(graphType)) {
    	    switch (barType) {
                case "totalBar": action = component.get("c.get" + graphType + "TotalOpps");
                                 break;
                case "wonBar":   action = component.get("c.get" + graphType + "WonOpps");
                                 break;
                case "lostBar":  action = component.get("c.get" + graphType + "LostOpps");
                                 break;
                case "pushBar":  action = component.get("c.get" + graphType + "PushOpps");
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
	}
})