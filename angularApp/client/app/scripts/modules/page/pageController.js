'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:PageController
 * @description
 * # PageController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('PageController', function ($scope, $rootScope, LoggedIn) {
    $scope.LoggedIn = LoggedIn
    LoggedIn.setLoggedInFromSession()

    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        $rootScope.title = current.title
    })
  })
