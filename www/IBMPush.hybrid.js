var cordova = require('cordova'),
    exec = require('cordova/exec');

var IBMPush = {
		initializeService : function(successCallback, failureCallback) {
	    	 exec(successCallback, failureCallback, "IBMPush", "initializeService", []);
	    },
		registerDevice : function(consumerId,alias, callbackMethod, successCallback, failureCallback) {
	    	 exec(successCallback, failureCallback, "IBMPush", "registerDevice", [consumerId,alias, callbackMethod]);	    	 
	    },
	    subscribeTag : function(tagname, successCallback, failureCallback) {
	    	 exec(successCallback, failureCallback, "IBMPush", "subscribeTag", [tagname]);	    	 
	    },
	    unsubscribeTag : function(tagname, successCallback, failureCallback) {
	    	 exec(successCallback, failureCallback, "IBMPush", "unsubscribeTag", [tagname]);	    	 
	    },
	    getTags : function(successCallback, failureCallback) {
	    	 exec(successCallback, failureCallback, "IBMPush", "getTags", []);	    	 
	    },
	    getSubscriptions : function(successCallback, failureCallback) {
	    	 exec(successCallback, failureCallback, "IBMPush", "getSubscriptions", []);	    	 
	    }   
	    
};
module.exports = IBMPush;