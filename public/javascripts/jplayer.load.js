$(document).ready(function(){
    var players = $(".jp-jplayer")
    for (var i = 0; i < players.length; i++) {
      var player = players[i];
      var inte = i+1;
      $("#jquery_jplayer_"+inte).jPlayer({
        ready: function () {
          $(this).jPlayer("setMedia", {
            wav: "/sound/"+$(this).attr("location")
          });
        },
        swfPath: "/public/javascripts",
        supplied: "wav",
        cssSelectorAncestor: "#jp_interface_"+inte
        
      });
    }
});
