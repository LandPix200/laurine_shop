// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/logic/logic.dart';
import 'package:laurine_shop/pages/connexion.dart';
import 'package:laurine_shop/pages/global.dart';
import 'package:laurine_shop/widgets/inputs.dart';

import '../classes/client.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController nom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();
  TextEditingController cmdp = TextEditingController();
  TextEditingController phone = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "S'inscrire",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("images/signin.png"),
                    ),
                    LaInput(
                      controller: nom,
                      text: "Votre nom",
                      type: GfFormFieldType.name,
                    ),
                    LaInput(
                      controller: phone,
                      text: "Votre numéro de téléphone",
                      type: GfFormFieldType.phone,
                    ),
                    LaInput(
                      controller: email,
                      text: "Votre adresse email",
                      type: GfFormFieldType.email,
                    ),
                    LaInput(
                      controller: mdp,
                      text: "Votre mot de passe",
                      type: GfFormFieldType.password,
                    ),
                    LaInput(
                      controller: cmdp,
                      text: "Confirmation",
                      type: GfFormFieldType.password,
                    ),
                    GFButtonBar(spacing: 30, children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: GFButton(
                          onPressed: () {
                            final valideForm = formKey.currentState!.validate();

                            if (valideForm) {
                              if (mdp.text != cmdp.text) {
                                GFToast.showToast(
                                    "Les mots de passe ne sont pas identiques",
                                    context);
                                return;
                              }

                              try {
                                Client client = Client(
                                  nom: nom.text,
                                  phone: phone.text,
                                  mdp: mdp.text,
                                  email: email.text,
                                );
                                pushRemove(context, GlobalPage(client: client));
                              } catch (e) {
                                GFToast.showToast(
                                    "Un problème est survenu durant l'inscription",
                                    context);
                              }
                            }
                          },
                          text: "S'inscrire",
                          type: GFButtonType.solid,
                          fullWidthButton: true,
                          shape: GFButtonShape.pills,
                          size: 50,
                          color: Theme.of(context).primaryColor,
                          hoverElevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 35),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("J'ai déja un compte."),
                          GFButton(
                            onPressed: () {
                              push(context, ConnexionPage());
                            },
                            text: "Se connecter",
                            type: GFButtonType.transparent,
                            // color: Colors.red,
                            hoverElevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
