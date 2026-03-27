import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/bottomsheet.dart';
import 'package:news_app/components/divider.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/text.dart';

class Newsbox extends StatelessWidget {
  const Newsbox({super.key, required this.newsInfo});

  final Map newsInfo;

  @override
  Widget build(BuildContext context) {
    // print(JsonEncoder.withIndent('  ').convert(newsInfo));
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(
              context,
              newsInfo['title'],
              newsInfo['description'],
              newsInfo['urlToImage'] ?? Constants.imageurl,
              newsInfo['url'],
            );
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: newsInfo['urlToImage'] ?? Constants.imageurl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                    );
                  },
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: AppColors.primary),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ModifiedText(
                        color: AppColors.white,
                        size: 16,
                        text: newsInfo['title'],
                      ),
                      SizedBox(height: 5),
                      ModifiedText(
                        color: AppColors.lightwhite,
                        size: 12,
                        text:
                            '${DateTime.parse(newsInfo['publishedAt']).toLocal()}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        CustomDivider(),
      ],
    );
  }
}
