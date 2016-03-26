angular.module(C.appName).factory('Resources', function(
  PositionsResources
){
  return {
    getCurrentOps: function() {
      return PositionsResources.getCurrentData()
    },
    getNewOps: function(query, force) {
      return PositionsResources.getNewData(query, force)
    }
  }
})
