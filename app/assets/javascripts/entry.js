(function(w, d) {

  function fetch_entry_for_date($scroll) {
    $('body').on("click",$scroll,function(){
      var $this= $(this),
          ajax_url = '/ajax/'+$this.attr("data-fetch"),
          entry_search_date = $this.attr("data-date"),
          id=$this.attr("data-id"),
          left_image=$('.carouseller-left').attr('src'),
          right_image=$('.carouseller-right').attr('src'),
          entry_data='',
          content='',
          current_date,format_date,entry_title,entry_url;
      var days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];

      if(entry_search_date){
        $.ajax({
          url: ajax_url,
          type: 'get',
          data: {date: entry_search_date},
          }).done(function(data) {
            if(data.entry.length){
              $.each(data.entry,function(key,value){
                entry_title= get_title(value.title);
                current_date=new Date(value.date);
                current_date=current_date.getDay();
                format_date=parse_date(value.date);
                entry_url="/"+value.id+"-"+entry_title;
                entry_data+='<div class="car-3 carouseller-border">'
                                +'<a href="'+entry_url+'">'
                                  +'<h6 class="carouseller-content">'+days[current_date]+'</h6>'
                                  +'<h6 class="carouseller-time">'+format_date+'</h6>'
                                +'</a>'
                              +'</div>';
              });
              content='<a href="javascript:void(0)">'
                          +'<img src="'+left_image+'" class="carouseller-left scroll hidden-xs" data-fetch="fetch_previous_week_entry" data-date="'+data.previous_date+'"/>'
                          +'<img src="'+left_image+'" class="carouseller-left scroll visible-xs" data-fetch="fetch_yesterday_entry" data-id="'+data.previous_date+'"/>'
                        +'</a>'
                        +'<div class="carouseller-wrap">'
                          +'<div class="carouseller-list">'
                            +entry_data
                          +'</div>'
                        +'</div>'
                        +'<a href="javascript:void(0)">'
                          +'<img src="'+right_image+'" class="carouseller-right scroll hidden-xs" data-fetch="fetch_next_week_entry" data-date="'+data.next_date+'"/>'
                          +'<img src="'+right_image+'" class="carouseller-right scroll visible-xs" data-fetch="fetch_next_week_entry" data-id="'+data.next_date+'"/>'
                        +'</a>';
              $('#first').html(content);
              if(data.entry.length < 5){
                $this.hide();
              }
            }else{
              $this.hide();
            }
          }).fail(function(data) {
            console.error('Error getting '+ajax_url+': ')
          });
      }else{
        $.ajax({
          url: ajax_url,
          type: 'get',
          data: {id: id},
          }).done(function(data) {
            if(data.entry){
                entry_title= get_title(data.entry.title);
                current_date=new Date(data.entry.date);
                current_date=current_date.getDay();
                format_date=parse_date(data.entry.date);
                entry_url="/"+data.entry.id+"-"+entry_title;
                entry_data+='<div class="car-3 carouseller-border">'
                                +'<a href="'+entry_url+'">'
                                  +'<h6 class="carouseller-content">'+days[current_date]+'</h6>'
                                  +'<h6 class="carouseller-time">'+format_date+'</h6>'
                                +'</a>'
                              +'</div>';

              content='<a href="javascript:void(0)">'
                        +'<img src="'+left_image+'" class="carouseller-left scroll hidden-xs" data-fetch="fetch_previous_week_entry" data-date=""/>'
                        + '<img src="'+left_image+'" class="carouseller-left scroll visible-xs" data-fetch="fetch_yesterday_entry" data-id="'+data.entry.id+'"/>'
                        +'</a>'
                        +'<div class="carouseller-wrap">'
                          +'<div class="carouseller-list">'
                            +entry_data
                          +'</div>'
                        +'</div>'
                        +'<a href="javascript:void(0)">'
                          +'<img src="'+right_image+'" class="carouseller-right scroll hidden-xs" data-fetch="fetch_next_week_entry" data-date=""/>'
                          +'<img src="'+right_image+'" class="carouseller-right scroll visible-xs" data-fetch="fetch_tomorrow_entry" data-id="'+data.entry.id+'"/>'
                        +'</a>';
              $('#first').html(content);
            }else{
              $this.hide();
            }
          }).fail(function(data) {
            console.error('Error getting '+ajax_url+': ')
          });
      }
    });

  }

  $(document).ready(function(){
    fetch_entry_for_date('.scroll');
  })

  function get_title(title){
    if (title){
      return title.toLowerCase().replace(/ /g,'-').replace(/[-]+/g, '-').replace(/[^\w-]+/g,'');
    }else{
      return title;
    }
    
  }

  function parse_date(input) {
    var parts = input.split('-');
    // new Date(year, month [, day [, hours[, minutes[, seconds[, ms]]]]])
    return  parts[1]+'.'+ parts[2]; // Note: months are 0-based
  }

})(window, document)