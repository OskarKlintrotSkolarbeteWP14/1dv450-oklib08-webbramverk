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

    function createMarkers(data) {
      $scope.markers = data.map(function(marker){
        return ({
          id: marker.id,
          latitude: marker.position.lat,
          longitude: marker.position.lng,
          info: {
            title: marker.item,
            description: marker.note,
            place: marker.position.place,
            tags: marker.tags
          },
          template: "views/partials/main/gmapWindow.html"
        })
      })
    }

    if(Resources.getCurrentOps()){
      console.log('Using filtered data')
      createMarkers(Resources.getCurrentOps())
    } else {
      console.log('Using all data')
      Resources.getNewOps('ops').then(function(data){
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
