// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/article.dart';
import 'package:laurine_shop/classes/client.dart';
import 'package:laurine_shop/logic/logic.dart';
import 'package:laurine_shop/pages/article_detail.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.client});

  final Client client;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> ats = articles;
  late Article at;

  @override
  void initState() {
    ats.shuffle();
    at = ats.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        // ignore: prefer_const_literals_to_create_immutables
        colors: [
          Colors.blue,
          Colors.white,
          Colors.blue,
        ],
      ),
      // appBar: GFAppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Acceuil",
      //     style: Theme.of(context).textTheme.headline1,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Theme.of(context).primaryColor.withOpacity(0.7),
                  //     Theme.of(context).primaryColor.withOpacity(0.1),
                  //   ],
                  // ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  color: Colors.white,
                  child: GFCarousel(
                      autoPlay: true,
                      height: 300,
                      items: articles
                          .map((e) => Image.asset(
                                "images/${e.images[0]}",
                                height: 300,
                              ))
                          .toList()),
                ),
              ),
              Text("Les plus populaires: "),
              Wrap(
                children: ats
                    .sublist(0, 5)
                    .map(
                      (e) => GFCard(
                        // gradient: LinearGradient(
                        //     begin: Alignment.bottomRight,
                        //     end: Alignment.topLeft,
                        //     colors: [
                        //       Theme.of(context).primaryColor.withOpacity(0.5),
                        //       Colors.white,
                        //     ]),
                        title: GFListTile(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          titleText: e.nom,
                          avatar: GFAvatar(
                            shape: GFAvatarShape.standard,
                            size: 60,
                            backgroundImage: Image.asset(
                              "images/${e.images[0]}",
                              fit: BoxFit.cover,
                            ).image,
                          ),
                          subTitleText: "${e.prix} FCFA",
                          description: GFRating(
                            onChanged: (e) {},
                            value: e.rate!,
                            size: 15,
                          ),
                          icon: IconButton(
                            onPressed: () {
                              push(
                                context,
                                ArticleDetail(
                                  article: e,
                                  client: widget.client,
                                ),
                              );
                            },
                            icon: Icon(
                              CupertinoIcons.arrow_right_circle_fill,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
