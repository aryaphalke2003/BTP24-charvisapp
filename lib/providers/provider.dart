import 'dart:convert';
import 'package:charvis/components/chartSummary.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

String baseUrl = "https://534b-103-118-50-220.ngrok-free.app";

Future<String> getImageDetails(
    XFile selectedImage, bool generateWithGemini) async {
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
  request.fields['generateWithGemini'] = generateWithGemini ? "true" : "false";

  // Print filename before sending the request
  print('File being sent: ${selectedImage.path}');

  final response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await response.stream.bytesToString();
    final Map<String, dynamic> decodedResponse = json.decode(responseData);
    print("responsedata");
    print(responseData);
    print("decoded");
    print(decodedResponse);

    ChartSummary chartSummary = summarizeChartData(responseData as String);

    // Feed the ChartSummary object to convertToAudio function
    print("printing chartsum");
    print(chartSummary);
    Future<String> xxx = convertToAudio(chartSummary);
    print("provider.dart mein");
    print(xxx);
    return xxx;
  } else {
    throw Exception('Failed to upload image');
  }
}
