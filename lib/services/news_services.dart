import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:news_api_with_cubit/model/news_model.dart';

class NewsServices {
  static final URL = 'https://newsapi.org/v2/';
  static final API_KEY = '0011a3c08d6c44bc8e68eb7bce22b787';

  //endpoint

  static final TOP_HEADLINES =
      URL + 'top-headlines?country=id&apiKey=' + API_KEY;

  Future<List<NewsModel>> getTopHeadlines() async {
    try {
      final data = await http.get(Uri.parse(TOP_HEADLINES));
      if (json.decode(data.body)['status'] == "error") return [];

      List newsData = json.decode(data.body)['articles'];
      return newsData.map((news) => NewsModel.fromJson(news)).toList();
    } catch (error) {
      print(error);
      throw Exception(error);
    }
  }
}
