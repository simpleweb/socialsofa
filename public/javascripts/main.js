$(function(){	
	$.easy.navigation();
	$.easy.tooltip();
	$.easy.popup();
	$.easy.external();
	$.easy.rotate();
	$.easy.cycle();
	$.easy.forms();
	$.easy.showhide();
	$.easy.jump();
	
	$('.inlinesparkline').sparkline('html', {type: 'line', lineColor: '#22525D', fillColor: '#F8EBE0', spotColor: '#281915', minSpotColor: '#281915', maxSpotColor: '#281915', width: '70px', height: '30px'} );
	
	
	var api = new jGCharts.Api(); 
	jQuery('<img>') 
	.attr('src', api.make({ 
	data : [[105.7],[70],[50],[200],[105.7],[70],[50],[200],[105.7],[10],[250],[200]], //MANDATORY 
	colors      : ['A99B8B'], 
	type : 'lc',
	fillarea : true,
	size : '600x200'
	})) 
	.appendTo("#searchResultsChart");
	
});