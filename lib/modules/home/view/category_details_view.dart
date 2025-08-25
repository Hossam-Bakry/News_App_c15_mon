import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/theme/color_pallete.dart';
import 'package:news_app_c15_mon/modules/home/view/articles_list_view.dart';
import 'package:news_app_c15_mon/modules/home/view_model/home_view_model.dart';
import 'package:news_app_c15_mon/modules/home/widgets/tab_bar_item_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatefulWidget {
  // final CategoryDataModel categoryDataModel;

  // DI dependency injection

  const CategoryDetailsView({super.key});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).getSources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// MVVM [Model View ViewModel]
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) {
        return Column(
          children: [
            DefaultTabController(
              length: viewModel.sourcesList.length,
              child: TabBar(
                onTap: viewModel.changeTapIndex,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: ColorPallete.generalTextColor,
                tabs:
                    viewModel.sourcesList.map((element) {
                      return TabBarItemWidget(
                        sourceData: element,
                        isSelected:
                            viewModel.currentTapIndex ==
                            viewModel.sourcesList.indexOf(element),
                      );
                    }).toList(),
              ),
            ),
            if (viewModel.sourcesList.isNotEmpty)
              ArticlesListView(
                sourceData: viewModel.sourcesList[viewModel.currentTapIndex],
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
