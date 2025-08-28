import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/cubit/cubit.dart';
import 'package:news_app_c15_mon/modules/home/RepositoryDesignPattern/cubit/states.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';
import 'package:news_app_c15_mon/modules/home/widgets/article_item_widget.dart';

class ArticlesListView extends StatefulWidget {
  final SourceData sourceData;

  const ArticlesListView({super.key, required this.sourceData});

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  late HomeCubit cubit;

  @override
  void initState() {
    cubit = HomeCubit.get(context);
    cubit.getArticles(widget.sourceData.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, states) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return ArticleItemWidget(articles: cubit.articlesList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16);
            },
            itemCount: cubit.articlesList.length,
          );
        },
      ),
    );
    // return Expanded(
    //   child: FutureBuilder(
    //     future: ApiRequests.getArticles(widget.sourceData.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return Text(snapshot.error.toString());
    //       }
    //
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //
    //       List<Articles> articlesList = snapshot.data ?? [];
    //       return ListView.separated(
    //         itemBuilder: (context, index) {
    //           return ArticleItemWidget(articles: articlesList[index]);
    //         },
    //         separatorBuilder: (context, index) {
    //           return SizedBox(height: 16);
    //         },
    //         itemCount: articlesList.length,
    //       );
    //     },
    //   ),
    // );
  }
}
