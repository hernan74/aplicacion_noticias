import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/noticias_services.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [_ListaCategoria()],
      ),
    ));
  }
}

class _ListaCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NoticiasServices>(context).categoria;
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [Icon(categorias[i].icon), Text(categorias[i].name)],
            ),
          );
        });
  }
}
