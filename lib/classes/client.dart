import 'package:laurine_shop/classes/article.dart';
import 'package:laurine_shop/classes/article_cart.dart';

class Client {
  String nom;
  String phone;
  String mdp;
  String email;

  List<ArticleCart> cart = [];

  Client({
    required this.nom,
    required this.phone,
    required this.mdp,
    required this.email,
  });

  bool inCart(Article article) {
    for (ArticleCart e in cart) {
      if (e.article == article) {
        return true;
      }
    }

    return false;
  }
}

List<Client> clients = [
  Client(
      nom: "laurine",
      phone: "+237654149304",
      mdp: "laurine",
      email: "laurine@gmail.com"),
  Client(
      nom: "Talla",
      phone: "+237654149304",
      mdp: "talla",
      email: "landrysimo99@gmail.com"),
  Client(
      nom: "Landry",
      phone: "+237654149304",
      mdp: "landry",
      email: "landrysimo99@gmail.com"),
  Client(
      nom: "Brunel",
      phone: "+237654149304",
      mdp: "brunel",
      email: "landrysimo99@gmail.com"),
];
