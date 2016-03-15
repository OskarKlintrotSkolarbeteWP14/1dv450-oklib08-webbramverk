'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the clientApp
 */
angular.module('clientApp')
  .controller('LoginController', function ($http) {
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
        })
        .error(function(data, status, headers, config) {
        data.error ? console.error(data.error) : console.error(data)
        sessionStorage[C.USER_INFO] = false
      })
    }
  })
