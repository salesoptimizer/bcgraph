({
    
    setUsers : function(component) {
        var action = component.get("c.getUsersList");
        action.setCallback(this, function(response) {
            var users = response.getReturnValue();
            var opts = [];
            var managersId = [];
            for (var i = 0; i < users.length; i++) {
                if (!users[i].isCurrent) {
                    opts.push({ label: users[i].userName, value: users[i].userId });
                } else {
                    opts.push({ label: users[i].userName, value: users[i].userId, selected: "true" });
                }
                if (users[i].isManager) {
                    managersId.push(users[i].userId);
                }
            }
            component.set("v.managers", managersId);
            component.find("userSelector").set("v.options", opts);
            this.setCheckbox(component);
        });
        $A.enqueueAction(action);
    },
    
    setQuarters : function(component) {
        var quarter = component.get("v.quarter");
        if ($A.util.isEmpty(quarter)) {
            var today = new Date();
            for (var month = 9, i = 3; month >= 0; month-=3) {
                if (today >= new Date(today.getFullYear(), month, 1)) {
                    quarter = ++i;
                    break;
                }    
                i--;
            }
        }
        var opts = [];
        for (var i = 1; i < 5; i++) {
            if (i == quarter) {
                opts.push({ label: i, value: i, selected: "true" });
            } else {
                opts.push({ label: i, value: i });
            }
        }
        component.find("fiscalQuarter").set("v.options", opts);
    },
    
    setYears : function(component) {
        var year = component.get("v.year");
        var selectedYear = $A.util.isEmpty(year) ? new Date().getFullYear() : year;
        var currentYear = new Date().getFullYear() - 2;
        var opts = [];
        while (currentYear <= new Date().getFullYear() + 2) {
            if (currentYear == selectedYear) {
                opts.push({ label: currentYear, value: currentYear, selected: "true" });
            } else {
                opts.push({ label: currentYear, value: currentYear });
            }
            currentYear++;
        }
        component.find("yearSelector").set("v.options", opts);
    },
    
    createGraph : function(component, uId, uOpps) {
        var userId = $A.util.isEmpty(uId) ? component.find("userSelector").get("v.value") : uId;
        var myOpps = $A.util.isEmpty(uOpps) ? component.find("managerCheckbox").get("v.value") : uOpps;
        var params = {
            "year": component.find("yearSelector").get("v.value"),
            "fiscalQuarter": component.find("fiscalQuarter").get("v.value"),
            "userId": userId,
            "myOpps": myOpps
        }
        $A.get("e.c:PipelineGraphDateFilterEvent").setParams({
            "params": params
        }).fire();
    },
    
    setCheckbox : function(component) {
        var managers = component.get("v.managers");
	    var selectedUser = component.find("userSelector").get("v.value");
	    var myOppsCheckbox = component.find("managerCheckbox");
	    var myOppsCheckboxBox = document.getElementById("managerCheckboxBox");
	    var isManager = managers.indexOf(selectedUser) == -1 ? false : true;
	    myOppsCheckbox.set("v.value", !isManager);
	    myOppsCheckboxBox.style.visibility = isManager ? "visible" : "hidden";
    }
    
})