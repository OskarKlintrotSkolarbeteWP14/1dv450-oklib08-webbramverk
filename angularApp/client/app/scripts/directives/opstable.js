'use strict'

/**
 * @ngdoc function
 * @name clientApp.directive:OpsTableDirective
 * @description
 * # OpsTableDirective
 * Custom directive for showing the ops as a table
 */
angular.module(C.appName)
  .directive('opstable', function () {
    return {
      restrict: 'E',
      scope: {
        ops: '=',
        remove: '=',
        editable: '='
      },
      templateUrl: 'scripts/directives/templates/ops.html'
    }
  })
