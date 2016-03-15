'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the clientApp
 */
angular.module('clientApp')
  .controller('LogoutController', function ($window, $rootScope) {
    sessionStorage.removeItem(C.USER_INFO)
    // $rootScope.isLoggedIn = false
    $rootScope.isLoggedIn = function isLoggedIn() {
      return JSON.parse(sessionStorage[C.USER_INFO]).isLoggedIn || false
    }
    $window.location = '/'
  })
