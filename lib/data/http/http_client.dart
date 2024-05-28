import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String address});
  //Future post({required String address, required Object object});
}

const String url = "http://172.16.0.21:8004/api/";

class HttpClient implements IHttpClient {
  final client = http.Client();
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  Future get({required String address}) async {
    return await client.get(Uri.parse("$url$address"), headers: requestHeaders);
  }

  // @override
  // Future<dynamic> post(
  //     {required String address, required Object object}) async {
  //   print("TOKEN post: $token");
  //   print('ADDRESS: $address | OBJETO: ${object.toString()}');
  //   return client.post(
  //     Uri.parse("$url$address"),
  //     headers: requestHeaders,
  //     body: object,
  //   );
  // }
}
