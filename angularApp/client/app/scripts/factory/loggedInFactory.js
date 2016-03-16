angular.module(C.appName).factory('LoggedIn', function(){
  var isLoggedIn = false

  return {
    isLoggedIn: function() { return isLoggedIn },
    setLoggedIn: function(newLoggedIn) { isLoggedIn = newLoggedIn },
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
    }
  }
})
