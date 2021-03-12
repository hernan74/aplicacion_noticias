import 'package:aplicacion_noticias/pages/tap1_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/noticias_services.dart';
import 'tap2_page.dart';

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
    final service = Provider.of<NoticiasServices>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _CargarItemPagina(Tab1Page(), service.cargando),
        _CargarItemPagina(Tab2Page(), service.cargando)
      ],
    );
  }
}

Widget _CargarItemPagina(Widget winget, bool estado) {
  return Stack(children: [
    estado
        ? Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : winget,
  ]);
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
