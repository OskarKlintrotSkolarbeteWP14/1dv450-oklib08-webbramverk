'use strict';

/**
 * @ngdoc function
 * @name clientApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the clientApp
 */
angular.module('clientApp')
  .controller('MainController', function ($rootScope) {
    // A bit of an ugly hack...
    $rootScope.isLoggedIn = function isLoggedIn() {
      return JSON.parse(sessionStorage[C.USER_INFO]).isLoggedIn || false
    }
  });
