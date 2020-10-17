import 'dart:convert' as convert;
import 'dart:convert';
import 'package:actic/jsonResponseModel.dart';
import 'package:http/http.dart' as http;


// Här kör jag en api anrop som tar två värde dvs Center och ID. Och sedan matar jag in de 
// värden till http.post som ger resultat efter några sekunder
Future<Qrcode> qrCodeResponse(int center, int id) async {
  final response = await http.post(
    'https://cmx.int.actic.se/cmx/getQr',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, Map<String, dynamic>>{
      "parameters": {
        "personKey": {"center": center, "id": id}
      }
    }),
  );
  // Om jag får en bra response dvs om response är inte null då sparar jag response i en responseModel och returnerar jag.
  if (response.statusCode == 200) {
    Qrcode qrResponse = Qrcode.fromJson(convert.jsonDecode(response.body));
    return qrResponse;
  } else {
    throw Exception('Filed to get QRCode');
  }
}















class HttpRequest {}

/* Future<http.Response> getQRCode() {
  return http.post(
    'https://cmx.int.actic.se/cmx/getQr',
    body: convert.jsonEncode(
      {
        "parameters": {
          "personKey": {"center": 45, "id": 2067}
        }
      },
    ),
  );
} */
