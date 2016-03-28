'use strict'

/**
 * @ngdoc function
 * @name clientApp.directive:TagsDirective
 * @description
 * # TagsDirective
 * Custom directive for showing the tags of a marker
 */
angular.module(C.appName)
  .directive('formforop', function () {
    return {
      restrict: 'E',
      scope: {
        model: '='
      },
      templateUrl: 'scripts/directives/templates/formForOp.html'
    }
  })
