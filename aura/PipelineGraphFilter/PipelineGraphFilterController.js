({
    init : function(component, event, helper) {
        var currentYear = new Date().getFullYear();
        var opts = [
            { label: currentYear - 2, value: currentYear - 2 },
            { label: currentYear - 1, value: currentYear - 1 },
            { label: currentYear, value: currentYear, selected: "true" },
            { label: currentYear + 1, value: currentYear + 1 },
            { label: currentYear + 2, value: currentYear + 2 }
           
        ];
        component.find("yearSelector").set("v.options", opts);
        helper.getUsers(component);
    },
    
	send : function(component, event, helper) {
        var year = component.find("yearSelector").get("v.value");
        var fiscalQuarter = component.find("fiscalQuarter").get("v.value");
        var userId = component.find("userSelector").get("v.value");
        var params = component.get("v.params");
        params["year"] = year;
        params["fiscalQuarter"] = fiscalQuarter;
        params["userId"] = userId;
        
        $A.get("e.c:PipelineGraphDateFilterEvent").setParams({
            "params": params
        }).fire();
	}
})