import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/modules/home/model/articles_List_data.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles articles;

  const ArticleItemWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        spacing: 10,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage ?? '',
            imageBuilder:
                (context, imageProvider) => Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider),
                  ),
                ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 50),
          ),
          Text(
            articles.title ?? "",
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                articles.source?.name ?? "",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xFFA0A0A0),
                ),
              ),
              Text(
                articles.publishedAt ?? "",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xFFA0A0A0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
