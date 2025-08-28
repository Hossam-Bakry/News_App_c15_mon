import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/data/home_data_source.dart';
import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';

class HomeRepositories {
  // DI
  final HomeInterfaceDataSource _homeInterfaceDataSource;

  HomeRepositories(this._homeInterfaceDataSource);

  Future<List<SourceData>> getSourcesList(String categoryId) async {
    return await _homeInterfaceDataSource.getSourcesList(categoryId);
  }

  Future<List<Articles>> getArticlesList(String sourceId) async {
    return _homeInterfaceDataSource.getArticlesList(sourceId);
  }
}
