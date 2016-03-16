'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('MainController', function ($scope, uiGmapGoogleMapApi) {
    uiGmapGoogleMapApi.then(function(maps) {
      $scope.map = { center: { latitude: 63, longitude: 15 }, zoom: 4 }
    })
  })
