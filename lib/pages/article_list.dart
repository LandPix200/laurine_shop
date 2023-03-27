// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/client.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../classes/article.dart';
import '../logic/logic.dart';
import 'article_detail.dart';

class ArtsList extends StatefulWidget {
  const ArtsList({super.key, required this.ats, required this.title, required this.client});

  final List<Article> ats;
  final String title;
  final Client client;

  @override
  State<ArtsList> createState() => _ArtsListState();
}

class _ArtsListState extends State<ArtsList> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: GFAppBar(
        title: GFListTile(
          titleText: widget.title,
        ),
      ),
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
              Wrap(
                children: widget.ats
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
