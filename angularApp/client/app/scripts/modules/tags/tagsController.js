'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:TagsController
 * @description
 * # TagsController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('TagsController', function (
    OpsTable
  ) {
    var vm = this
    
    function setTableParams(options){
      vm.tableParams = OpsTable(options)
    }

    // vm.filter = function() {
    //   setTableParams({query: vm.query})
    // }
    //
    // vm.clear = function() {
    //   setTableParams({force: true})
    // }

    setTableParams()
  })
