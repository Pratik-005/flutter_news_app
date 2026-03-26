import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/components/searchbar.dart';
import 'package:news_app/utils/key.dart' as Key;

Future<List> fetchNews() async {
  final res = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${Key.key}&q=${Searchbar.searchcontroller.text}',
    ),
  );
  Map result = jsonDecode(res.body);
  return result['articles'];
}
