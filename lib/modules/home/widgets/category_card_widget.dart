import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/modules/home/model/category_data_model.dart';

class CategoryCardWidget extends StatelessWidget {
  final int index;
  final Function onTap;
  final CategoryDataModel categoryDataModel;

  const CategoryCardWidget({
    super.key,
    required this.index,
    required this.onTap,
    required this.categoryDataModel,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      height: 220,
      width: double.infinity,
      alignment:
          categoryDataModel.isRight
              ? Alignment.bottomRight
              : Alignment.bottomLeft,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        image: DecorationImage(
          image: AssetImage(categoryDataModel.image),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          onTap(categoryDataModel);
        },
        child: Container(
          // height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white54,
          ),
          child: Directionality(
            textDirection:
                categoryDataModel.isRight
                    ? TextDirection.ltr
                    : TextDirection.rtl,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("View All", style: theme.textTheme.headlineSmall),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
