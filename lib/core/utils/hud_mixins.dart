import 'package:flutter/material.dart';

mixin HudMixins {
  showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  navigateThenUntil(BuildContext context, String routename) {
    Navigator.of(context).pushNamed(routename);
  }

  navigateThenUntilArgs(BuildContext context, String routename, Object args) {
    Navigator.of(context).pushNamed(routename, arguments: args);
  }

  navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
