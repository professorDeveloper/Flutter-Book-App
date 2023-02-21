import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:flutter/material.dart';

import 'package:ebook_firebase/model/book.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

class PDFScreen extends StatefulWidget {
  static const String routeName = '/pdf';

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  bool _isLoading = true;
  late PDFDocument document;
  bool _usePDFListView = false;
  Book? book;

  @override
  void initState() {
    changePDF();
    super.initState();


  }

  @override
  void dispose() {
    document.clearImageCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    book = ModalRoute.of(context)!.settings.arguments as Book;

    print('tushdi');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book!.title.toString(),
          style: appBarTitle(),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
          splashRadius: 22,
        ),
      ),
      body: Column(
        children: <Widget>[
          !_usePDFListView
              ? Expanded(
                  child: Center(
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : PDFViewer(
                            document: document,
                            zoomSteps: 1,
                            showPicker: false,
                            showNavigation: true,
                          ),
                  ),
                )
              : Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : PDFListViewer(
                          document: document,
                          preload: true,
                        ),
                ),
        ],
      ),
    );
  }

  changePDF() async {
    setState(() => _isLoading = true);
    document = await PDFDocument.fromURL(book!.pdfUrl!);
    setState(() => _isLoading = false);
  }
}
