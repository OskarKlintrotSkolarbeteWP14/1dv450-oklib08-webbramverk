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

    function setTableParams(options) {
      var options = options || { query: null, force: null },
        query = options.query || null,
        force = options.force || null

      vm.tableParams = new NgTableParams({}, {
        getData: function(params) {
          return Resources.getNewData(query, force).then(function(data) {
            return data
          })
        }
      })
    }

    vm.filter = function() {
      setTableParams({query: vm.query})
    }

    vm.clear = function() {
      setTableParams({force: true})
    }

    setTableParams()
  })
