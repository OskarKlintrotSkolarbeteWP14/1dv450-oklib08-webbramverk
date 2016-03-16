'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:MainController
 * @description
 * # MainController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('MainController', function (
    $scope,
    uiGmapGoogleMapApi,
    Restangular
  ) {
    uiGmapGoogleMapApi.then(function(maps) {
      $scope.map = { center: { latitude: 63, longitude: 15 }, zoom: 4 }
    })

    Restangular.all('ops').getList().then(function(data) {
      data.forEach(function(item){
        console.log(item)
      })
    })
  })
