import "dart:convert";
import 'package:flutter_tts/flutter_tts.dart';


class ChartSummary {
  final String chartClass;
  final List<String> axisNames;
  final Map<String, dynamic> xAxisData;

  ChartSummary({
    required this.chartClass,
    required this.axisNames,
    required this.xAxisData,
  });
}

ChartSummary summarizeChartData(String jsonData) {
  final List<dynamic> data = json.decode(jsonData);

  // Extract chart class
  final String chartClass = data[0]['class'];

  // Extract axis names
  final List<String> axisNames = [];
  for (final item in data[0]['data']) {
    if (item['role'] == 'x_label') {
      axisNames.add(item['text']);
    }
  }

  // Extract x-axis data with corresponding values
  final Map<String, dynamic> xAxisData = {};
  for (final item in data[0]['data']) {
    if (item['role'] == 'x_label') {
      xAxisData[item['text']] = item['val'];
    }
  }

  return ChartSummary(
    chartClass: chartClass,
    axisNames: axisNames,
    xAxisData: xAxisData,
  );
}

// Import the text-to-speech package

// Function to convert ChartSummary to audio
Future<void> convertToAudio(ChartSummary summary) async {
  // Initialize the text-to-speech engine
  FlutterTts flutterTts = FlutterTts();

  // Construct the audio message
  String audioMessage = "Chart class is ${summary.chartClass}. ";
  audioMessage += "Axis names are ${summary.axisNames.join(', ')}. ";
  audioMessage += "X-axis data with corresponding values are: ";
  summary.xAxisData.forEach((key, value) {
    audioMessage += "$key has value $value. ";
  });

  // Use text-to-speech to speak the audio message
  await flutterTts.speak(audioMessage);
}
