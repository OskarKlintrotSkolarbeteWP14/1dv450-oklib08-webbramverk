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
    OpsTable
  ) {
    var vm = this

    function setTableParams(options){
      vm.tableParams = OpsTable(options)
    }

    vm.filter = function() {
      setTableParams({query: vm.query})
    }

    vm.clear = function() {
      setTableParams({force: true})
    }

    setTableParams()
  })
