import 'package:flutter/material.dart';

Future<bool?> confirmationModal(
        {required BuildContext context, required String message}) =>
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(message),
              actions: [
                TextButton(
                    child: Text("Cancel", style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    }),
                TextButton(
                    child: Text("Yes", style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }),
              ],
            ));
