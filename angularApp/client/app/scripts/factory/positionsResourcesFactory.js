'use strict'

angular.module(C.appName).factory('PositionsResources', function($q, Restangular){
  var self = this // Lovely old school ES5 hack!
  self.lastSearchByUser = false

  // Could be used to achive some simple caching
  // self.opsForCurrentUser = null
  // self.opsByTags = null
  // self.opsBySearch = null
  // self.allOps = null

  function getPositionsForOps(ops) {
    return $q(function(resolve){
      var promises = []
      if(ops.length){
        ops.forEach(function(op, index, array){
          promises.push(op.oneUrl('/', C.baseURL + op.position.url.slice(1)).get())
          if (promises.length === array.length) {
            resolve({
              ops: ops,
              promises: promises
            })
          }
        })
      } else {
        // console.log(ops);
        var op = ops.op
        promises.push(ops.oneUrl('/', C.baseURL + op.position.url.slice(1)).get())
        resolve({
          ops: ops,
          promises: promises
        })
      }
    })
  }

  function resolvePromisesForPositions(data) {
    return $q(function(resolve){
      $q.all(data.promises)
        .then(function(positions){
          resolve ({
            ops: data.ops,
            positions: _.uniqBy(positions, 'position.id')
          })
        })
    })
  }

  function mergeOpsWithPosition(data) {
    var ops = []
    data.ops.forEach(function(op){
      data.positions.forEach(function(pos){
        if(pos.position.id === op.position.id){
          ops.push(
            _.assign(
              {}, op, {
                position: _.assign({}, op.position, pos.position)
              }
            )
          )
        }
      })
    })
    return ops
  }

  function mergeOpWithPosition(data) {
    return _.assign(
      {}, data.ops.op, {
        position: _.assign({}, data.ops.op.position, data.positions[0].position)
      }
    )
  }

  function getAll(resolve, currentUser, opsID, url, query, force) {
    // console.log(self.lastSearchByUser)
    // console.log(currentUser)
    // console.log(self.lastSearchByUser && !currentUser)
    if(!self.data || opsID || query || force || self.lastSearchByUser && !currentUser){
      console.log('Fetching new data')
      var promise = Restangular
      if(opsID){
        promise = promise.one(url, opsID)
          .get()
      } else {
        promise = promise.all(url)
        .getList({search: query})
      }
        promise.then(function(data){
          return getPositionsForOps(data)
        })
        .then(function(data){
          return resolvePromisesForPositions(data)
        })
        .then(function(data){
          if (opsID) {
            return mergeOpWithPosition(data)
          } else {
            return mergeOpsWithPosition(data)
          }
        })
        .then(function(data){
          if(currentUser) {
            self.lastSearchByUser = true
            // self.opsForCurrentUser = data
          } else {
            self.lastSearchByUser = false
          }
          self.data = data
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
    getNewData: function(options) {
      var options = options || {},
        query = options.query || null,
        force = options.force || null,
        opsID = options.opsID || null,
        url = options.url || 'ops',
        currentUser = options.currentUser || null
        if(currentUser){
          url = 'users/' + currentUser + '/ops'
        }

      return $q(function(resolve){
        getAll(resolve, currentUser, opsID, url, query, force)
      })
    }
  }
})
