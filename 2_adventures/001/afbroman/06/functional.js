// See Jafar Husein’s learning tool at https://jhusain.github.io/learnrx/

Array.prototype.map = function(projectionFunction) {
  var results = [];
  this.forEach(itemInArray => results.push(projectionFunction(itemInArray)) );
  return results;
};

Array.prototype.filter = function(predicateFunction) {
  var results = [];
  this.forEach(itemInArray => {
    if(predicateFunction(itemInArray)) {
       results.push(itemInArray);
    }
  });

  return results;
};

Array.prototype.concatAll = function() {
  var results = [];
  this.forEach( subArray => {
    subArray.forEach(elt => results.push(elt));
  });

  return results;
};
