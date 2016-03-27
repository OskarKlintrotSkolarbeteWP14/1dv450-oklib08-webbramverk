'use strict'

/**
 * @ngdoc function
 * @name clientApp.controller:AdminController
 * @description
 * # AdminController
 * Controller of the clientApp
 */
angular.module(C.appName)
  .controller('AdminController', function (
    LoggedIn,
    OpsTable,
    $routeParams,
    Resources
  ) {
    var vm = this
    var userID = LoggedIn.getUserID()

    vm.loggedIn = LoggedIn.isLoggedIn()
    vm.username = LoggedIn.getUsername()

    function setTableParams(){
      vm.tableParams = OpsTable({currentUser: userID, force: true})
    }

    setTableParams()
  })
