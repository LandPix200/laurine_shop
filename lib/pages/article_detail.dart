// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/article_cart.dart';
import 'package:laurine_shop/logic/logic.dart';
import 'package:laurine_shop/pages/cart.dart';

import '../classes/article.dart';
import '../classes/client.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({super.key, required this.article, required this.client});

  final Article article;
  final Client client;

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    Article a = widget.article;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Center(
          child: SingleChildScrollView(
            child: GFCard(
              title: GFListTile(
                avatar: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(CupertinoIcons.arrow_left_circle_fill)),
                titleText: widget.article.nom,
                subTitleText: "${a.prix} FCFA",
                description: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${a.cmds} Commandes"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GFRating(
                          size: 20,
                          onChanged: (e) {
                            setState(() {
                              a.rate = e;
                            });
                          },
                          value: a.rate!,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          a.rate!.toStringAsFixed(1),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: a.rate! > 3 ? Colors.blue : Colors.black,
                              ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          a.rate! > 3 ? "🤩" : "😭",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              padding: EdgeInsets.all(0),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(hei)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (a.images.length == 1)
                        Image.asset(
                          "images/${a.images[0]}",
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                        ),
                      if (a.images.length > 1)
                        GFCarousel(
                            hasPagination: true,
                            items: a.images.map((e) {
                              return Image.asset(
                                "images/$e",
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                              );
                            }).toList()),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  if (a.description != null)
                    Text(
                      a.description!,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  // Text(""),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (a.couleurs != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: a.couleurs!
                              .map((e) => Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: e,
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      SizedBox(
                        height: 15,
                      ),
                      if (a.tailles != null)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: a.tailles!
                                .map((e) => Container(
                                      width: 25,
                                      height: 25,
                                      // ignore: sort_child_properties_last
                                      child: Center(
                                        child: Text(
                                          e.toString(),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ))
                                .toList()),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  if (!widget.client.inCart(a))
                    GFButton(
                      shape: GFButtonShape.pills,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      icon: Icon(CupertinoIcons.cart_badge_plus),
                      size: 50,
                      onPressed: () {
                        setState(() {
                          GFToast.showToast("Article ajouté", context);
                          widget.client.cart.add(ArticleCart(article: a));
                        });
                      },
                      text: "Ajouter au panier",
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                    ),

                  if (widget.client.inCart(a))
                    GFButton(
                      shape: GFButtonShape.pills,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      icon: Icon(CupertinoIcons.cart),
                      size: 50,
                      onPressed: () {
                        push(context, CartPage(onDelete: (e) {}, client: widget.client,));
                      },
                      text: "Voir le panier",
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  GFButton(
                    color: Colors.pinkAccent,
                    shape: GFButtonShape.pills,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    icon: Icon(CupertinoIcons.heart),
                    size: 50,
                    onPressed: () {},
                    text: "Ajouter aux favoris",
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
