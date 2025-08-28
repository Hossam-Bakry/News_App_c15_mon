import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';

abstract class HomeInterfaceDataSource {
  Future<List<Articles>> getArticlesList(String sourcesId);

  Future<List<SourceData>> getSourcesList(String categoryId);
}
