'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:LogoutController
 * @description
 * # LogoutController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('LogoutController', function ($window, $rootScope) {
    sessionStorage.removeItem(C.USER_INFO)
    // $rootScope.isLoggedIn = false
    $rootScope.isLoggedIn = function isLoggedIn() {
      return JSON.parse(sessionStorage[C.USER_INFO]).isLoggedIn || false
    }
    $window.location = '/'
  })
