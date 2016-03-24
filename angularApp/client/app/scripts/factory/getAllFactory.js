angular.module(C.appName).factory('GetAll', function($q, Restangular){
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

  function getAll(resolve) {
    if(!this.data){
      console.log('Fetching new data')
      var promise = Restangular
        .all('ops')
        .getList()
        .then(function(ops){
          return getPositionsForOps(ops)
        })
        .then(function(data){
          return resolvePromisesForPositions(data)
        })
        .then(function(data){
          return mergeOpsWithPosition(data)
        })
        .then(function(data){
          this.data = data
          resolve(data)
        })
    } else {
      console.log('Cached data')
      resolve(this.data)
    }
  }

  return function() {
    return $q(function(resolve){
      getAll(resolve)
    })
  }
})
