'use strict'

angular.module(C.appName).factory('TagsResources', function($q, Restangular){
  var self = this // Lovely old school ES5 hack!

  function getAll(resolve, force) {
    if(!self.data || force){
      console.log('Fetching new data')
      var promise = Restangular
        .all('tags')
        .getList()
        .then(function(data){
          resolve(data)
        })
    } else {
      console.log('Cached data')
      resolve(self.data)
    }
  }

  return {
    getCurrentData: function() {
      return self.data
    },
    getNewData: function(query, force) {
      return $q(function(resolve){
        getAll(resolve, query, force)
      })
    }
  }
})
