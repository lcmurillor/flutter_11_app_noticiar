import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewServices with ChangeNotifier {
  List<Article> headlines = [];
  List<Category> categories = [
    Category(Icons.business_outlined, 'business'),
    Category(Icons.tv_outlined, 'entertainment'),
    Category(Icons.public, 'general'),
    Category(Icons.healing_outlined, 'health'),
    Category(Icons.sports_football_outlined, 'sports'),
    Category(Icons.computer_outlined, 'technology'),
  ];

  final String _baseurl = 'https://newsapi.org/v2';
  final String _key = '072b86c555e945e99715c9c22ba87897';
  String _selectedCategory = 'business';
  Map<String, List<Article>> categoryArticle = {};

  NewServices() {
    getTopHeadlines();

    for (var element in categories) {
      categoryArticle[element.name] = <Article>[];
    }
  }

  get getArticuleCategorieSelected => categoryArticle[_selectedCategory];

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getArticuleByCategory(valor);
    notifyListeners();
  }

  getTopHeadlines() async {
    //TODO agregar a la documentacion
    final url = Uri.parse('$_baseurl/top-headlines?apiKey=$_key&country=mx');
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticuleByCategory(String category) async {
    if (categoryArticle[category]!.isNotEmpty) {
      return categoryArticle[category];
    }
    final url = Uri.parse(
        '$_baseurl/top-headlines?apiKey=$_key&country=mx&category=$category');
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    categoryArticle[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
