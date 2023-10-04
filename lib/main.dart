import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Page1.dart';
import 'Provider/Provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Providerr(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Page1(),
      ),
    );
  }
}