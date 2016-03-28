'use strict'

angular.module(C.appName).factory('SaveResources', function(
  $q,
  Restangular,
  LoggedIn
){
  var self = this

  function save(resolve, obj) {
    if (obj.op.id) {
      var ops = Restangular
        .one('ops')
        .customPUT(null, obj.op.id, obj.op, {
          Authorization: LoggedIn.getToken()
        })
      var pos = Restangular
        .one('positions')
        .customPUT(null, obj.position.id, obj.position, {
          Authorization: LoggedIn.getToken()
        })
      $q.all([ops, pos])
        .then(function(data) {
          resolve(true)
        })
    } else {
      Restangular
        .one('positions')
        .customPOST(null, null, obj.position, {
          Authorization: LoggedIn.getToken()
        })
        .then(function(data) {
          obj.op.position_id = data.position.id
          Restangular
            .one('ops')
            .customPOST(null, null, obj.op, {
              Authorization: LoggedIn.getToken()
            })
            .then(function(data) {
              resolve(true)
            })
        })
    }
  }

  return {
    save: function(obj) {
      return $q(function(resolve){
        save(resolve, obj)
      })
    }
  }
})
