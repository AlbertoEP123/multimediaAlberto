import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/historiasdestacadas.dart';

class PerfilBody extends StatefulWidget {
  @override
  _PerfilBodyState createState() => _PerfilBodyState();
}

class _PerfilBodyState extends State<PerfilBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  List<historiasdestacadas> historias = [
    historiasdestacadas(
        text: 'Nuevo', imagen: 'assets/h5.png', width: 50, height: 60),
    historiasdestacadas(
        text: 'Destacadas..', imagen: 'assets/h1.png', width: 60, height: 60),
    historiasdestacadas(
        text: 'gatetes', imagen: 'assets/h1.png', width: 60, height: 60),
    historiasdestacadas(
        text: '2017 Euskadi', imagen: 'assets/h2.png', width: 60, height: 60),
    historiasdestacadas(
        text: 'Historias 5', imagen: 'assets/h6.png', width: 60, height: 60),
    historiasdestacadas(
        text: 'Historias 6', imagen: 'assets/h7.png', width: 60, height: 60),
    historiasdestacadas(
        text: 'Historias 7', imagen: 'assets/h8.png', width: 60, height: 60),
    historiasdestacadas(
        text: 'Historias 8', imagen: 'assets/h9.png', width: 60, height: 60),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: Scaffold(
      body: Container(
        color: Colors.white, // Fondo blanco
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biografía',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Editor en @Xataka. Me gusta la tecnología y escribir sobre ella, la música y las series, el cine y los videojuegos. Phone: Samsung Galaxy S7',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'twitter.com/Yubal_FM',
                    style: TextStyle(
                      color: Color.fromARGB(255, 28, 25, 210),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            

            // Scroll horizontal de Historias Destacadas
            Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Row(
                  children: List.generate(
                    historias.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: historias[index],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey.shade400),
              ),
              child: TabBar(
                unselectedLabelColor: Colors.grey.shade400,
                labelColor: Colors.black,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.black),
                ),
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.border_all_sharp,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.list,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_box_outlined,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_box_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            // Contenido de las pestañas (TabBarView).
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Contenido de la primera pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      children: [
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                        Image.asset('assets/5.jpeg'),
                        Image.asset('assets/6.jpg'),
                        Image.asset('assets/7.jpg'),
                        Image.asset('assets/8.jpg'),
                        Image.asset('assets/9.jpg'),
                        Image.asset('assets/10.jpg'),
                        Image.asset('assets/11.jpg'),
                        Image.asset('assets/12.jpg'),
                        Image.asset('assets/13.jpg'),
                      ],
                    ),
                  ),
                  // Contenido de la segunda pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      children: [
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                        Image.asset('assets/5.jpeg'),
                        Image.asset('assets/8.jpg'),
                        Image.asset('assets/9.jpg'),
                        Image.asset('assets/6.jpg'),
                        Image.asset('assets/13.jpg'),
                        Image.asset('assets/10.jpg'),
                        Image.asset('assets/11.jpg'),
                        Image.asset('assets/12.jpg'),
                        Image.asset('assets/7.jpg'),
                      ],
                    ),
                  ),

                  // Contenido de la tercera pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      children: [
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                        Image.asset('assets/5.jpeg'),
                        Image.asset('assets/6.jpg'),
                        Image.asset('assets/7.jpg'),
                        Image.asset('assets/8.jpg'),
                        Image.asset('assets/9.jpg'),
                        Image.asset('assets/10.jpg'),
                        Image.asset('assets/11.jpg'),
                        Image.asset('assets/12.jpg'),
                        Image.asset('assets/13.jpg'),
                      ],
                    ),
                  ),

                  // Contenido de la cuarta pestaña
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      children: [
                        Image.asset('assets/1.png'),
                        Image.asset('assets/2.png'),
                        Image.asset('assets/3.png'),
                        Image.asset('assets/5.jpeg'),
                        Image.asset('assets/6.jpg'),
                        Image.asset('assets/7.jpg'),
                        Image.asset('assets/8.jpg'),
                        Image.asset('assets/9.jpg'),
                        Image.asset('assets/10.jpg'),
                        Image.asset('assets/11.jpg'),
                        Image.asset('assets/12.jpg'),
                        Image.asset('assets/13.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
