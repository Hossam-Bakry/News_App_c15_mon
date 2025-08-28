import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/data/home_data_source.dart';
import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';
import 'package:news_app_c15_mon/network/api_requests.dart';

class HomeRemoteApiDataSource implements HomeInterfaceDataSource {
  @override
  Future<List<SourceData>> getSourcesList(String categoryId) async {
    return await ApiRequests.getSources(categoryId);
  }

  @override
  Future<List<Articles>> getArticlesList(String sourcesId) async {
    return await ApiRequests.getArticles(sourcesId);
  }
}
