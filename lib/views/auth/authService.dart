import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl ='https://aclub.onrender.com';

Future<Map<String, dynamic>> registerUser(
    String first, String last, String roll, String phone, String pass) async {
  final res = await http.post(
    Uri.parse('$baseUrl/auth/signup'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "firstName": first,
      "lastName": last,
      "rollNo": roll,
      "phoneNo": phone,
      "password": pass
    }),
  );

  print("Response Code: ${res.statusCode}");
  print("Response Body: ${res.body}");

  return jsonDecode(res.body);
}
Future<Map<String,dynamic>>signUser(String rollNumber,String password)async{
final res=await http.post(
  Uri.parse('$baseUrl/auth/login'),
  headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "rollNo":rollNumber,
      "password":password
    }),
);
print("response code:${res.statusCode}");
print("response code:${res.body}");
return jsonDecode(res.body);
}

}