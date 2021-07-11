import 'package:cloud_firestore/cloud_firestore.dart';

class Databaseservices {
  String uid;
  Databaseservices({this.uid});

  final CollectionReference moviecollection =
      FirebaseFirestore.instance.collection('movies');

  Future updatedata(String name, String movie1, String movie2, int rating1,
      int rating2) async {
    return await moviecollection.doc(uid).set({
      'name': name,
      'movie1': movie1,
      'movie2': movie2,
      'rating1': rating1,
      'rating2': rating2,
    });
  }
}
