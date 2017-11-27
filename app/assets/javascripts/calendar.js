/* on click create calendar*/
$('.calendar-toogle,.calendar-icon').on('click',function(){
	var url=location.href;
	var cal_year=url.match(/([^\/]*)\/*$/)[1];
	var i = $(this).attr('data-month');
	$( '#calendar'+i ).calendario({
		month: i,
		year: cal_year,
		checkUpdate : false,
		caldata : events,
		fillEmpty : false
	});
});