import 'package:flutter/material.dart';
import 'package:news_app/backend/functions.dart';
import 'package:news_app/components/appbar.dart';
import 'package:news_app/components/newsbox.dart';
import 'package:news_app/components/searchbar.dart';
import 'package:news_app/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  void searchNews() => setState(() => news = fetchNews());

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          Searchbar(onSearch: searchNews),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Newsbox(newsInfo: snapshot.data![index]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
