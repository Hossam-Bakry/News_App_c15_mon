import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/theme/color_pallete.dart';
import 'package:news_app_c15_mon/modules/home/model/category_data_model.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';
import 'package:news_app_c15_mon/modules/home/pages/articles_list_view.dart';
import 'package:news_app_c15_mon/modules/home/widgets/tab_bar_item_widget.dart';
import 'package:news_app_c15_mon/network/api_requests.dart';

class CategoryDetailsView extends StatefulWidget {
  final CategoryDataModel categoryDataModel;

  // DI dependency injection

  const CategoryDetailsView({super.key, required this.categoryDataModel});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    /// API
    ///
    return FutureBuilder(
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
  }
}
