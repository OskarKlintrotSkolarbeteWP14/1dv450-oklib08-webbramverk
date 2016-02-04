$(document).ready(function(){
	/* Call cookiesDirective, overriding any default params

		*** These are the defaults ***
			explicitConsent: true,
			position: 'top',
			duration: 10,
			limit: 0,
			message: null,
			cookieScripts: null,
			privacyPolicyUri: 'privacy.html',
			scriptWrapper: function(){},
			fontFamily: 'helvetica',
			fontColor: '#FFFFFF',
			fontSize: '13px',
			backgroundColor: '#000000',
			backgroundOpacity: '80',
			linkColor: '#CA0000'

	*/
  console.log("Cookie Notice");
	$.cookiesDirective({
		explicitConsent: false,
    position: 'bottom',
		backgroundColor: '#52B54A',
		linkColor: '#ffffff'
	});
});
