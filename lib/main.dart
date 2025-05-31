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
import 'package:flutter_hooks/flutter_hooks.dart';
import "package:hovering/hovering.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Delicious Menu AK Lounge';

  @override
  Widget build(BuildContext context) {
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

    if (_scrollController.offset < 340) {
      index = 0;
      // Meal
    } else if (_scrollController.offset > 340 &&
        _scrollController.offset < 1690) {
      index = 1;
      // Cake
    } else if (_scrollController.offset > 1690 &&
        _scrollController.offset < 2911) {
      index = 2;
      // Tea
    } else if (_scrollController.offset > 2911 &&
        _scrollController.offset < 5025) {
      index = 3;
      // Juice
    } else if (_scrollController.offset > 5025 &&
        _scrollController.offset < 7147) {
      index = 4;
      // cold drinks
    } else if (_scrollController.offset > 7147 &&
        _scrollController.offset < 8368) {
      index = 5;
      // ice cofee
    } else if (_scrollController.offset > 8368 &&
        _scrollController.offset < 10096) {
      index = 6;
      // hot cofee
    } else if (_scrollController.offset > 10096 &&
        _scrollController.offset < 13879) {
      index = 7;
      // معسلات
    } else if (_scrollController.offset > 13879 &&
        _scrollController.offset < 14202) {
      index = 8;
      // birthday
    } else if (_scrollController.offset > 14202 &&
        _scrollController.offset < 15424) {
      index = 9;
      //نكهة
    } else if (_scrollController.offset > 15424 &&
        _scrollController.offset < 16004) {
      index = 10;
      // salat
    } else if (_scrollController.offset > 16004 &&
        _scrollController.offset < 16716) {
      index = 11;
      // burger
    } else if (_scrollController.offset > 16716) {
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
      appBar: AppBar(
        backgroundColor: Colors.white,

        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, bottom: 20),
          child: Image.asset("img/Lounge-r.png"),
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
                    195, // Scroll to the top
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
                    633,
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
                    1982,
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
                    3202,
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
                    5319,
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
                    7437,
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
                    8657,
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
                    10392,
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
                    14172,
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
                    14499,
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
                    15718,
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
                    16299,
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
                    17009,
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
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: 250,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      "Delicious Menu AK Lounge",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    background: Image.asset('img/header.png', fit: BoxFit.fill),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Meal",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(meal[index], context);
                  }, childCount: meal.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Cacke",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(cake[index], context);
                  }, childCount: cake.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Tea",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(tea[index], context);
                  }, childCount: tea.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Juice",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(juice[index], context);
                  }, childCount: juice.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Cold Drinks",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(coldDrink[index], context);
                  }, childCount: coldDrink.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Ice Coffee",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(iceCoffee[index], context);
                  }, childCount: iceCoffee.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Hot Coffee",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(hotCoffee[index], context);
                  }, childCount: hotCoffee.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "معسلات",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(masel[index], context);
                  }, childCount: masel.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Birthday",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(birthday[index], context);
                  }, childCount: birthday.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "نكهة",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(nakhat[index], context);
                  }, childCount: nakhat.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Salat",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(salat[index], context);
                  }, childCount: salat.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Burger",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(burger[index], context);
                  }, childCount: burger.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20,
                    ),
                    child: Text(
                      "Pizza",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildMenuItem(pizza[index], context);
                  }, childCount: pizza.length),
                ),
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,

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
                            color: Colors.white,

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
        ],
      ),
    );
  }
}

Widget _buildMenuItem(item, context) {
  double screenWidth = MediaQuery.of(context).size.width;
  Cartprovider cartProvider = Provider.of<Cartprovider>(context);
  WidgetsFlutterBinding.ensureInitialized();
  initLocalStorage();
  var uuid = Uuid();
  var _key = uuid.v1();
  return FadeInUp(
    config: BaseAnimationConfig(
      delay: 1.seconds,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: GestureDetector(
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
          child: HoverAnimatedContainer(
            cursor: SystemMouseCursors.click,
            hoverColor: Colors.orange[100],
            child: Card.outlined(
              color: Colors.white,
              key: Key(_key.toString()),
              surfaceTintColor: Colors.grey[400],
              shadowColor: Colors.black12,
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(item.productImg.toString()),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        item.productTitle.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.red[300],
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        item.productSubTitle.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[300],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "${item.productPrice} SR",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
