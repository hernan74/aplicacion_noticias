import 'package:aplicacion_noticias/services/noticias_services.dart';
import 'package:flutter/material.dart';

import 'package:aplicacion_noticias/pages/tabs_page.dart';
import 'package:aplicacion_noticias/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NoticiasServices())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Material App',
        initialRoute: 'home',
        routes: {'home': (context) => TabPage()},
      ),
    );
  }
}
