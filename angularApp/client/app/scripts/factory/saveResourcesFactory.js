'use strict'

angular.module(C.appName).factory('SaveResources', function(
  $q,
  Restangular,
  LoggedIn
  ){
  var self = this

  function save(resolve, obj) {
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
  }

  return {
    save: function(obj) {
      return $q(function(resolve){
        save(resolve, obj)
      })
    }
  }
})
