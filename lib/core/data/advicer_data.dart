import 'dart:convert';

import 'package:dio/dio.dart';

class AppData {
  final Dio dio = Dio();

  Future<String> getAdvice() async {
    final response = await dio.get("https://api.adviceslip.com/advice");
    final data = jsonDecode(response.data);
    final advice = data["slip"]["advice"];
    return advice;
  }

  Future<String> getQuote() async {
    try {
      final response = await dio.get("https://api.quotable.io/random");
      final data = response.data;
      final quote = data["content"];
      return quote;
    } catch (e) {
      throw Exception("Failed to load quote: $e");
    }
  }

  Future<String> getRandomFact() async {
    final response = await dio.get('https://catfact.ninja/fact');
    final data = response.data;
    final fact = data['fact'];
    return fact;
  }
}
