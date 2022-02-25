import 'package:http/http.dart' as http;

class UserService {
   static const baseURL = "https://jsonplaceholder.typicode.com/users";

   static Future<http.Response> getUsersApiConnection() async {
     http.Response response;
     final url = Uri.parse(baseURL);

     try {
       response = await http.get(url);
     } on Exception catch (e) {
       rethrow;
     }

     return response;

   }

}