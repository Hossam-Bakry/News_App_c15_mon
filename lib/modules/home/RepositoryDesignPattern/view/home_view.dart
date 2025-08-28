import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c15_mon/core/constants/app_assets.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/cubit/cubit.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/cubit/states.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/data/home_data_source.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/data/home_remote_api_data_source.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/repositories/home_repositories.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/view/category_details_view.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/view/custom_drawer.dart';
import 'package:news_app_c15_mon/modules/home/widgets/category_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeRepositories _homeRepositories;
  late HomeInterfaceDataSource _homeInterfaceDataSource;

  @override
  void initState() {
    // Dependency Injection
    _homeInterfaceDataSource = HomeRemoteApiDataSource();
    _homeRepositories = HomeRepositories(_homeInterfaceDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(_homeRepositories),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                HomeCubit.get(context).selectedCategory == null
                    ? 'Home'
                    : HomeCubit.get(context).selectedCategory!.title,
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
                HomeCubit.get(context).onCategoryClicked();
                Navigator.pop(context);
              },
            ),
            body:
                HomeCubit.get(context).selectedCategory == null
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
                                  categoryDataModel:
                                      HomeCubit.get(context).categories[index],
                                  onTap:
                                      HomeCubit.get(context).onCategoryClicked,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 15);
                              },
                              itemCount:
                                  HomeCubit.get(context).categories.length,
                            ),
                          ],
                        ),
                      ),
                    )
                    : CategoryDetailsView(),
          );
        },
      ),
    );
  }
}
