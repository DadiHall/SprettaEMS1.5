$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  var target = $(e.target).attr("href") // activated tab
  if ($(target).is(':empty')) {
    $.ajax({
      type: "GET",
      url: "/article/",
      error: function(data){
        alert("There was a problem");
      },
      success: function(data){
        $(target).html(data);
      }
  })
 }
})