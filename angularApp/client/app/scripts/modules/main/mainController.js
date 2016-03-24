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
    Resources
  ) {
    uiGmapGoogleMapApi.then(function(maps) {
      $scope.map = { center: { latitude: 63, longitude: 15 }, zoom: 4 }
    })

    $scope.markers = []
    //
    // function getPositionsForOps(ops) {
    //   return $q(function(resolve){
    //     var promises = []
    //     ops.forEach(function(op, index, array){
    //       promises.push(op.one('positions').get())
    //         if (promises.length === array.length) {
    //           resolve({
    //             ops: ops,
    //             promises: promises
    //           })
    //         }
    //     })
    //   })
    // }
    //
    // function resolvePromisesForPositions(data) {
    //   return $q(function(resolve){
    //     $q.all(data.promises)
    //       .then(function(positions){
    //         resolve ({
    //           ops: data.ops,
    //           positions: _.uniqBy(positions, 'position.id')
    //         })
    //       })
    //   })
    // }
    //
    // function mergeOpsWithPosition(data) {
    //   var ops = []
    //   data.ops.forEach(function(op){
    //     data.positions.forEach(function(pos){
    //       if(pos.position.id === op.position.id){
    //         ops.push(
    //           _.assign(
    //             {}, op, {
    //               position: _.assign({}, op.position, pos.position)
    //             }
    //           )
    //         )
    //       }
    //     })
    //   })
    //   return ops
    // }
    //
    function createMarkers(data) {
      $scope.markers = data.map(function(marker){
        // var tags = marker.tags.map(function(tag){
        //   return {
        //     tag: tag
        //   }
        // })
        // console.log(typeof marker.tags)
        return ({
          id: marker.id,
          latitude: marker.position.lat,
          longitude: marker.position.lng,
          info: {
            title: marker.item,
            description: marker.note,
            place: marker.position.place,
            tags: marker.tags
            // tags: JSON.stringify(marker.tags)
          },
          template: "views/partials/main/gmapWindow.html"
        })
      })
    }
    //
    // var promise = Restangular
    //   .all('ops')
    //   .getList()
    //   .then(function(ops){
    //     return getPositionsForOps(ops)
    //   })
    //   .then(function(data){
    //     return resolvePromisesForPositions(data)
    //   })
    //   .then(function(data){
    //     return mergeOpsWithPosition(data)
    //   })
    //   .then(function(data){
    //     $rootScope.data = data
    //     createMarkers(data)
    //   })
    if(Resources.getCurrentData()){
      console.log('Using filtered data')
      createMarkers(Resources.getCurrentData())
    } else {
      console.log('Using all data')
      Resources.getNewData().then(function(data){
        createMarkers(data)
      })
    }

    // var promise = $q(function(resolve){
    //   var markers = []
    //   Restangular.all('ops').getList().then(function(ops){
    //     ops.forEach(function(op, index, array){
    //       op.one('positions').get().then(function(pos){
    //         markers.push(_.assign({}, op, pos))
    //         if (markers.length === array.length) {
    //           resolve(markers)
    //         }
    //       })
    //     })
    //   })
    // })
    // .then(function(data){
    //   console.log(data)
    // })

  })
