'use strict'

angular.module(C.appName).factory('LoggedIn', function(){
  var isLoggedIn = false

  return {
    isLoggedIn: function() { return isLoggedIn },
    // setLoggedIn: function(newLoggedIn) { isLoggedIn = newLoggedIn },
    setLoggedInFromSession: function() {
      try {
        if (JSON.parse(sessionStorage[C.USER_INFO]).isLoggedIn) {
          isLoggedIn = true
        } else {
          isLoggedIn = false
        }
      } catch (e) {
        isLoggedIn = false
      }
    },
    getUsername: function() {
      try {
        if (JSON.parse(sessionStorage[C.USER_INFO]).username) {
          return JSON.parse(sessionStorage[C.USER_INFO]).username
        } else {
          return null
        }
      } catch (e) {
        return null
      }
    },
    getUserID: function() {
      try {
        if (JSON.parse(sessionStorage[C.USER_INFO]).userID) {
          return JSON.parse(sessionStorage[C.USER_INFO]).userID
        } else {
          return null
        }
      } catch (e) {
        return null
      }
    }
  }
})
