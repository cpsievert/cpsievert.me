var covers = [
  "key-summit.jpg", "corfu-town.jpg", "dubrovnik-cannon.jpg", "fuji.jpg", 
  "plotcon.png"
];
var coverImgs = covers.map(function(i) { return "url('img/" + i  + "')"; });

var cycle = function() {
  
  // take the last element and put it first
  var lastImg = coverImgs.pop();
  coverImgs = [lastImg].concat(coverImgs);
  
  $("#cover-photo").fadeOut(1000, function() {
    $("#cover-photo").css("background-image", coverImgs[0]);
    $("#cover-photo").fadeIn(2000);
  });
  
};


setInterval(cycle, 10000);

