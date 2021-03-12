import 'package:aplicacion_noticias/model/Categoria.dart';
import 'package:aplicacion_noticias/model/noticias_models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NoticiasServices with ChangeNotifier {
  List<Article> headLines = [];

  List<Categoria> categoria = [
    Categoria(FontAwesomeIcons.building, 'Negocio'),
    Categoria(FontAwesomeIcons.tv, 'Entretenimiento'),
    Categoria(FontAwesomeIcons.addressCard, 'General'),
    Categoria(FontAwesomeIcons.headSideVirus, 'Vida'),
    Categoria(FontAwesomeIcons.vials, 'Ciencia'),
    Categoria(FontAwesomeIcons.volleyballBall, 'Deportes'),
    Categoria(FontAwesomeIcons.memory, 'Tecnologia'),
  ];

  final String _urlNewsApi = 'https://newsapi.org/v2';
  final String _urlHeadLines = '/top-headlines';
  final String _apiKey = '60cb5f1d64be4e4cb185d6f86e4300db';
  final String _pais = 'ar';
  NoticiasServices() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    //  final url = Uri.https(Uri.decodeComponent(_urlNewsApi), _urlHeadLines,
    //    {'apiKey': _apiKey, 'country': _pais});
    final url =
        Uri.parse('$_urlNewsApi$_urlHeadLines?country=$_pais&apiKey=$_apiKey');
    final respuesta = await http.get(url);
    final noticiasResponse = noticiasModelFromJson(respuesta.body);

    this.headLines.addAll(noticiasResponse.articles);
    print(headLines);
    notifyListeners();
  }
}
