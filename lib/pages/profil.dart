// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/logic/logic.dart';
import 'package:laurine_shop/pages/connexion.dart';

import '../classes/client.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key, required this.client});

  final Client client;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TextEditingController nom = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();

  @override
  void initState() {
    Client clt = widget.client;
    nom.text = clt.nom;
    phone.text = clt.phone;
    email.text = clt.email;
    mdp.text = clt.mdp;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfilHeader(widget: widget),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 20,
                    children: [
                      ProfilInput(
                        nom: nom,
                        icon: CupertinoIcons.person,
                      ),
                      ProfilInput(
                        nom: phone,
                        icon: CupertinoIcons.phone,
                      ),
                      ProfilInput(
                        nom: email,
                        icon: Icons.email,
                      ),
                      ProfilInput(
                        nom: mdp,
                        icon: Icons.security,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GFButton(
                        onPressed: () {},
                        text: "Modifier",
                        fullWidthButton: true,
                      ),
                      GFButton(
                        onPressed: () {
                          push(context, ConnexionPage());
                        },
                        text: "Se deconnecter",
                        fullWidthButton: true,
                        textColor: Colors.red,
                        type: GFButtonType.transparent,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilInput extends StatelessWidget {
  const ProfilInput({
    Key? key,
    required this.nom,
    required this.icon,
  }) : super(key: key);

  final TextEditingController nom;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: nom,
      prefix: Icon(
        icon,
        color: Colors.blue,
      ),
    );
  }
}

class ProfilHeader extends StatelessWidget {
  const ProfilHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProfilPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/login.png"),
          Text(
            widget.client.nom,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
