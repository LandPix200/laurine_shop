// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/client.dart';
import 'package:laurine_shop/pages/articles.dart';
import 'package:laurine_shop/pages/cart.dart';
import 'package:laurine_shop/pages/home.dart';
import 'package:laurine_shop/pages/profil.dart';

class GlobalPage extends StatefulWidget {
  const GlobalPage({super.key, required this.client});

  final Client client;

  @override
  State<GlobalPage> createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  int curId = 0;

  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      HomePage(client: widget.client,),
      ArticlesPage(
        client: widget.client,
        onAddCart: (articleCart) {
          setState(() {
            widget.client.cart.add(articleCart);
          });
        },
      ),
      CartPage(
          client: widget.client,
          onDelete: (c) {
            setState(() {
              widget.client.cart.remove(c);
            });
          }),
      ProfilPage(client: widget.client),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curId],
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            curId = value;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Acceuil",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet_below_rectangle),
            label: "Articles",
          ),
          BottomNavigationBarItem(
            icon: GFIconBadge(
                counterChild: Text(
                  widget.client.cart.length.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Icon(CupertinoIcons.cart)),
            label: "Panier",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profil",
          ),
        ],

        elevation: 5,
        fixedColor: Colors.blue,
        currentIndex: curId,
        unselectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
