import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/services/news_services.dart';
import 'package:newsapp/theme/theme.dart';
import 'package:newsapp/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewServices>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const _CategoryList(),
          Expanded(
              child: NewsList(news: newService.getArticuleCategorieSelected))
        ],
      )),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewServices>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final name = categories[index].name.toUpperCase();

            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategorieButton(category: categories[index]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(name)
                ],
              ),
            );
          }),
    );
  }
}

class _CategorieButton extends StatelessWidget {
  const _CategorieButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    //TODO agragar a la documentacion
    final newsServices = Provider.of<NewServices>(context);
    return GestureDetector(
      onTap: () {
        final newsServices = Provider.of<NewServices>(context, listen: false);
        newsServices.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newsServices.selectedCategory == category.name)
              ? AppTheme.primary
              : null,
        ),
      ),
    );
  }
}
