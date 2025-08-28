import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/data/home_data_source.dart';
import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';

class HomeFirebaseDataSource implements HomeInterfaceDataSource {
  @override
  Future<List<Articles>> getArticlesList(String sourcesId) {
    // TODO: implement getArticlesList
    throw UnimplementedError();
  }

  @override
  Future<List<SourceData>> getSourcesList(String categoryId) {
    // TODO: implement getSourcesList
    throw UnimplementedError();
  }
}
