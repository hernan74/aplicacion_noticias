import 'package:aplicacion_noticias/model/Categoria.dart';
import 'package:aplicacion_noticias/model/noticias_models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NoticiasServices with ChangeNotifier {
  List<Article> headLines = [];
  List<Article> noticiasPorCategoria = [];
  bool cargando = true;

  List<Categoria> categoria = [
    Categoria(FontAwesomeIcons.building, 'business'),
    Categoria(FontAwesomeIcons.tv, 'entertainment'),
    Categoria(FontAwesomeIcons.addressCard, 'general'),
    Categoria(FontAwesomeIcons.headSideVirus, 'health'),
    Categoria(FontAwesomeIcons.vials, 'science'),
    Categoria(FontAwesomeIcons.volleyballBall, 'sports'),
    Categoria(FontAwesomeIcons.memory, 'technology'),
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
    cargando = true;
    notifyListeners();
    final url =
        Uri.parse('$_urlNewsApi$_urlHeadLines?country=$_pais&apiKey=$_apiKey');
    final respuesta = await http.get(url);
    final noticiasResponse = noticiasModelFromJson(respuesta.body);

    this.headLines.addAll(noticiasResponse.articles);
    cargando = false;
    notifyListeners();
  }

  getNoticiasPorCategoria(String categoria) async {
    cargando = true;
    notifyListeners();
    final url = Uri.parse(
        '$_urlNewsApi$_urlHeadLines?country=$_pais&apiKey=$_apiKey&category=$categoria');
    final respuesta = await http.get(url);
    final noticiasResponse = noticiasModelFromJson(respuesta.body);
    this.noticiasPorCategoria.clear();
    this.noticiasPorCategoria.addAll(noticiasResponse.articles);
    print(noticiasPorCategoria);
    cargando = false;
    notifyListeners();
  }
}
