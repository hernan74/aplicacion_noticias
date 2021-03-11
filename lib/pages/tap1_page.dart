import 'package:aplicacion_noticias/services/noticias_services.dart';
import 'package:aplicacion_noticias/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tap1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noticiasServices = Provider.of<NoticiasServices>(context);

    return Scaffold(
      body: ListaNoticias(noticiasServices.headLines),
    );
  }
}
