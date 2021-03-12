import 'package:flutter/material.dart';

import 'package:aplicacion_noticias/model/noticias_models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> lista;

  const ListaNoticias(this.lista);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int i) {
          return _crearItemNoticia(lista[i]);
        });
  }

  Widget _crearItemNoticia(Article articulo) {
    return Card(
      child: Column(
        children: [
          if (articulo.urlToImage == null)
            Image(image: AssetImage('assets/no-image.png'))
          else
            FadeInImage(
                placeholder: AssetImage('assets/cargando.gif'),
                image: NetworkImage(articulo.urlToImage)),
          ListTile(
            title: Text(
              articulo.title,
            ),
            subtitle: articulo.description == null
                ? Text('')
                : Text(articulo.description),
          ),
        ],
      ),
    );
  }
}
