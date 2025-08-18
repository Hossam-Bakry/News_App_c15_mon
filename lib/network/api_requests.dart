import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';
import 'package:news_app_c15_mon/network/api_constants.dart';
import 'package:news_app_c15_mon/network/end_points.dart';

abstract class ApiRequests {
  /// https://newsapi.org/v2/everything?q=Apple&apiKey=API_KEY

  static Future<List<SourceData>> getSources(String categoryId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": ApiConstants.apiKey,
      "category": categoryId,
    };

    final response = await http.get(
      Uri.https(ApiConstants.baseUrl, EndPoints.getSources, queryParameters),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      SourcesListData sourcesListData = SourcesListData.fromJson(data);

      return sourcesListData.sources;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Articles>> getArticles(String sourcesId) async {
    Map<String, dynamic>? queryParameters = {
      "apiKey": ApiConstants.apiKey,
      "sources": sourcesId,
    };

    final response = await http.get(
      Uri.https(ApiConstants.baseUrl, EndPoints.getArticles, queryParameters),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      ArticlesListData articlesListData = ArticlesListData.fromJson(data);

      return articlesListData.articles ?? [];
      // parsing for data
    } else {
      throw Exception('Failed to load data');
    }
  }
}
