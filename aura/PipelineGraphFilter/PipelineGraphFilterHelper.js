({
    
    getUsers : function(component) {
        var action = component.get("c.getUsersList");
        action.setCallback(this, function(response) {
            component.set("v.users", response.getReturnValue());
        });
        $A.enqueueAction(action);
    }
    
})