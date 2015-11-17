({
    setPrintUrl : function(component, event, helper) {
        var params = event.getParam("params");
        var url = "/apex/PipelineGraphPrintableView?" + 
                  "year=" + params["year"] + "&" +
                  "quarter=" + params["fiscalQuarter"] + "&" +
                  "myOpps=" + params["myOpps"];
        if (params["userId"] === undefined) {
            url += "&userId=" + params["userId"];
        } else {
            url += "&userId=\"" + params["userId"] + "\"";
        }
        component.set("v.url", url);
    },
    
    openPrintView : function(component, event, helper) {
        window.open(component.get("v.url"), "", "height=700,width=1700");
    }
})