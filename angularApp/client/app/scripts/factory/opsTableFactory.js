angular.module(C.appName).factory('OpsTable', function(
  Resources,
  NgTableParams
){
  return function(options) {
    var options = options || { query: null, force: null },
      query = options.query || null,
      force = options.force || null

    return new NgTableParams({}, {
      getData: function(params) {
        return Resources.getNewOps(query, force).then(function(data) {
          return data
        })
      }
    })
  }
})
