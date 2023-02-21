import 'package:ebook_firebase/providers/home_provider.dart';
import 'package:ebook_firebase/screens/book_details_screen/book_details_screen.dart';
import 'package:ebook_firebase/screens/pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/home_screen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (_) {
      return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          return HomeScreen();
        },
      );


    },
    BookDetailsScreen.routeName: (_) {
      return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          return BookDetailsScreen();
        },
      );


    },
    PDFScreen.routeName: (_) {
      return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          return PDFScreen();
        },
      );


    },
  };
}
