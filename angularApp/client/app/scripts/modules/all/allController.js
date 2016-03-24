'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:AllController
 * @description
 * # AllController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('AllController', function (
    $scope,
    $rootScope,
    GetAll,
    NgTableParams
  ) {
    var vm = this
    // GetAll().then(function(data){
    //   // vm.tableParams = new NgTableParams({}, {
    //   //   dataset: data
    //   // })
    //   // console.log(data)
    // })

    vm.tableParams = new NgTableParams({}, {
      getData: function(params) {
        return GetAll().then(function(data) {
          // params.total(data)
          console.log(data)
          return data
        })
      }
    })
  })
