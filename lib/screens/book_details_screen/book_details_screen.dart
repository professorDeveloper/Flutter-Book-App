import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/book.dart';
import '../../utils/styles.dart';
import 'components/book_details_header.dart';
import 'components/bottom_sheet.dart';

class BookDetailsScreen extends StatelessWidget {
  static const String routeName = '/book-details';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Book _book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details', style: appBarTitle()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
          splashRadius: 22,
        ),
        centerTitle: true,
      ),
      body:Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                BookDetailsHeader(book: _book),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: theme.textTheme.headline5,
                      ),
                      SizedBox(height: 15),
                      Text(_book.description!, style: bookDescription()),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
      bottomSheet: BookBottomSheet(_book),

    );
  }
}
