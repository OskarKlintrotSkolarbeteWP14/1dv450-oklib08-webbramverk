// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
//= require lib/angular.min
//= require lib/angular-resource.min
// = require lib/angular-route.min

angularApp = angular
  .module('angularApp', ['ngResource', 'ngRoute'])
  .config(['$routeProvider', '$locationProvider',
    function($routeProvider, $locationProvider) {
      $routeProvider.
        when('/', {
          templateUrl: 'ng/partials/index.html'
        }).
        when('/test', {
          templateUrl: 'ng/partials/partial1.html',
        }).
        otherwise({
          redirectTo: '/'
        });

      $locationProvider.html5Mode(true); // This removes the hash-bang and use the Session history management >= IE10
    }])
