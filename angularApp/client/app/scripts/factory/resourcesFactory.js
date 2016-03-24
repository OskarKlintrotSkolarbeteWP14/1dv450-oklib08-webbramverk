angular.module(C.appName).factory('Resources', function($q, Restangular){
  var self = this // Lovely old school ES5 hack!

  function getPositionsForOps(ops) {
    return $q(function(resolve){
      var promises = []
      ops.forEach(function(op, index, array){
        promises.push(op.one('positions').get())
        if (promises.length === array.length) {
          resolve({
            ops: ops,
            promises: promises
          })
        }
      })
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

  function getAll(resolve, query) {
    if(!self.data || query){
      console.log('Fetching new data')
      var promise = Restangular
        .all('ops')
        .getList({search: query})
        .then(function(data){
          return getPositionsForOps(data)
        })
        .then(function(data){
          return resolvePromisesForPositions(data)
        })
        .then(function(data){
          return mergeOpsWithPosition(data)
        })
        .then(function(data){
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
    getNewData: function(query) {
      return $q(function(resolve){
        getAll(resolve, query)
      })
    }
  }
})
