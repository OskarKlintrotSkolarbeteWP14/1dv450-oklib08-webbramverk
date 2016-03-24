'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:SearchController
 * @description
 * # SearchController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('SearchController', function (
    $scope,
    $rootScope,
    Resources,
    NgTableParams
  ) {
    var vm = this

    vm.filter = function() {
      vm.tableParams = new NgTableParams({}, {
        getData: function(params) {
          return Resources.getNewData(vm.query).then(function(data) {
            // console.log(data)
            // params.total(data)
            return data
          })
        }
      })
    }

    vm.tableParams = new NgTableParams({}, {
      getData: function(params) {
        return Resources.getNewData().then(function(data) {
          // console.log(data)
          // params.total(data)
          return data
        })
      }
    })
  })
