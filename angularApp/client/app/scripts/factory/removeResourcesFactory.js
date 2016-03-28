'use strict'

angular.module(C.appName).factory('RemoveResources', function(
  $q,
  Restangular,
  LoggedIn
){
  var self = this

  function remove(resolve, obj) {
    if (obj.positionID) {
      var removeOp = Restangular
        .one('ops', obj.opID)
        .customDELETE(null, {}, {
          Authorization: LoggedIn.getToken()
        })
      var removePos = Restangular
        .one('positions', obj.positionID)
        .customDELETE(null, {}, {
          Authorization: LoggedIn.getToken()
        })
      $q.all([removeOp, removePos])
        .then(function(data) {
          resolve(true)
        })
    } else {
      Restangular
        .one('ops', obj.opID)
        .get()
        .then(function(data) {
          console.log(data)
          obj.positionID = data.op.position.id
          data.customDELETE(obj.opID, {}, {
            Authorization: LoggedIn.getToken()
          })
          .then(function(data) {
            Restangular
              .one('positions', obj.positionID)
              .customDELETE(null, {}, {
                Authorization: LoggedIn.getToken()
              })
              .then(function(data) {
                resolve(true)
              })
              .error(function(data) {
                resolve(true) // Not so pretty, but an error here is most likely due to that the position where not created by the user.
              })
          })
        })
    }
  }

  return {
    remove: function(obj) {
      return $q(function(resolve){
        remove(resolve, obj)
      })
    }
  }
})
