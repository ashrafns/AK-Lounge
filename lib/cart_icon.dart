import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_scrol/cart.dart';
import 'package:test_scrol/cartProvider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Cartprovider cartProvider = Provider.of<Cartprovider>(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Card(
            child: FaIcon(
              FontAwesomeIcons.cartShopping,
              color: Colors.red[300],
              size: 20,
            ),
          ),
        ),
        cartProvider.carts.isNotEmpty
            ? Positioned(
              right: -4,
              top: -15,
              child: GestureDetector(
                
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    cartProvider.carts.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
            : Container(),
      ],
    );
  }
}
