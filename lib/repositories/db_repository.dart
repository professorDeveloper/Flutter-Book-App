import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/book.dart';

class DBRepository {


  static Future<List<Book>> fetchBooksFromRange() async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>>? _querySnapshot = await _fireStore.collection('books').get();
    List<QueryDocumentSnapshot> _loadedItems = _querySnapshot.docs;

    var list = _loadedItems. map((QueryDocumentSnapshot doc) {
      return Book.fromFirestore(doc);
    }).toList();

    return list;
  }

  static Future<Book?>? findById(String? id) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    DocumentReference _reference = _fireStore.collection('books').doc(id);
    DocumentSnapshot _snapshot = await _reference.get();

    return Book.fromFirestore(_snapshot);
  }

  static Future<List<Book>?>? searchBooksByKeyword(String? keyword) async {
    FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> _querySnapshot =
        await _fireStore.collection('books').get();
    List<QueryDocumentSnapshot> _documentSnapshot = _querySnapshot.docs;
    List<Book> _loadedBooks =
        _documentSnapshot.map((QueryDocumentSnapshot snapshot) {
      return Book.fromFirestore(snapshot);
    }).toList();

    return keyword!.isNotEmpty
        ? _loadedBooks
            .where((Book book) => book.title!.toLowerCase().contains(keyword))
            .toList()
        : [];
  }
}
