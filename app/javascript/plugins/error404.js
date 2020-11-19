$(document).ready(function(){
      var selectBg = Math.floor(Math.random()*5);

  $(".bg:eq("+selectBg+")").toggleClass("see");

  });

  $('.reload').click(function() {

    location.reload(true);

});

export {error404};
