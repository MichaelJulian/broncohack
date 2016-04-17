
var emojis=[":nail_care:",":dancer:",":fork_knife_plate:",":cocktail:",":beer:",":wine_glass:",":icecream:",":pizza:",":sushi:",":soccer:",":basketball:",":football:",":baseball:",":tennis:",":volleyball:",":golf:",":ping_pong:",":badminton:",":skier:",":snowboarder:",":swimmer:",":surfer:",":fishing_pole_and_fish:",":lifter:",":mountain_bicyclist:",":tickets:",":art:",":microphone:",":guitar:",":video_game:",":bowling:",":musical_keyboard:",":sunrise:",":beach:",":roller_coaster:",":projector:",":telescope:",":microscope:",":ballot_box:",":star_and_crescent:",":wheel_of_dharma:",":cross:",":star_of_david:",":orthodox_cross:"];

function showIcons(array){
  for(var i=0; i<array.length; i++){
    var input=array[i];
    var output = emojione.shortnameToImage(input);
    var index = output.indexOf("//");
    output = output.slice(0,index) + "http:" + output.slice(index);
    output = output.slice(0, output.length-2) + ' id = "' + input + '"' + output.slice(output.length-2);
    var li = document.createElement("li");
    li.innerHTML = output;
    document.getElementById('icons').appendChild(li);
  }
}

window.onload = showIcons(emojis);

var count=0;

$('img').click(function(){
  if ($(this).hasClass('selected')){
    $(this).toggleClass('selected');
    count--;
  }
  else if(count<5){
    $(this).toggleClass('selected');
    count++;
  }
});