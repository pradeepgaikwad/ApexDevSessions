public class NamedCredentialTest {
    private static final String GEOCODE_PATH = '/maps/api/geocode/json?';
    private static final String ADDRESS_VARIABLE = 'address=1600+Amphitheatre+Parkway+Mountain+view,+CA';
    private static final String KEY_VARIABLE = '&key=AIzaSyCK4B7tQmiCQ6h2xiqW5XjInLR1fAC-34I';
    private static final String POSTS = 'posts';
	public static void callGoogleMaps()
    {
    	HttpRequest req = new HttpRequest();
        //req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
       // req.setEndpoint('callout:Google_Maps_GeoCode' + GEOCODE_PATH + ADDRESS_VARIABLE + KEY_VARIABLE);
        //req.setEndpoint('callout:JSONPlaceholders'+'/'+POSTS);
        //req.setEndpoint('callout:Ipsum');
        req.setTimeout(12000);
        req.setHeader('Content-Type','application/json');
        req.setHeader('Accept','application/json');
        req.setEndpoint('callout:Images');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
    }
}