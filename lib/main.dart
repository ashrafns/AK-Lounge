import 'package:flutter/material.dart';
import 'package:test_scrol/productList.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Delicious Menu AK Lounge';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,

      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_listenToScrollMomemnts);
    super.initState();
    _tabController = TabController(length: 13, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _listenToScrollMomemnts() {
    int index = 0;
    print(_scrollController.offset);

    if (_scrollController.offset < 347) {
      index = 0;
    } else if (_scrollController.offset > 347 &&
        _scrollController.offset < 1619) {
      index = 1;
    } else if (_scrollController.offset > 1619 &&
        _scrollController.offset < 2761) {
      index = 2;
    } else if (_scrollController.offset > 2761 &&
        _scrollController.offset < 4763) {
      index = 3;
    } else if (_scrollController.offset > 4763 &&
        _scrollController.offset < 6768) {
      index = 4;
    } else if (_scrollController.offset > 6768 &&
        _scrollController.offset < 7914) {
      index = 5;
    } else if (_scrollController.offset > 7914 &&
        _scrollController.offset < 9550) {
      index = 6;
    } else if (_scrollController.offset > 9550 &&
        _scrollController.offset < 13165) {
      index = 7;
    } else if (_scrollController.offset > 13165 &&
        _scrollController.offset < 13459) {
      index = 8;
    } else if (_scrollController.offset > 13459 &&
        _scrollController.offset < 14603) {
      index = 9;
    } else if (_scrollController.offset > 14603 &&
        _scrollController.offset < 15141) {
      index = 10;
    } else if (_scrollController.offset > 15141 &&
        _scrollController.offset < 15800) {
      index = 11;
    } else if (_scrollController.offset > 15800) {
      index = 12;
    }
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20),
          child: Image.asset("img/Lounge-r.png", width: 300),
        ),
        title: Text(
          "Delicious Menu AK Lounge",
          style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.amber,
          tabs: <Widget>[
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Meal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    0, // Scroll to the top
                    duration: const Duration(
                      milliseconds: 500,
                    ), // Animation duration
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Cake",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    402,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Tea",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    1670,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Juice",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    2817,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Cold Drinks",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    4817,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Ice Coffee",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    6818,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Hot Coffee",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    7965,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "معسلات",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    9600,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Birthday",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    13215,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "نكهة",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    13511,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Salat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    14658,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Burger",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    15195,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
            Tab(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  child: const Text(
                    "Pizza",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  _scrollController.animateTo(
                    15853,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut, // Animation curve
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Meal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...meal.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Cake",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...cake.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "ُTea",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...tea.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Juice",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...juice.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Cold Drinks",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...coldDrink.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Ice coffee",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...iceCoffee.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Hot Cofee",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...hotCoffee.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "معسلات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...masel.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Birthday",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...birthday.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "نكهة",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...nakhat.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Salat",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...salat.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Burger",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...burger.map((item) => _buildMenuItem(item)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30,
                  ),
                  child: Text(
                    "Pizza",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                ...pizza.map((item) => _buildMenuItem(item)),
              ],
            ),
          ),
          Footer(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 45.0,
                        width: 45.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ), // half of height and width of Image
                            ),
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.whatsapp,
                                size: 20.0,
                              ),
                              color: Colors.red[300],
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45.0,
                        width: 45.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ), // half of height and width of Image
                            ),
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.instagram,
                                size: 20.0,
                              ),
                              color: Colors.red[300],
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45.0,
                        width: 45.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ), // half of height and width of Image
                            ),
                            child: IconButton(
                              icon: Icon(Icons.call, size: 20.0),
                              color: Colors.red[300],
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Copyright ©2020, All Rights Reserved.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Color(0xFF162A49),
                  ),
                ),
                Text(
                  'Powered by Nexsport',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Color(0xFF162A49),
                  ),
                ),
              ],
            ),
          ),

          // floatingActionButton:
          // new FloatingActionButton(
          //   elevation: 10.0,
          //   child: new Icon(Icons.chat),
          //   backgroundColor: Color(0xFF162A49),
          //   onPressed: () {},
          // );
        ],
      ),
    );
  }
}

Widget _buildMenuItem(item) {
  return FadeInUp(
    config: BaseAnimationConfig(
      delay: 1.seconds,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Card(
          surfaceTintColor: Colors.grey[400],
          shadowColor: Colors.black12,
          elevation: 50,
          child: ListTile(
            textColor: Colors.red[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                item.productImg.toString(), // Use a relative path
                width: 100,
              ),
            ),

            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.productTitle.toString(),
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.productSubTitle.toString(),
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "${item.productPrice}\ SR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
