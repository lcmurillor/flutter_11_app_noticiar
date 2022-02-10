import 'package:flutter/material.dart';
import 'package:newsapp/models/news_models.dart';
import 'package:newsapp/theme/theme.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return _New(
          article: news[index],
          id: index,
        );
      },
    );
  }
}

class _New extends StatelessWidget {
  const _New({Key? key, required this.article, required this.id})
      : super(key: key);

  final Article article;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(
          article: article,
          id: id,
        ),
        _CardTitle(
          article: article,
        ),
        _CardImag(
          article: article,
        ),
        _CardBody(
          article: article,
        ),
        const SizedBox(
          height: 20,
        ),
        const _CradButtom(),
        const Divider(),
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  const _CardTopBar({
    Key? key,
    required this.article,
    required this.id,
  }) : super(key: key);

  final Article article;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          '${id + 1}',
          style: const TextStyle(color: AppTheme.primary),
        ),
        Text(
          article.source.name,
        ),
      ]),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardImag extends StatelessWidget {
  const _CardImag({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (article.urlToImage.startsWith('http'))
                ? FadeInImage(
                    placeholder: const AssetImage('assets/giphy.gif'),
                    image: NetworkImage(article.urlToImage))
                : const Image(image: AssetImage('assets/no-image.png'))),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({Key? key, required this.article}) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(article.description),
    );
  }
}

class _CradButtom extends StatelessWidget {
  const _CradButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: AppTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.public),
        )
      ],
    );
  }
}
