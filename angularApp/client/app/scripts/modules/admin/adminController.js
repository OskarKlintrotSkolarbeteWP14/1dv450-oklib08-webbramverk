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
    vm.edit = $routeParams.edit || false

    if (vm.edit) {
      Resources.getNewOps({opsID: vm.edit}).then(function(data){
        vm.op = data
        vm.tags = []
        vm.op.tags.forEach(function(item, index, array) {
          vm.tags.push(item.tag)
        })
      })
    }

    function setTableParams(){
      vm.tableParams = OpsTable({currentUser: userID, force: true})
    }

    setTableParams()
  })
