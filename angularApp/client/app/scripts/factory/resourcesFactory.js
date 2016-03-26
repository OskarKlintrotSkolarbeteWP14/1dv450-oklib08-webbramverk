angular.module(C.appName).factory('Resources', function(
  PositionsResources
){
  return {
    getCurrentData: function() {
      return PositionsResources.getCurrentData()
    },
    getNewData: function(query, force) {
      return PositionsResources.getNewData(query, force)
    }
  }
})
