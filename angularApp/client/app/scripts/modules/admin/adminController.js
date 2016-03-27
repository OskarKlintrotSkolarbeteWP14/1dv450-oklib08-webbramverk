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
        vm.position = data.position
        vm.tags = []
        vm.op.tags.forEach(function(item, index, array) {
          vm.tags.push(item.tag)
        })
      })
    }

    // Example for an object to update an ops
    var exempleOps = {
      position_id: 1,
      item: 'Vinfölje',
      note: 'Blir nog ett bra kort i solnedgång',
      tags: ['Badring', 'Skog']
    }
    // Example for updating a position
    var examplePos = {
      lng: 57.002750,
      lat: 14.573293,
      place: 'Hjortsberga',
      region: 'Kronobergs Län',
      country: 'Sweden'
    }

    function setTableParams(){
      vm.tableParams = OpsTable({currentUser: userID, force: true})
    }

    setTableParams()
  })
