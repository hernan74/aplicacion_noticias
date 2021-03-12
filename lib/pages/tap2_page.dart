import 'package:aplicacion_noticias/model/Categoria.dart';
import 'package:aplicacion_noticias/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/noticias_services.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final noticasServices = Provider.of<NoticiasServices>(context);
    noticasServices.getNoticiasPorCategoria('business');
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                child: _ListaCategoria(noticasServices),
                height: 90,
              ),
              Expanded(
                  child: ListaNoticias(noticasServices.noticiasPorCategoria,
                      noticasServices.cargando))
            ],
          ),
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListaCategoria extends StatelessWidget {
  final NoticiasServices services;
  const _ListaCategoria(this.services);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: services.categoria.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      services
                          .getNoticiasPorCategoria(services.categoria[i].name);
                    },
                    child: _crearIconoCategoria(services.categoria[i])),
                Text(services.categoria[i].name)
              ],
            ),
          );
        });
  }

  Widget _crearIconoCategoria(Categoria cat) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Icon(
        cat.icon,
        color: Colors.black54,
      ),
    );
  }
}
