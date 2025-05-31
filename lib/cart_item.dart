import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_scrol/cartModel.dart';
import 'package:test_scrol/cartProvider.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    Cartprovider cartprovider = Provider.of<Cartprovider>(context);
    return Card.outlined(
      shadowColor: Colors.black12,
      color: Colors.white,
      elevation: 10,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                // height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(cart.grocery['productImg']),
                  ),
                ),
              ),
              SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cart.grocery['productTitle'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[300],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            cart.grocery['productPrice'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "  Amount: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (cart.quantity > 1) {
                                    cartprovider.reduceQuantity(cart.grocery);
                                  }
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.black45,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  cart.quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cartprovider.addCart(cart.grocery);
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 20,
            bottom: 40,
            child: GestureDetector(
              onTap: () {
                cartprovider.removeFromCart(cart.grocery);
              },
              child: Icon(
                Icons.cancel_rounded,
                size: 32,
                color: Colors.red[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
