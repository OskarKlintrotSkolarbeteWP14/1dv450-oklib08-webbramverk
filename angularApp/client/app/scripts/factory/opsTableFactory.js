angular.module(C.appName).factory('OpsTable', function(
  Resources,
  NgTableParams
){
  return function(options) {
    return new NgTableParams({}, {
      getData: function(params) {
        return Resources.getNewOps(options).then(function(data) {
          return data
        })
      }
    })
  }
})
