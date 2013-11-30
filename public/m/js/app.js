function load_news() {
  var loc = window.location;
  var url = 'http://'+loc.hostname+':'+loc.port+'/news/';

  $.ajax({
    url: 'http://'+loc.hostname+':'+loc.port+'/news.json',
    dataType: 'json',
    async: true,
    success: function(data)  {
      $(data).each(function(i,d) {
        var _new = '<h4><a href="#new'+d.id+'">'+d.title+'</a></h4>';
         $('#news').append(_new);
         add_new_page(d);
      });
    },
    error:   function(error) {console.log(error);}
  });
}

function add_new_page(_new) {
  var data = '<div data-role="page" id="new'+_new.id+'" data-theme="a">';

	   data += '<div data-role="header">';
     data += '<h4>'+_new.title+'</h4>';
     data += '</div>';

     data += '<div data-role="content" data-theme="a">'	
     data += '<p><a href="#one" data-direction="reverse" data-role="button" data-theme="b">Back</a></p>';
     data += _new.body;
     data += '</div>'
	
	   data += '<div data-role="footer">';
     data += '<small> Powered by Rails | authored by <a href="http://purbon.com">@purbon</a></small>';
	   data += '</div>';
     data += '</div>';

  $('body').append(data);
};

$(document).ready(function(e) {
  load_news();
});
