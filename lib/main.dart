import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home_screen.dart';
import 'Store/myStore.dart';

void main() {
  return runApp(ChangeNotifierProvider(
    create: (context) {
      return MyStore();
    },
    child: MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}
