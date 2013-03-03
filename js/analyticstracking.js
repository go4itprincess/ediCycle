  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-38976054-1']);
  
  var pluginUrl = '//www.google-analytics.co.uk/plugins/ga/inpage_linkid.js';
	_gaq.push(['_require', 'inpage_linkid', pluginUrl]);
  
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); 
    ga.type = 'text/javascript'; 
    ga.async = true;
    
    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
    //ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();