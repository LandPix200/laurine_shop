// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

enum Cat {
  chaussure,
  montre,
  sac,
  chapo,
  sandale,
  lunet,
}

class Article {
  String nom;
  String? description;
  double prix;
  List<String> images;
  int? reduc;
  double? rate;
  int? cmds;
  List<Color>? couleurs;
  List<int>? tailles;
  Cat cat;

  Article({
    required this.nom,
    this.description,
    required this.prix,
    required this.images,
    required this.cat,
    this.couleurs,
    this.tailles,
  }) {
    reduc = Random().nextInt(50);
    rate = Random().nextDouble() * 5;
    cmds = Random().nextInt(1000);
  }
}

List<Article> choes = [
  // LES CHAUSSURES
  Article(
    nom: "Air",
    prix: 12000,
    images: [
      "choes/air_1.png",
      "choes/air_2.png",
    ],
    cat: Cat.chaussure,
    couleurs: [
      Color.fromARGB(255, 29, 28, 28),
      Color.fromARGB(255, 2, 20, 35),
    ],
    tailles: [
      30,
      33,
      35,
      40,
      45,
    ],
  ),
  Article(
    nom: "Blazer",
    prix: 15000,
    images: [
      "choes/blazer_1.png",
      "choes/blazer_2.png",
    ],
    cat: Cat.chaussure,
    couleurs: [
      Color.fromARGB(255, 255, 250, 250),
      Color.fromARGB(255, 3, 98, 68),
    ],
    tailles: [
      30,
      33,
      35,
      40,
      45,
    ],
  ),
  Article(
    nom: "Crater",
    prix: 10000,
    images: [
      "choes/crater_1.png",
      "choes/crater_2.png",
    ],
    cat: Cat.chaussure,
    couleurs: [
      Color.fromARGB(255, 29, 28, 28),
      Color.fromARGB(255, 231, 235, 238),
    ],
    tailles: [
      30,
      33,
      35,
      40,
      45,
    ],
  ),
  Article(
    nom: "Hippie",
    prix: 12000,
    images: [
      "choes/hippie_1.png",
      "choes/hippie_2.png",
    ],
    cat: Cat.chaussure,
    couleurs: [
      Color.fromARGB(255, 141, 134, 134),
      Color.fromARGB(255, 33, 34, 35),
    ],
    tailles: [
      30,
      33,
      35,
      40,
      45,
    ],
  ),
  Article(
    nom: "Jordan",
    prix: 12000,
    images: [
      "choes/jordan_1.png",
      "choes/jordan_2.png",
    ],
    cat: Cat.chaussure,
    couleurs: [
      Color.fromARGB(255, 238, 233, 233),
      Color.fromARGB(255, 11, 115, 99),
    ],
    tailles: [
      30,
      33,
      35,
      40,
      45,
    ],
  ),
  // FIN CHAUSSURES
];

List<Article> montres = [
  // MONTRES
  Article(
    nom: "Montre en argent",
    prix: 28000,
    images: ["montres/m1.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en or",
    prix: 150000,
    images: ["montres/m2.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en high-tech",
    prix: 15000,
    images: ["montres/m3.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en or et cuir",
    prix: 35000,
    images: ["montres/m4.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en argent coloré bleu",
    prix: 18900,
    images: ["montres/m5.png"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en or simple",
    prix: 22500,
    images: ["montres/m6.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en or",
    prix: 78000,
    images: ["montres/m7.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en or",
    prix: 55000,
    images: ["montres/m8.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre en or massif",
    prix: 285000,
    images: ["montres/m9.jpg"],
    cat: Cat.montre,
  ),
  Article(
    nom: "Montre jolie",
    prix: 10000,
    images: ["montres/m10.jpg"],
    cat: Cat.montre,
  ),
];

List<Article> sacs = [
  Article(
    nom: "Sac blanc",
    prix: 5000,
    images: ["sacs/s1.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac rose en peau de serpent",
    prix: 8000,
    images: ["sacs/s2.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac tp",
    prix: 3500,
    images: ["sacs/s3.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac noir écarlate",
    prix: 8250,
    images: ["sacs/s4.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac à dos captain america",
    prix: 9700,
    images: ["sacs/s5.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac a main",
    prix: 6700,
    images: ["sacs/s6.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac Louis Vitton",
    prix: 12000,
    images: ["sacs/s7.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Ensemble de sacs",
    prix: 18000,
    images: ["sacs/s8.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac multicolor",
    prix: 9000,
    images: ["sacs/s9.jpg"],
    cat: Cat.sac,
  ),
  Article(
    nom: "Sac Super red",
    prix: 5000,
    images: ["sacs/s10.jpg"],
    cat: Cat.sac,
  ),
];

List<Article> chapos = [
  Article(
    nom: "Chapeau rouge",
    prix: 2500,
    images: ["chapo/1.jpg"],
    cat: Cat.chapo,
  ),
  Article(
    nom: "Chapeau Noir",
    prix: 2500,
    images: ["chapo/2.jpg"],
    cat: Cat.chapo,
  ),
  Article(
    nom: "Chapeau bizare vert",
    prix: 3500,
    images: ["chapo/3.jpg"],
    cat: Cat.chapo,
  ),
  Article(
    nom: "Chapeau carrelé",
    prix: 6500,
    images: ["chapo/4.jpg"],
    cat: Cat.chapo,
  ),
  Article(
    nom: "Chapeau sympa",
    prix: 1500,
    images: ["chapo/5.jpg"],
    cat: Cat.chapo,
  ),
  Article(
    nom: "Chapeau blanc cow-boy",
    prix: 4500,
    images: ["chapo/6.jpg"],
    cat: Cat.chapo,
  ),
  Article(
      nom: "Casquette cool",
      prix: 2500,
      images: ["chapo/7.jpg", "chapo/9.jpg"],
      cat: Cat.chapo,
      couleurs: [
        Color.fromARGB(255, 23, 22, 22),
        Color.fromARGB(255, 12, 106, 182),
      ]),
  Article(
    nom: "Casquette sympa",
    prix: 2500,
    images: ["chapo/8.jpg"],
    cat: Cat.chapo,
  ),
  Article(
    nom: "Super free casquette",
    prix: 3500,
    images: ["chapo/10.jpg"],
    cat: Cat.chapo,
  ),
  Article(
    nom: "Casquette ",
    prix: 1000,
    images: ["chapo/11.jpg"],
    cat: Cat.chapo,
  ),
];

List<Article> sandales = [
  Article(
    nom: "Sandale femme",
    prix: 2500,
    images: ["sandales/1.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Sandale femme",
    prix: 5000,
    images: ["sandales/2.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Sandale femme",
    prix: 3000,
    images: ["sandales/3.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Sandale homme",
    prix: 7500,
    images: ["sandales/4.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Gomme homme",
    prix: 4500,
    images: ["sandales/5.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Sandale homme",
    prix: 8500,
    images: ["sandales/6.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Gommes mixte",
    prix: 6000,
    images: ["sandales/7.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Sandale homme",
    prix: 8000,
    images: ["sandales/8.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Sandale homme",
    prix: 2500,
    images: ["sandales/9.jpg"],
    cat: Cat.sandale,
  ),
  Article(
    nom: "Good Sandale homme",
    prix: 12000,
    images: ["sandales/10.jpg"],
    cat: Cat.sandale,
  ),
];

List<Article> lunets = [
  Article(
    nom: "lunettes cool et fumées",
    prix: 6500,
    images: ["lunet/1.jpg"],
    cat: Cat.lunet,
  ),
  Article(
    nom: "lunettes design",
    prix: 3600,
    images: ["lunet/2.jpg"],
    cat: Cat.lunet,
  ),
  Article(
    nom: "lunette carré",
    prix: 6000,
    images: ["lunet/3.jpg"],
    cat: Cat.lunet,
  ),
  Article(
    nom: "lunette sympa",
    prix: 14500,
    images: ["lunet/4.jpg"],
    cat: Cat.lunet,
  ),
  Article(
    nom: "lunette medical",
    prix: 35000,
    images: ["lunet/5.jpg"],
    cat: Cat.lunet,
  ),
  Article(
    nom: "lunette sympa",
    prix: 2500,
    images: ["lunet/6.jpg"],
    cat: Cat.lunet,
  ),
  Article(
    nom: "lunette cosmetique",
    prix: 3200,
    images: ["lunet/7.jpg"],
    cat: Cat.lunet,
  ),
  Article(
    nom: "lunettes modale",
    prix: 8450,
    images: ["lunet/8.jpg"],
    cat: Cat.lunet,
  ),
];

List<Article> articles = [
  ...choes,
  ...montres,
  ...sacs,
  ...chapos,
  ...sandales,
  ...lunets
];
