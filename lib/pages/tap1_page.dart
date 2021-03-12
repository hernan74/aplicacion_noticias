import 'package:aplicacion_noticias/services/noticias_services.dart';
import 'package:aplicacion_noticias/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final noticiasServices = Provider.of<NoticiasServices>(context);

    return Scaffold(
      body: ListaNoticias(noticiasServices.headLines,noticiasServices.cargando),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
