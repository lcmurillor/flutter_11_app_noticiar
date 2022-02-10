import 'package:flutter/material.dart';
import 'package:newsapp/widgets/news_list.dart';
import 'package:provider/provider.dart';

import '../services/news_services.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

//TODO agregar esto a la documentacion, matiende le estado de la app
class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsServices = Provider.of<NewServices>(context);
    // NewsList(news: newsServices.headlines)
    return Scaffold(
        body: (newsServices.headlines.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : NewsList(news: newsServices.headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
