import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

String baseUrl = "https://9383-138-199-7-232.ngrok-free.app";

Future<String> getImageDetails(XFile selectedImage) async {
  final Uri uri = Uri.parse("$baseUrl/upload");

  final request = http.MultipartRequest("POST", uri);
  final Map<String, String> headers = {"Content-type": "multipart/form-data"};
  request.headers.addAll(headers);

  // Create a MultipartFile from the image file path
  final multipartFile = await http.MultipartFile.fromPath(
    'file', // Form field name
    selectedImage.path,
  );
  request.files.add(multipartFile);

  // Print filename before sending the request
  print('File being sent: ${selectedImage.path}');

  final response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await response.stream.bytesToString();
    final Map<String, dynamic> decodedResponse = json.decode(responseData);
    final String className = decodedResponse["class"];
    print("provider.dart mein");
    print(className);
    return className;
  } else {
    throw Exception('Failed to upload image');
  }
}
