import 'package:flutter/foundation.dart';

class Book {
  Book({
    required this.title,
    @required this.pdfUrl,
    @required this.coverPhotoUrl,
    @required this.language,
    @required this.description,
    @required this.dateTime,
    @required this.pages,
  });

   String title;
  final String? pdfUrl;
  final String? coverPhotoUrl;
  final String? language;
  final String? description;
  final String? pages;
  final String? dateTime;

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'],
      pdfUrl: map['pdfUrl'],
      coverPhotoUrl: map['coverPhotoUrl'],
      language: map['language'],
      description: map['description'],
      dateTime: map['dateTime'],
      pages: map['pages'],
    );
  }

  factory Book.fromFirestore(dynamic book) {
    return Book(
      title: book.get('title'),
      coverPhotoUrl: book.get('coverPhotoUrl'),
      language: book.get('language'),
      pdfUrl: book.get('pdfUrl'),
      description: book.get('description'),
      dateTime: book.get('dateTime'),
      pages: book.get('pages'),
    );
  }

}
