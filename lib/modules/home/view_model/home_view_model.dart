import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/gen/assets.gen.dart';
import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';
import 'package:news_app_c15_mon/modules/home/model/category_data_model.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';
import 'package:news_app_c15_mon/network/api_requests.dart';

class HomeViewModel extends ChangeNotifier {
  CategoryDataModel? _selectedCategory;
  int _currentTapIndex = 0;
  List<CategoryDataModel> categories = [
    CategoryDataModel(
      id: "general",
      title: "General",
      image: Assets.images.generalImg.path,
      isRight: true,
    ),
    CategoryDataModel(
      id: "business",
      title: "Business",
      image: Assets.images.businessImg.path,
      isRight: false,
    ),
    CategoryDataModel(
      id: "sports",
      title: "Sports",
      image: Assets.images.sportsImg.path,
      isRight: true,
    ),
    CategoryDataModel(
      id: "health",
      title: "Health",
      image: Assets.images.healthImg.path,
      isRight: false,
    ),
    CategoryDataModel(
      id: "science",
      title: "Science",
      image: Assets.images.scienceImg.path,
      isRight: true,
    ),
    CategoryDataModel(
      id: "technology",
      title: "Technology",
      image: Assets.images.technologyImg.path,
      isRight: false,
    ),
    CategoryDataModel(
      id: "entertainment",
      title: "Entertainment",
      image: Assets.images.entertainmentImg.path,
      isRight: true,
    ),
  ];
  List<SourceData> _sourcesList = [];
  List<Articles> _articlesList = [];

  int get currentTapIndex => _currentTapIndex;

  List<Articles> get articlesList => _articlesList;

  List<SourceData> get sourcesList => _sourcesList;

  CategoryDataModel? get selectedCategory => _selectedCategory;

  void changeTapIndex(int index) {
    _currentTapIndex = index;
    getArticles(_sourcesList[index].id);
    notifyListeners();
  }

  void onCategoryClicked([CategoryDataModel? categoryDataModel]) {
    _selectedCategory = categoryDataModel;
    notifyListeners();
  }

  Future<void> getSources() async {
    try {
      _sourcesList = await ApiRequests.getSources(_selectedCategory!.id);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getArticles(String sourcesId) async {
    try {
      _articlesList = await ApiRequests.getArticles(sourcesId);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
