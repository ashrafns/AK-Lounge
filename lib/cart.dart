import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_scrol/cartModel.dart';

import 'package:test_scrol/cartProvider.dart';
import 'package:test_scrol/cart_item.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Cartprovider cartProvider = Provider.of<Cartprovider>(context);
    List<CartModel> carts = cartProvider.carts.reversed.toList();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    carts.length,
                    (index) => SizedBox(
                      height: 100,
                      width: size.width,
                      child: CartItem(cart: carts[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet:
          carts.isEmpty
              ? Container(
                color: Colors.white,
                child: Center(child: Text('No Any Items On the Cart')),
              )
              : Container(
                height: size.height * 0.25,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 100),
                          Text(
                            "\SR ${cartProvider.totalCart().toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.ccVisa,
                            color: Colors.blueAccent,
                            size: 50,
                          ),
                          SizedBox(width: 50),
                          FaIcon(
                            FontAwesomeIcons.ccApplePay,
                            color: Colors.blueAccent,
                            size: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
