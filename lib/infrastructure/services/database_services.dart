import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieapp/infrastructure/models/hospital_data.dart';

class Databaseservices {
  String uid;
  Databaseservices({this.uid});

  final CollectionReference hospitaldatacollection =
      FirebaseFirestore.instance.collection('Hospital data');

  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection('User info');

  Future updatedata(String name, String hospname, String hosploctn,
      String phoneno, String itemno, String itemtype) async {
    return await hospitaldatacollection.doc().set({
      'name': name,
      'hospname': hospname,
      'hosploctn': hosploctn,
      'phoneno': phoneno,
      'itemno': itemno,
      'itemtype': itemtype,
    });
  }

  List<HospData> _hospdatafromsnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map data = doc.data();
      return HospData(
        name: data['name'],
        hospname: data['hospname'],
        hosploctn: data['hosploctn'],
        phoneno: data['phoneno'],
        itemno: data['itemno'],
        itemtype: data['itemtype'],
      );
    }).toList();
  }

  Stream<List<HospData>> get hospdata {
    return hospitaldatacollection.snapshots().map(_hospdatafromsnapshot);
  }
}
