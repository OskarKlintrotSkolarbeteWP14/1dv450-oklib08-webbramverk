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
    OpsTable,
    $routeParams,
    $location
  ) {
    var vm = this

    console.log('$location.search():')
    console.log($location.search().id)
    console.log('$routeParams:')
    console.log($routeParams.id)

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
