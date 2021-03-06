'use strict'

angular.module(C.appName).factory('Resources', function(
  PositionsResources,
  TagsResources,
  SaveResources,
  RemoveResources
){
  return {
    getCurrentOps: function() {
      return PositionsResources.getCurrentData()
    },
    getNewOps: function(options) {
      return PositionsResources.getNewData(options)
    },
    getAllTags: function() {
      return TagsResources.getNewData()
    },
    save: function(op) {
      return SaveResources.save(op)
    },
    remove: function(op) {
      return RemoveResources.remove(op)
    }
  }
})
