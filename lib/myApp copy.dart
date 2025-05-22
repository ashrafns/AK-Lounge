import 'package:flutter/material.dart';
import 'package:test_scrol/productList.dart';

/// Flutter code sample for [SliverAppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SliverAppBarExample());
  }
}

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample>
with TickerProviderStateMixin {
   late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

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
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20),
          child: Image.asset(
            "/Users/icintent/Documents/scrolltest/test_scrol/img/Lounge-r.png",
            // width: 300,
          ),
        ),
        title: Text("Delicious Menu AK Lounge"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.amber,
          tabs: <Widget>[
            Tab(
              child: InkWell(
                child: const Text("Meal"),
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
                child: const Text("Cake"),
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
                child: const Text("Tea", style: TextStyle(fontSize: 13)),
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
                child: const Text("Juice"),
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
                child: const Text("Cold Drinks"),
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
                child: const Text("Ice Coffee"),
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
                child: const Text("Hot Coffee"),
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
                child: const Text("معسلات"),
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
                child: const Text("Birthday"),
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
                child: const Text("نكهة"),
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
                child: const Text("Salat"),
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
                child: const Text("Burger"),
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
                child: const Text("Pizza"),
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Meal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                );
              },
              // meal.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Cake",
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // cake.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "ُTea",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // tea.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Juice",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...juice.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Cold Drinks",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...coldDrink.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Ice coffee",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...iceCoffee.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Hot Cofee",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...hotCoffee.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "معسلات",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...masel.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Birthday",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...birthday.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "نكهة",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...nakhat.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Salat",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...salat.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Burger",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...burger.map((item) => _buildMenuItem(item)),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(
              //     "Pizza",

              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              //   ),
              // ),
              // ...pizza.map((item) => _buildMenuItem(item)),;
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Card(
        child: ListTile(
          textColor: Colors.red[400],
          shape: Border.all(color: Colors.grey),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(40),
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
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.productSubTitle.toString(),
              textAlign: TextAlign.right,
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("${item.productPrice}\ SR"),
          ),
        ),
      ),
    );
  }
}
