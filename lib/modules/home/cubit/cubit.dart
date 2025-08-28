import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c15_mon/core/gen/assets.gen.dart';
import 'package:news_app_c15_mon/modules/home/cubit/states.dart';
import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';
import 'package:news_app_c15_mon/modules/home/model/category_data_model.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';
import 'package:news_app_c15_mon/network/api_requests.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  // Inherited widget
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
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

  int _currentTapIndex = 0;
  CategoryDataModel? _selectedCategory;
  List<SourceData> _sourcesList = [];
  List<Articles> _articlesList = [];

  CategoryDataModel? get selectedCategory => _selectedCategory;

  List<SourceData> get sourcesList => _sourcesList;

  int get currentTapIndex => _currentTapIndex;

  List<Articles> get articlesList => _articlesList;

  void onCategoryClicked([CategoryDataModel? categoryDataModel]) {
    _selectedCategory = categoryDataModel;
    emit(SetSelectedCategoryValueState());
  }

  void changeTapIndex(int index) {
    _currentTapIndex = index;
    getArticles(_sourcesList[index].id);
    emit(SetSelectedTapIndexState());
  }

  Future<void> getSources() async {
    emit(LoadingGetSourcesListState());
    try {
      _sourcesList = await ApiRequests.getSources(_selectedCategory!.id);
      emit(SuccessGetSourcesListState(sourcesList: _sourcesList));
    } catch (e) {
      emit(ErrorGetSourcesListState());
      rethrow;
    }
  }

  Future<void> getArticles(String sourcesId) async {
    emit(LoadingGetArticlesListState());
    try {
      _articlesList = await ApiRequests.getArticles(sourcesId);

      emit(SuccessGetArticlesListState());
    } catch (e) {
      emit(ErrorGetArticlesListState());
      rethrow;
    }
  }
}
