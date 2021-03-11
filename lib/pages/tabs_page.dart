import 'package:aplicacion_noticias/pages/tap1_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new NavegacionModel(),
      child: Scaffold(
        body: _Pagina(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Pagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tap1Page(),
        Container(
          color: Colors.greenAccent,
        )
      ],
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<NavegacionModel>(context);
    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Para ti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Encabezados'),
        ]);
  }
}

class NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  int get paginaActual => _paginaActual;

  PageController get pageController => _pageController;

  set paginaActual(int pagina) {
    this._paginaActual = pagina;
    _pageController.animateToPage(_paginaActual,
        duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);
    notifyListeners();
  }
}
