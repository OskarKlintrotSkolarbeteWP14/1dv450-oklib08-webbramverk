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
    Resources
  ) {
    var vm = this

    Resources.getAllTags().then(function(data){
      vm.tags = data
    })

    if ($routeParams.id) {
      setTableParams({url: 'tags/' + $routeParams.id + '/ops', force: true})
    } else {
      setTableParams({force: true})
    }

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
  })
