// ignore_for_file: prefer_const_constructors, must_be_immutable, use_build_context_synchronously

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:laurine_shop/classes/client.dart';
import 'package:laurine_shop/pages/global.dart';
import 'package:laurine_shop/pages/inscription.dart';

import '../logic/logic.dart';
import '../widgets/inputs.dart';

class ConnexionPage extends StatelessWidget {
  ConnexionPage({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget error = SizedBox();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/shop.png",
                  width: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Bienvenue sur Laurine\nSe connecter",
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                // Image.asset(
                //   "images/login.png",
                //   width: 200,
                // ),

                //
                Column(
                  children: [
                    LaInput(
                      controller: email,
                      text: "Adresse email",
                      type: GfFormFieldType.email,
                    ),
                    LaInput(
                      controller: mdp,
                      text: "Mot de passe",
                      obscure: true,
                      prefixIcon: Icons.security,
                      type: GfFormFieldType.password,
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: GFButtonBar(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 0,
                          children: [
                            GFButton(
                              onPressed: () async {
                                final valideForm =
                                    formKey.currentState!.validate();
                                if (valideForm) {
                                  try {
                                    Client client = clients.firstWhere(
                                        (element) =>
                                            (element.email == email.text &&
                                                element.mdp == mdp.text));
                                    pushRemove(
                                      context,
                                      GlobalPage(client: client),
                                    );
                                  } catch (e) {
                                    var r = await showOkCancelAlertDialog(
                                      context: context,
                                      title: "Erreur de connexion",
                                      message:
                                          "Il se pourrait que vos informations ne soient pas valides",
                                      okLabel: "S'INSCRIRE",
                                      cancelLabel: "ANNULER",
                                    );

                                    if (r == OkCancelResult.ok) {
                                      push(context, InscriptionPage());
                                    }
                                  }
                                }
                              },
                              text: "Se connecter",
                              type: GFButtonType.solid,
                              color: Theme.of(context).primaryColor,
                              hoverElevation: 0,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              shape: GFButtonShape.pills,
                              fullWidthButton: true,
                              size: 50,
                            ),
                            GFButton(
                              onPressed: () {
                                push(context, InscriptionPage());
                              },
                              text: "Mot de passe oublié ?",
                              type: GFButtonType.transparent,
                              // color: Colors.red,
                              hoverElevation: 0,
                              padding: EdgeInsets.symmetric(horizontal: 35),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Je suis nouveau sur Laurine."),
                                GFButton(
                                  type: GFButtonType.transparent,
                                  onPressed: () {
                                    push(context, InscriptionPage());
                                  },
                                  text: "S'inscrire",
                                )
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
