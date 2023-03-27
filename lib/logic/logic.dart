// ignore_for_file: prefer_const_constructors, unused_result

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:laurine_shop/classes/client.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher_string.dart';

void pushRemove(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

void push(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

void sendEmail(BuildContext context, Client client) async {
  String username = 'landrysimo99@gmail.com';
  String password = '2003Stilllikedressingup@';

  String pbs = '';
  String text = '';

  for (var element in client.cart) {
    text += "\n${element.article.nom}";
  }

  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.

  // Create our message.
  final message = Message()
    ..from = Address(username, 'Landry simo')
    ..recipients.add('landrysimo99@gmail.com')
    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = "${client.nom} a fait des achats :: 😀 :: ${DateTime.now()}"
    ..text = text;

  try {
    final sendReport = await send(message, smtpServer);
    // ignore: use_build_context_synchronously, 
    await showAlertDialog(
        context: context,
        title: "Succes",
        message: sendReport.messageSendingStart.toString());
  } on MailerException catch (e) {
    for (var p in e.problems) {
      pbs += "\n-> Problem: ${p.code}: ${p.msg}";
      await showAlertDialog(
          context: context,
          title: "Probleme lors de l'envoi de l'email",
          message: pbs);
    }
  }
}

Future<bool> sendChoice(Client client, double total) async {
  var text = """
Bonjour Mme Laurine.
Je me nomme ${client.nom},
Numéro de téléphone: ${client.phone},
Adresse email: ${client.email},

Je viens d'effectuer un achat sur votre application et voici en detail ce dont j'ai besoin\n
""";

  for (var e in client.cart) {
    text += "-> ${e.qtte} ${e.article.nom} à ${e.qtte * e.article.prix} FCFA\n";
  }

  text += "\nCe qui fera un total de $total FCFA";

  var t = await launchUrlString(
    "https://api.whatsapp.com/send?phone=+237698249222&text=$text",
    mode: LaunchMode.externalApplication,
  );

  return t;
}
