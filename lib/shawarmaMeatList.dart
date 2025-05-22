import 'package:flutter/material.dart';
import 'package:test_scrol/menuList.dart';

class ShawarmaMeatList extends StatefulWidget {
  final ScrollController scrollController;

  const ShawarmaMeatList(this.scrollController, {super.key});

  @override
  State<ShawarmaMeatList> createState() => _ShawarmaMeatListState(scrollController);
}

class _ShawarmaMeatListState extends State<ShawarmaMeatList> {
  final ScrollController scrollController;

  _ShawarmaMeatListState(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: shawarmaMeat.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: ListTile(
            textColor: Colors.red[400],
            shape: Border.all(color: Colors.black),
            leading: Image.asset(
              '/Users/icintent/Documents/scrolltest/test_scrol/img/ENJOY.png',
              width: 60,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                shawarmaMeat[index].productTitle.toString(),
                textAlign: TextAlign.right,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                shawarmaMeat[index].productSubTitle.toString(),
                textAlign: TextAlign.right,
              ),
            ),
            // Add other details as needed
          ),
        );
      },
    );
    
  }
}
