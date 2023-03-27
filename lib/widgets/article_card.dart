// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/article.dart';
import 'package:laurine_shop/classes/article_cart.dart';
import 'package:laurine_shop/classes/client.dart';
import 'package:laurine_shop/logic/logic.dart';
import 'package:laurine_shop/pages/article_detail.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard(
      {super.key,
      required this.article,
      required this.client,
      required this.onAddCart});

  final Article article;
  final Client? client;
  final Function(ArticleCart articleCart) onAddCart;

  @override
  Widget build(BuildContext context) {
    bool inCart = false;
    for (ArticleCart e in client!.cart) {
      if (e.article == article) {
        inCart = true;
      }
    }

    return InkWell(
      onTap: () {
        push(
          context,
          ArticleDetail(
            article: article,
            client: client!,
          ),
        );
      },
      child: Card(
        elevation: 0,
        // color: Colors.white,
        child: Column(
          children: [
            GFImageOverlay(
              // ignore: sort_child_properties_last
              child: Text(
                "-${article.reduc}%",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 12,
                      backgroundColor: Colors.blueAccent,
                      color: Colors.white,
                    ),
              ),
              color: Colors.white,
              colorFilter: null,
              width: 150,
              height: 150,
              boxFit: BoxFit.cover,
              image: Image.asset("images/${article.images[0]}").image,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${article.prix} FCFA",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 18,
                      ),
                ),
                Text(
                  "${article.cmds} commandes",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFRating(
                      onChanged: (e) {},
                      value: article.rate!,
                      size: 18,
                    ),
                    IconButton(
                      onPressed: () {
                        if (!inCart) {
                          onAddCart(ArticleCart(article: article, qtte: 1));
                        }
                      },
                      icon: Icon(
                        !inCart
                            ? CupertinoIcons.cart_badge_plus
                            : CupertinoIcons.check_mark,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
