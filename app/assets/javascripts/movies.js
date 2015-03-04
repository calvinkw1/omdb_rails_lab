$(document).ready(function() {

$("form").submit(function(e){
  e.preventDefault();
  var query = $("#q").val();
  var url = "http://localhost:3000/search.json";
  $.getJSON(url, {q:query}, function(data) {
    // loop over the data array of objects
    for (i = 0; i < data.length; i++) {
      console.log(data[i]);
    // append to the page the Title
    $("ul").append("<li>" + data[i].Title + "</li>");
    }
  $("#q").val("");
  });
});

  
});


