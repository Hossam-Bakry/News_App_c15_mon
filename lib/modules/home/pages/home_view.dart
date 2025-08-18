import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/constants/app_assets.dart';
import 'package:news_app_c15_mon/core/gen/assets.gen.dart';
import 'package:news_app_c15_mon/modules/home/model/category_data_model.dart';
import 'package:news_app_c15_mon/modules/home/pages/category_details_view.dart';
import 'package:news_app_c15_mon/modules/home/pages/custom_drawer.dart';
import 'package:news_app_c15_mon/modules/home/widgets/category_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryDataModel? selectedCategory;

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

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ImageIcon(AssetImage(AppAssets.searchIcn)),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onTap: () {
          setState(() {
            selectedCategory = null;
          });
          Navigator.pop(context);
        },
      ),
      body:
          selectedCategory == null
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Good Morning\nHere is Some News For You",
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 15),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CategoryCardWidget(
                            index: index,
                            categoryDataModel: categories[index],
                            onTap: onCategoryClicked,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15);
                        },
                        itemCount: categories.length,
                      ),
                    ],
                  ),
                ),
              )
              : CategoryDetailsView(categoryDataModel: selectedCategory!),
    );
  }

  // callback function
  void onCategoryClicked(CategoryDataModel categoryDataModel) {
    setState(() {
      selectedCategory = categoryDataModel;
    });
    log(categoryDataModel.id);
  }
}
