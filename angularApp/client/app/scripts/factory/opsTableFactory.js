angular.module(C.appName).factory('OpsTable', function(
  Resources,
  NgTableParams
){
  return function(options) {
    // var options = options || {},
    //   query = options.query || null,
    //   force = options.force || null,
    //   url = options.url || 'ops'

    return new NgTableParams({}, {
      getData: function(params) {
        return Resources.getNewOps(options).then(function(data) {
          return data
        })
      }
    })
  }
})
