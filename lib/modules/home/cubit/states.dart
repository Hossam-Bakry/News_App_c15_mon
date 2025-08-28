import 'package:news_app_c15_mon/modules/home/model/source_data.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class SetSelectedCategoryValueState extends HomeStates {}

class SetSelectedTapIndexState extends HomeStates {}

class LoadingGetSourcesListState extends HomeStates {}

class SuccessGetSourcesListState extends HomeStates {
  final List<SourceData> sourcesList;

  SuccessGetSourcesListState({required this.sourcesList});
}

class ErrorGetSourcesListState extends HomeStates {}

class LoadingGetArticlesListState extends HomeStates {}

class SuccessGetArticlesListState extends HomeStates {}

class ErrorGetArticlesListState extends HomeStates {}
