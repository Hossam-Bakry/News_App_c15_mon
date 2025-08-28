import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c15_mon/core/theme/color_pallete.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/cubit/cubit.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/cubit/states.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/view/articles_list_view.dart';
import 'package:news_app_c15_mon/modules/home/widgets/tab_bar_item_widget.dart';

/// Stream
class CategoryDetailsView extends StatefulWidget {
  // final CategoryDataModel categoryDataModel;

  // DI dependency injection

  const CategoryDetailsView({super.key});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  late HomeCubit cubit;

  @override
  void initState() {
    cubit = HomeCubit.get(context);

    cubit.getSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// MVVM [Model View ViewModel]
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        /// Listen to states
      },
      builder: (context, state) {
        if (state is LoadingGetSourcesListState) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            DefaultTabController(
              length: cubit.sourcesList.length,
              child: TabBar(
                onTap: cubit.changeTapIndex,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: ColorPallete.generalTextColor,
                tabs:
                    cubit.sourcesList.map((element) {
                      return TabBarItemWidget(
                        sourceData: element,
                        isSelected:
                            cubit.currentTapIndex ==
                            cubit.sourcesList.indexOf(element),
                      );
                    }).toList(),
              ),
            ),
            if (cubit.sourcesList.isNotEmpty)
              ArticlesListView(
                sourceData: cubit.sourcesList[cubit.currentTapIndex],
              ),
          ],
        );
      },
    );
    /*return FutureBuilder(
      future: ApiRequests.getSources(widget.categoryDataModel.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<SourceData> sourcesList = snapshot.data ?? [];

        // List<SourceData> --> List<Widget>
        return Consumer<HomeViewModel>(
          builder: (context, value, _) {
            return Column(
              children: [
                DefaultTabController(
                  length: sourcesList.length,
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: ColorPallete.generalTextColor,
                    tabs:
                        sourcesList.map((element) {
                          return TabBarItemWidget(
                            sourceData: element,
                            isSelected:
                                selectedIndex == sourcesList.indexOf(element),
                          );
                        }).toList(),
                  ),
                ),
                ArticlesListView(sourceData: sourcesList[selectedIndex]),
              ],
            );
          },
        );
      },
    );*/
  }
}
