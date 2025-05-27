import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_scrol/cart.dart';
import 'package:test_scrol/cartProvider.dart';
import 'package:test_scrol/cart_icon.dart';
import 'package:test_scrol/productList.dart';
import 'package:footer/footer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Delicious Menu AK Lounge';

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Hight = MediaQuery.of(context).size.height;
    final Mize = Hight / Width;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Cartprovider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,

        home: const MyStatefulWidget(),
        routes: {'/cartPage': (context) => Cart()},
      ),
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
    _tabController.dispose();
    super.dispose();
  }

  // _listenToScrollMomemnts
  void _listenToScrollMomemnts() {
    int index = 0;
    print(_scrollController.offset);

    if (_scrollController.offset < 377) {
      index = 0;
      // Meal
    } else if (_scrollController.offset > 377 &&
        _scrollController.offset < 1886) {
      index = 1;
      // Cake
    } else if (_scrollController.offset > 1886 &&
        _scrollController.offset < 3195) {
      index = 2;
      // Tea
    } else if (_scrollController.offset > 3195 &&
        _scrollController.offset < 5667) {
      index = 3;
      // Juice
    } else if (_scrollController.offset > 5667 &&
        _scrollController.offset < 7874) {
      index = 4;
      // cold drinks
    } else if (_scrollController.offset > 7874 &&
        _scrollController.offset < 9186) {
      index = 5;
      // ice cofee
    } else if (_scrollController.offset > 9186 &&
        _scrollController.offset < 11027) {
      index = 6;
      // hot cofee
    } else if (_scrollController.offset > 11027 &&
        _scrollController.offset < 15386) {
      index = 7;
      // معسلات
    } else if (_scrollController.offset > 15386 &&
        _scrollController.offset < 15745) {
      index = 8;
      // birthday
    } else if (_scrollController.offset > 15745 &&
        _scrollController.offset < 17099) {
      index = 9;
      //نكهة
    } else if (_scrollController.offset > 17099 &&
        _scrollController.offset < 17663) {
      index = 10;
      // salatt
    } else if (_scrollController.offset > 17663 &&
        _scrollController.offset < 18413) {
      index = 11;
      // burger
    } else if (_scrollController.offset > 18413) {
      index = 12;
      // pizza
    }
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0), // here the desired height
        child: AppBar(
          actionsPadding: EdgeInsets.all(30),
          flexibleSpace: Image(
            width: 100,
            height: 150,
            image: AssetImage('img/header.png'),
            fit: BoxFit.cover,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Image.asset("img/Lounge-r.png"),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              "Delicious Menu AK Lounge",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.amber,
            // listenToScrollMomemnts
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
                      477,
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
                      1986,
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
                      3295,
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
                      5767,
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
                      7974,
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
                      9286,
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
                      11127,
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
                      15486,
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
                      15845,
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
                      17199,
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
                      17763,
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
                      18513,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut, // Animation curve
                    );
                  },
                ),
              ),
            ],
          ),
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
                ...meal.map((item) => _buildMenuItem(item, context)),
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
                ...cake.map((item) => _buildMenuItem(item, context)),
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
                ...tea.map((item) => _buildMenuItem(item, context)),
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
                ...juice.map((item) => _buildMenuItem(item, context)),
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
                ...coldDrink.map((item) => _buildMenuItem(item, context)),
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
                ...iceCoffee.map((item) => _buildMenuItem(item, context)),
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
                ...hotCoffee.map((item) => _buildMenuItem(item, context)),
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
                ...masel.map((item) => _buildMenuItem(item, context)),
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
                ...birthday.map((item) => _buildMenuItem(item, context)),
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
                ...nakhat.map((item) => _buildMenuItem(item, context)),
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
                ...salat.map((item) => _buildMenuItem(item, context)),
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
                ...burger.map((item) => _buildMenuItem(item, context)),
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
                ...pizza.map((item) => _buildMenuItem(item, context)),
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
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    'https://api.whatsapp.com/send?phone=966541026606',
                                  ),
                                );
                              },
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
                              icon: FaIcon(FontAwesomeIcons.tiktok, size: 20.0),
                              color: Colors.red[300],
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    'https://www.tiktok.com/@akey.lounge?_t=ZS-8uIbX2lzLLM&_r=1',
                                  ),
                                );
                              },
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
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                    'https://www.instagram.com/akey.lounge/?igsh=djM0OWNmZjdlZGJn#',
                                  ),
                                );
                              },
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cart(),
                                  ),
                                );
                              },
                              child: CartIcon(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.phone, size: 10.0),
                    SizedBox(width: 10),
                    Text(
                      '054 102 6606',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: Color(0xFF162A49),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    FaIcon(FontAwesomeIcons.envelope, size: 15.0),
                    SizedBox(width: 10),
                    Text(
                      'info@ak1production.com',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: Color(0xFF162A49),
                      ),
                    ),
                  ],
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

Widget _buildMenuItem(item, context) {
  Cartprovider cartProvider = Provider.of<Cartprovider>(context);
  WidgetsFlutterBinding.ensureInitialized();
  initLocalStorage();
  var uuid = Uuid();
  var _key = uuid.v1();
  return FadeInUp(
    config: BaseAnimationConfig(
      delay: 1.seconds,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Card.outlined(
          key: Key(_key.toString()),
          surfaceTintColor: Colors.grey[400],
          shadowColor: Colors.black12,
          elevation: 50,
          child: ListTile(
            onTap: () async {
              Map<String, dynamic> itemMap = {
                'key': _key,
                'productImg': item.productImg,
                'productPrice': item.productPrice,
                'productSubTitle': item.productSubTitle,
                'productTitle': item.productTitle,
              };
              cartProvider.addCart(itemMap);
            },
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
            trailing: Text(
              "${item.productPrice} SR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ),
  );
}
