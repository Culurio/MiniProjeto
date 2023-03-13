import 'package:flutter/material.dart';
import 'package:mini_projeto/models/avaliacoesLista.dart';
import 'package:mini_projeto/models/avalicao.dart';
import 'package:mini_projeto/models/tipo_avaliacao.dart';
import 'package:mini_projeto/pages/listar_registo.dart';
import 'package:mini_projeto/pages/registo_avaliacao.dart';

import 'pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

Lista_Avalicao avaliacaoLista = Lista_Avalicao();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor mycolor = const MaterialColor(0xFF227C9D, <int, Color>{
    50: Color(0xFF227C9D),
    100: Color(0xFF227C9D),
    200: Color(0xFF227C9D),
    300: Color(0xFF227C9D),
    400: Color(0xFF227C9D),
    500: Color(0xFF227C9D),
    600: Color(0xFF227C9D),
    700: Color(0xFF227C9D),
    800: Color(0xFF227C9D),
    900: Color(0xFF227C9D),
  },
  );


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Projeto',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(254, 249, 239, 1),
        primarySwatch: mycolor,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontFamily: 'Gotham',fontWeight: FontWeight.bold, fontSize: 40);
  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    ListarWidget(),
    RegistodWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    avaliacaoLista.adicionar(Avaliacao("Algebra Linear", Tipo.projeto, "12-10-2022 12:10", 5, "observacoes"));
    avaliacaoLista.adicionar(Avaliacao("LP2", Tipo.projeto, "05-02-2023 12:10", 5, "observacoes"));
    avaliacaoLista.adicionar(Avaliacao("Computação Movel", Tipo.miniTeste, "10-12-2023 11:10", 5, "Testesteste"));
    avaliacaoLista.adicionar(Avaliacao("LP2", Tipo.defesa, "12-10-2022 12:10", 3, "observacoes"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agenda IQueChumbei",
          style: TextStyle(fontFamily: 'Gotham',fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'DashBoard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listagem de\nAvaliações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Registo de Avaliações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFFFE6D73),
      ),
    );
  }
}




