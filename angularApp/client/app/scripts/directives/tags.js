'use strict'

/**
 * @ngdoc function
 * @name clientApp.directive:TagsDirective
 * @description
 * # TagsDirective
 * Custom directive for showing the tags of a marker
 */
angular.module(C.appName)
  .directive('tags', function () {
    return {
      restrict: 'E',
      scope: {
        marker: '='
      },
      // link: function($scope, element, attrs) {
      //   $scope.marker = JSON.parse($scope.marker)
      //   attrs.marker = JSON.parse(attrs.marker)
      //   console.log($scope.marker, attrs.marker)
      //   $scope.marker.forEach(function(item){
      //     console.log(item)
      //   })
      // },
      templateUrl: 'scripts/directives/templates/tags.html'
    }
  })
