import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "http://localhost:3000/";

Future<String> getImageDetails(XFile selectedImage) async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // String token = prefs.getString("token")!;
  final Uri uri = Uri.parse("$baseUrl/upload");

  final request = http.MultipartRequest("POST", uri);
  final Map<String, String> headers = {
    "Content-type": "multipart/form-data"
  };
  request.headers.addAll(headers);

  final fileStream = http.ByteStream(selectedImage.openRead());
  final fileLength = await selectedImage.length();
  final multipartFile = http.MultipartFile(
    'file',
    fileStream,
    fileLength,
    filename: selectedImage.path.split('/').last,
  );
  request.files.add(multipartFile);

  final response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await response.stream.bytesToString();
    final decodedResponse = json.decode(responseData);
    final name = decodedResponse["name"]; // Assuming "name" is the key in the response
    return name.toString();
  } else {
    throw Exception('Failed to upload image');
  }
}
