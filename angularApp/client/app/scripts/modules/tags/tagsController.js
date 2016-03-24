'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:TagsController
 * @description
 * # TagsController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('TagsController', function ($http, $window, LoggedIn) {
    var vm = this

    // I'm lazy...
    vm.email = 'krakan@katt.nu'
    vm.password = 'hemligt'

    vm.login = function() {
      var url = C.apiURL + 'auth'
      var basicAuth = btoa(encodeURI(vm.email + ':' + vm.password))
      var config = {
        headers: {
            "X-ApiKey" : C.apiKey,
            "Accept" : "application/json",
            "Authorization" : "Basic " + basicAuth
        }
      }

      var promise = $http.post(url, null, config)

      promise
        .success(function(data, status, headers, config) {
          var user = {
            username: vm.email,
            token: data.auth_token,
            isLoggedIn: true
          }
          sessionStorage[C.USER_INFO] = JSON.stringify(user)
          // LoggedIn.setLoggedInFromSession() // Redundant since this
                                               // is also checked in
                                               // the PageController
          $window.location = '/'
        })
        .error(function(data, status, headers, config) {
        data.error ? console.error(data.error) : console.error(data)
        sessionStorage.removeItem(C.USER_INFO)
        // LoggedIn.setLoggedInFromSession() // Redundant since this
                                             // is also checked in
                                             // the PageController
      })
    }
  })
