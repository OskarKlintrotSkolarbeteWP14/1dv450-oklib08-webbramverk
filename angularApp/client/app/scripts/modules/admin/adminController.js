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
    Resources,
    $window
  ) {
    var vm = this
    var userID = LoggedIn.getUserID()

    vm.loggedIn = LoggedIn.isLoggedIn()
    vm.username = LoggedIn.getUsername()
    vm.edit = $routeParams.edit || false

    if (vm.edit) {
      getOneOp()
    }

    vm.update = function() {
      Resources.save({
        op: {
          id: vm.op.id,
          position_id: vm.op.position.id,
          item: vm.op.item,
          note: vm.op.note,
          tags: typeof vm.tags === String ? vm.tags.split(',') : vm.tags
        },
        position: {
          id: vm.position.id,
          lat: vm.position.lat,
          lng: vm.position.lng,
          place: vm.position.place,
          region: vm.position.region,
          country: vm.position.country
        }
      })
        .then(function(data) {
          $window.location = '/admin'
        })
    }

    vm.delete = function() {
      console.log('Delete!');
    }

    vm.reset = function() {
      getOneOp()
    }

    vm.cancel = function() {
      $window.location = '/admin'
    }

    setTableParams()

    function setTableParams(){
      vm.tableParams = OpsTable({currentUser: userID, force: true})
    }

    function getOneOp() {
      vm.op = null
      vm.tags = null
      vm.position = null

      Resources.getNewOps({opsID: vm.edit}).then(function(data){
        vm.op = data
        vm.position = data.position
        vm.tags = []
        vm.op.tags.forEach(function(item, index, array) {
          vm.tags.push(item.tag)
        })
      })
    }

  })
