// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, must_be_immutable

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/article_cart.dart';
import 'package:laurine_shop/logic/logic.dart';

import '../classes/client.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.client, required this.onDelete});

  final Client client;
  final Function(ArticleCart articleCart) onDelete;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double total = 0;

  @override
  void initState() {
    total = 0;
    for (var element in widget.client.cart) {
      total += element.qtte * element.article.prix;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Client clt = widget.client;

    return Scaffold(
      appBar: GFAppBar(
        leading: Icon(Icons.shopping_cart),
        elevation: 0,
        title: Text(
          "Mon panier",
        ),
      ),
      body: clt.cart.isNotEmpty
          ? SingleChildScrollView(
              child: Center(
                child: Wrap(
                    children: clt.cart.map((e) {
                  TextEditingController ctr = TextEditingController();
                  ctr.text = e.qtte.toString();

                  return ArticleCartElement(
                    onChangeNum: (n) {
                      setState(() {
                        total = 0;
                        for (var element in widget.client.cart) {
                          total += element.qtte * element.article.prix;
                        }
                      });
                    },
                    e: e,
                    onDelete: (c) {
                      setState(() {
                        widget.onDelete(c);
                        total = 0;
                        for (var element in widget.client.cart) {
                          total += element.qtte * element.article.prix;
                        }
                      });
                    },
                  );
                }).toList()),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "😶\n\nTon panier est vide !",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
      floatingActionButton: clt.cart.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () async {
              sendChoice(widget.client,  total);
                OkCancelResult r = await showOkAlertDialog(
                  context: context,
                  title: "Votre achat a été réalisé avec succes",
                );
                

                if (r == OkCancelResult.ok) {
                  setState(() {
                    widget.client.cart.clear();
                    total = 0;
                  });
                }
              },
              label: Text("Acheter pour $total FCFA"),
              icon: Icon(
                CupertinoIcons.checkmark_alt_circle_fill,
              ),
            )
          : null,
    );
  }
}

class ArticleCartElement extends StatefulWidget {
  const ArticleCartElement({
    super.key,
    required this.e,
    required this.onDelete,
    required this.onChangeNum,
  });

  final ArticleCart e;
  final Function(ArticleCart) onDelete;
  final Function(int n) onChangeNum;

  @override
  State<ArticleCartElement> createState() => _ArticleCartElementState();
}

class _ArticleCartElementState extends State<ArticleCartElement> {
  TextEditingController ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ctr.text = widget.e.qtte.toString();

    return GFListTile(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      avatar: Image.asset(
        "images/${widget.e.article.images[0]}",
        width: 100,
        fit: BoxFit.cover,
      ),
      titleText: "${widget.e.article.nom}\n${widget.e.article.prix} FCFA",
      subTitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoTextField(
              padding: EdgeInsets.symmetric(horizontal: 20),
              controller: ctr,
              readOnly: true,
              prefix: widget.e.qtte > 1
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.e.qtte > 1) {
                            widget.e.qtte--;
                            widget.onChangeNum(widget.e.qtte);
                          }
                        });
                      },
                      icon: Icon(CupertinoIcons.minus_circle),
                    )
                  : null,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    widget.e.qtte++;
                    widget.onChangeNum(widget.e.qtte);
                  });
                },
                icon: Icon(CupertinoIcons.add_circled),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CupertinoButton(
              padding: EdgeInsets.all(0),
              color: Colors.blue,
              child: Icon(
                CupertinoIcons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                widget.onDelete(widget.e);
              }),
        ],
      ),
      // description: widget.e.article.description != null
      //     ? Text(widget.e.article.description!)
      //     : null,
    );
  }
}
