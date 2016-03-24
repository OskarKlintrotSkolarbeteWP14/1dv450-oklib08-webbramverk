'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:AllController
 * @description
 * # AllController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('AllController', function ($scope, $rootScope, GetAll) {
    var vm = this
    GetAll().then(function(data){
      console.log(data)
    })
  })
