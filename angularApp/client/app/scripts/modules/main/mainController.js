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
    $q,
    uiGmapGoogleMapApi,
    Restangular
  ) {
    uiGmapGoogleMapApi.then(function(maps) {
      $scope.map = { center: { latitude: 63, longitude: 15 }, zoom: 4 }
    })

    function getPositionsForOps(ops) {
      return $q(function(resolve){
        var promises = []
        ops.forEach(function(op, index, array){
          promises.push(op.one('positions').get())
            if (promises.length === array.length) {
              resolve(promises)
            }
        })
      })
    }

    function mergePositionToOps(arrayOfPromises) {
      return $q.all(arrayOfPromises)
    }

    var promise = Restangular
      .all('ops')
      .getList()
      .then(function(ops){
        return getPositionsForOps(ops)
      })
      .then(function(arrayOfPromises){
        return mergePositionToOps(arrayOfPromises)
      })
      .then(function(data){
        console.log(data)
      })

    // var promise = $q(function(resolve){
    //   var markers = []
    //   Restangular.all('ops').getList().then(function(ops){
    //     ops.forEach(function(op, index, array){
    //       op.one('positions').get().then(function(pos){
    //         op.position = pos
    //         markers.push(op.position)
    //         if (markers.length === array.length) {
    //           resolve(markers)
    //         }
    //       })
    //     })
    //   })
    // })
    //
    // promise.then(function(data){
    //   console.log(data)
    // })

  })
