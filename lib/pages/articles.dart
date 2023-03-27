// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/article.dart';
import 'package:laurine_shop/classes/article_cart.dart';
import 'package:laurine_shop/logic/logic.dart';
import 'package:laurine_shop/pages/article_list.dart';

import '../classes/client.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key, this.client, required this.onAddCart});

  final Client? client;
  final Function(ArticleCart articleCart) onAddCart;

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Map<String, List<Article>> tt = {
    "Les chaussures": choes,
    "Les montres": montres,
    "Les sandales": sandales,
    "Les Lunettes": lunets,
    "Les chapeaux": chapos,
    "Les sacs": sacs,
  };

  List<MapEntry<String, List<Article>>> ttl = [];

  @override
  void initState() {
    ttl = tt.entries.toList();
    ttl.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        elevation: 0,
        searchBar: true,
        title: Text(
          "Catégories",
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: ttl.map((e) => Cat(title: e.key, art: e.value, client: widget.client!,)).toList(),
        ),
      ),
    );
  }
}

class Cat extends StatelessWidget {
  const Cat({
    Key? key,
    required this.title,
    required this.art, required this.client,
  }) : super(key: key);

  final String title;
  final List<Article> art;
  final Client client;

  @override
  Widget build(BuildContext context) {
    art.shuffle;
    return GFCard(
      padding: EdgeInsets.all(0),
      elevation: 15,
      title: GFListTile(
        titleText: title,
        icon: GFButton(
          onPressed: () {
            push(
                context,
                ArtsList(
                  ats: art,
                  title: title,
                  client: client,
                ));
          },
          text: "Voir plus",
          type: GFButtonType.outline,
          shape: GFButtonShape.pills,
          icon: Icon(CupertinoIcons.arrow_right_circle_fill),
          position: GFPosition.end,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: art.sublist(0, 4).map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "images/${e.images[0]}",
                      width: 120,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyWrap extends StatelessWidget {
  const BodyWrap({
    Key? key,
    required this.widget,
    required this.client,
    required this.addtoCart,
  }) : super(key: key);

  final ArticlesPage widget;
  final Client? client;
  final Function(ArticleCart ac) addtoCart;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      // children: widget.articles
      //     // .sublist(0, 3)
      //     .map(
      //       (e) => ArticleCard(
      //         article: e,
      //         client: client,
      //         onAddCart: (ArticleCart articleCart) {
      //           addtoCart(articleCart);
      //           GFToast.showToast(
      //               "${articleCart.article.nom} Ajouté avec succès", context);
      //         },
      //       ),
      //     )
      //     .toList(),
    );
  }
}
