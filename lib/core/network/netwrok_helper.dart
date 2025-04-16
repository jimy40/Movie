import 'dart:io';

class NetworkHelper {
  Future<Map<String, String>> getHeadersWithToken() async => {
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzQ4MWQ3MGM1OTI4ZjRmYjZkNDVlNTkyYTEyYmM0MyIsIm5iZiI6MTc0MTYwMjM5My40NDQsInN1YiI6IjY3Y2ViZTU5Mjc5NGIwZDU5ODJhYjk5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rlurv3gEOYunuBlyQ0T0LVXmi2p_18ssjJn1qmGNe6Q' //
      };

  Future<Map<String, String>> getHeadersWithTokenAndJsonContentType() async => {
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzQ4MWQ3MGM1OTI4ZjRmYjZkNDVlNTkyYTEyYmM0MyIsIm5iZiI6MTc0MTYwMjM5My40NDQsInN1YiI6IjY3Y2ViZTU5Mjc5NGIwZDU5ODJhYjk5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rlurv3gEOYunuBlyQ0T0LVXmi2p_18ssjJn1qmGNe6Q',
        HttpHeaders.contentTypeHeader: 'application/json'
      };

  Map<String, String> getHeadersWithJsonContentType() =>
      {HttpHeaders.contentTypeHeader: 'application/json'};
}
