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

    vm.email = 'krakan@katt.nu'
    vm.password = 'hemligt'

    console.log(vm)

    vm.login = function() {
      var url = 'http://' + vm.email + ':' + vm.password + '@' + C.basicURL
      console.log(url)
      var config = {
        headers: {
            "X-APIkey" : C.apiKey,
            "Accept" : "application/json"
        }
      }

      var promise = $http.post(url, null, config)

      promise
        .success(function(data, status, headers, config) {
          // Just check what we get back
          console.log(data)
          console.log(status)
          console.log(config)

          // if we succeeded we got a token - can be used to autenticate us
          window.sessionStorage['token'] = data.auth_token
          window.sessionStorage['isLoggedIn'] = true
        })
        .error(function(data, status, headers, config) {
        console.log(data)
        console.log(status)
        console.log(config)
        window.sessionStorage['token'] = ''
        window.sessionStorage['isLoggedIn'] = false
      })
    }
  })
