({
	doInit : function(cmp, event, helper) {
        var iconName = cmp.get("v.iconName");
        if (iconName == '') {
            iconName = cmp.get("v.properName");
            iconName = iconName.replace(/\s/g,'-').toLowerCase()
        	cmp.set("v.iconName", iconName );
        }
        
        
        var prefix = cmp.get("v.prefix");
        if (prefix == '') {
            prefix = helper.iconMap(iconName);
        }
        cmp.set("v.prefix", prefix);  
	}
})