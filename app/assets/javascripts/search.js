$(function() {
  $(".btn").button({
    classes: {
      "ui-button": "no-border",
      "ui-state-default": "no-background"
    }
  }).click(function(e) {
    e.preventDefault();
    var widg = $(this).closest(".item-wrapper");
    widg.toggleClass("collapseed expanded");
    if (widg.hasClass("collapseed")) {
      $("#search").val("");
    }
  });

  $('.icon').click(function() {
    $('.search').toggle();
  });
  
  $(".search-menu").on('click', function() {
   $("html, body").animate({scrollTop: $("#name").offset().top}, 2000);
    $(".searching").show();
  });


  $('.icon1').click(function() {
    $('.search1').toggle();
  });

  var search = instantsearch({
    appId: 'FPTWE3M1PT',
    apiKey: 'a5d1dedb5c69845e745f5190e850f126',
    indexName: 'jtj-entries-roughdraft',
    urlSync: true,
    searchFunction: function (helper) {
      if (helper.state.query === '') {
          document.querySelector('.hits').innerHTML = '';
          return;
      }

      helper.search();
    }
  });
    
  search.addWidget(
    instantsearch.widgets.searchBox({
        container: '.search',
        autofocus: false
    })
  );

  search.addWidget(
    instantsearch.widgets.searchBox({
        container: '.searching',
        autofocus: false
    })
  );
    
  var hitTemplate = "<a href='{{url}}'>"
                      +"<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12 ais-hits-search'>"
                        +"<div class='col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding'>{{scripture}}</div>"
                        +"<div class='col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding'>{{writer}}</div>"
                        +"<div class='col-lg-3 col-md-3 col-sm-3 hidden-xs search-ais'>{{title}}</div>"
                        +"<div class='col-lg-3 col-md-3 col-sm-3 col-xs-12 nopadding text-center'>{{date}}</div>"
                      +"</div>"
                    +"</a>";
    
  var noResultsTemplate =
    '<div class="text-center" style="font-size:24px;color:#F06E5F">Oops! We can’t find what you are looking for.</div>';
    
  search.addWidget(
    instantsearch.widgets.hits({
      container: '.hits',
      hitsPerPage: 10,
      templates: {
        empty: noResultsTemplate,
        item: hitTemplate
      },
      transformData: {
        item: function(data) {
          var parts = data.date.split('-');
          var entry_title = data.title;
          if (entry_title){
            entry_title= entry_title.toLowerCase().replace(/ /g,'-').replace(/[-]+/g, '-').replace(/[^\w-]+/g,'');
          }else{
            entry_title= entry_title;
          }
          data.date = parts[1]+'.'+ parts[2]+'.'+parts[0];
          data.url = "/"+data.objectID+"-"+entry_title
          return data;
        }
      }
    })
  );

  search.addWidget(
    instantsearch.widgets.hits({
      container: '.hits1',
      hitsPerPage: 10,
      templates: {
        empty: noResultsTemplate,
        item: hitTemplate
      },
      transformData: {
        item: function(data) {
          var parts = data.date.split('-');
          var entry_title = data.title;
          if (entry_title){
            entry_title= entry_title.toLowerCase().replace(/ /g,'-').replace(/[-]+/g, '-').replace(/[^\w-]+/g,'');
          }else{
            entry_title= entry_title;
          }
          data.date = parts[1]+'.'+ parts[2]+'.'+parts[0];
          data.url = "/"+data.objectID+"-"+entry_title
          return data;
        }
      }
    })
  );
  
  search.start();

});