import 'package:flutter/material.dart';
import 'package:newsapp/pages/pages.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatorModel = Provider.of<_NavigationModel>(context);

    //final newsServices = Provider.of<NewServices>(context);
    //TODO Agregar esete Widget a la documentacion
    return BottomNavigationBar(
      currentIndex: navigatorModel.paginaActual,
      onTap: (value) {
        navigatorModel.paginaActual = value;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabezados',
        )
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatorModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigatorModel.pageController,
      //TODO agregar esto a la docuemtnacion, evata que el usario se mueva lateralmente
      //physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [Tab1Screen(), Tab2Screen()],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
