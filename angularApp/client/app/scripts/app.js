'use strict';

/**
 * @ngdoc overview
 * @name clientApp
 * @description
 * # clientApp
 *
 * Main module of the application.
 */
angular
  .module(C.appName, [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'uiGmapgoogle-maps'
  ])
  .config(function ($routeProvider, $locationProvider, uiGmapGoogleMapApiProvider) {
    $routeProvider
      .when('/', {
        title: 'Home',
        templateUrl: 'views/main.html',
        controller: 'MainController',
        controllerAs: 'main'
      })
      .when('/about', {
        title: 'About',
        templateUrl: 'views/about.html',
        controller: 'AboutController',
        controllerAs: 'about'
      })
      .when('/login', {
        title: 'Login',
        templateUrl: 'views/login.html',
        controller: 'LoginController',
        controllerAs: 'user'
      })
      .when('/logout', {
        template: ' ',
        controller: 'LogoutController'
      })
      .otherwise({
        redirectTo: '/'
      });

    $locationProvider
      .html5Mode(true);

    uiGmapGoogleMapApiProvider
      .configure({
          //    key: 'your api key',
          // v: '3.20', //defaults to latest 3.X anyhow
          // libraries: 'weather,geometry,visualization'
      })
  });
