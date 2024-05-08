import 'dart:convert';
import 'package:charvis/components/chartSummary.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

String baseUrl = "https://9383-138-199-7-232.ngrok-free.app";

Future<String> getImageDetails(XFile selectedImage,bool generateWithGemini) async {
  // final Uri uri = Uri.parse("$baseUrl/upload");

  // final request = http.MultipartRequest("POST", uri);
  // final Map<String, String> headers = {"Content-type": "multipart/form-data"};
  // request.headers.addAll(headers);

  // // Create a MultipartFile from the image file path
  // final multipartFile = await http.MultipartFile.fromPath(
  //   'file', // Form field name
  //   selectedImage.path,
  // );
  // request.files.add(multipartFile);
  // request.fields['generateWithGemini'] = generateWithGemini as String;

  // // Print filename before sending the request
  // print('File being sent: ${selectedImage.path}');

  // final response = await request.send();
  // if (response.statusCode == 200) {
    // final responseData = await response.stream.bytesToString();
    // final Map<String, dynamic> decodedResponse = json.decode(responseData);
    String response='''
[
    {
        "image": "PMC6165091___1.jpg",
        "class": "vertical_bar",
        "data": [
            {
                "xlt": 0.26558249999999994,
                "ylt": 0.013477050000000004,
                "xrb": 0.7886175,
                "yrb": 0.09164415000000001,
                "role": "chart_title",
                "text": "Number of Cases per District",
                "mapped_tick": null,
                "axis": null,
                "val": null
            },
            {
                "xlt": 0.005420000000000001,
                "ylt": 0.36388100000000007,
                "xrb": 0.0243902,
                "yrb": 0.6900270000000001,
                "role": "axis_title",
                "text": "3d135D AD 1A2CL118vm",
                "mapped_tick": null,
                "axis": null,
                "val": null
            },
            {
                "xlt": 0.06504064999999999,
                "ylt": 0.8921828,
                "xrb": 0.07723574999999999,
                "yrb": 0.9272232,
                "role": "y_label",
                "text": "0",
                "mapped_tick": [
                    0.08807585000000001,
                    0.9002695999999999,
                    0.10162595,
                    0.9245283999999999
                ],
                "axis": "y",
                "val": null
            },
            {
                "xlt": 0.055555600000000004,
                "ylt": 0.5067388,
                "xrb": 0.0785908,
                "yrb": 0.5417792,
                "role": "y_label",
                "text": "40",
                "mapped_tick": [
                    0.08807585000000001,
                    0.5121289,
                    0.10162595,
                    0.5390831
                ],
                "axis": "y",
                "val": null
            },
            {
                "xlt": 0.055555600000000004,
                "ylt": 0.6981128,
                "xrb": 0.0785908,
                "yrb": 0.7331532,
                "role": "y_label",
                "text": "20",
                "mapped_tick": [
                    0.08943095000000001,
                    0.7061999,
                    0.10298105,
                    0.7331541
                ],
                "axis": "y",
                "val": null
            },
            {
                "xlt": 0.055555600000000004,
                "ylt": 0.31536349999999996,
                "xrb": 0.0785908,
                "yrb": 0.3477085,
                "role": "y_label",
                "text": "60",
                "mapped_tick": [
                    0.08807595,
                    0.3207549,
                    0.10298105,
                    0.3477091
                ],
                "axis": "y",
                "val": null
            },
            {
                "xlt": 0.055555600000000004,
                "ylt": 0.12129379999999998,
                "xrb": 0.0785908,
                "yrb": 0.15633419999999998,
                "role": "y_label",
                "text": "80",
                "mapped_tick": [
                    0.08807585000000001,
                    0.1266849,
                    0.10162595,
                    0.1536391
                ],
                "axis": "y",
                "val": null
            },
            {
                "xlt": 0.5108396999999999,
                "ylt": 0.9433966500000001,
                "xrb": 0.5704602999999999,
                "yrb": 0.98652335,
                "role": "x_label",
                "text": "Kulgam",
                "mapped_tick": [
                    0.53523045,
                    0.9002695999999999,
                    0.54742555,
                    0.9245283999999999
                ],
                "axis": "x",
                "val": 44
            },
            {
                "xlt": 0.12195114999999998,
                "ylt": 0.9433958,
                "xrb": 0.19647684999999998,
                "yrb": 0.9784362,
                "role": "x_label",
                "text": "Pulwama",
                "mapped_tick": [
                    0.15311645000000002,
                    0.9002695999999999,
                    0.16531155,
                    0.9245283999999999
                ],
                "axis": "x",
                "val": 73
            },
            {
                "xlt": 0.8915987,
                "ylt": 0.9433966500000001,
                "xrb": 0.9566393,
                "yrb": 0.98652335,
                "role": "x_label",
                "text": "Badgam",
                "mapped_tick": [
                    0.91869945,
                    0.9002695999999999,
                    0.93089455,
                    0.9245283999999999
                ],
                "axis": "x",
                "val": 20
            },
            {
                "xlt": 0.6355016499999999,
                "ylt": 0.94339635,
                "xrb": 0.70325235,
                "yrb": 0.98382765,
                "role": "x_label",
                "text": "Srinagar",
                "mapped_tick": [
                    0.66260195,
                    0.9002695999999999,
                    0.67615205,
                    0.9245283999999999
                ],
                "axis": "x",
                "val": 39
            },
            {
                "xlt": 0.7520320500000001,
                "ylt": 0.9433958,
                "xrb": 0.84281795,
                "yrb": 0.9784362,
                "role": "x_label",
                "text": "Baramullah",
                "mapped_tick": [
                    0.79132795,
                    0.9002699,
                    0.80487805,
                    0.9272241
                ],
                "axis": "x",
                "val": 50
            },
            {
                "xlt": 0.25203214999999995,
                "ylt": 0.9433966500000001,
                "xrb": 0.31842784999999996,
                "yrb": 0.98652335,
                "role": "x_label",
                "text": "Shopian",
                "mapped_tick": [
                    0.27913245,
                    0.9002695999999999,
                    0.29132755,
                    0.9245283999999999
                ],
                "axis": "x",
                "val": 12
            },
            {
                "xlt": 0.37804865000000004,
                "ylt": 0.9460921000000001,
                "xrb": 0.44850935000000003,
                "yrb": 0.9838279000000001,
                "role": "x_label",
                "text": "Kupwara",
                "mapped_tick": [
                    0.40785945,
                    0.9002699,
                    0.42005455,
                    0.9272241
                ],
                "axis": "x",
                "val": 19
            }
        ]
    }
]
''';
    ChartSummary chartSummary = summarizeChartData(response as String);

    // Feed the ChartSummary object to convertToAudio function
    await convertToAudio(chartSummary);
    // final String className = decodedResponse["class"];
    final String className="bar";
    print("provider.dart mein");
    print(className);
    return className;
  // } else {
    // throw Exception('Failed to upload image');
  // }
}
