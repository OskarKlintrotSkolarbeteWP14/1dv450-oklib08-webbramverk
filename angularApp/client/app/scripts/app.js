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
    'uiGmapgoogle-maps',
    'restangular',
    'ngTable'
  ])
  .config(function ($routeProvider, $locationProvider, uiGmapGoogleMapApiProvider, RestangularProvider) {
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
      .when('/search', {
        title: 'Search',
        templateUrl: 'views/search.html',
        controller: 'SearchController',
        controllerAs: 'search'
      })
      .when('/tags', {
        title: 'Tags',
        templateUrl: 'views/tags.html',
        controller: 'TagsController',
        controllerAs: 'tags'
      })
      .when('/admin', {
        title: 'Admin',
        templateUrl: 'views/admin.html',
        controller: 'AdminController',
        controllerAs: 'admin'
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

    RestangularProvider.setBaseUrl(C.apiURL)
    RestangularProvider.setDefaultHeaders({ 'X-ApiKey': C.apiKey })
  });
