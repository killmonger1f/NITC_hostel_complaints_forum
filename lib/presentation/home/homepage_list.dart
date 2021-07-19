import 'package:flutter/material.dart';
import 'package:movieapp/infrastructure/models/hospital_data.dart';
import 'package:movieapp/presentation/home/homepage_cards.dart';
import 'package:provider/provider.dart';

class HomepageList extends StatefulWidget {
  @override
  _HomepageListState createState() => _HomepageListState();
}

class _HomepageListState extends State<HomepageList> {
  @override
  Widget build(BuildContext context) {
    final hospdata = Provider.of<List<HospData>>(context) ?? [];

    // hospdata.forEach((element) {
    //   print(element.hosploctn);
    //   print(element.name);
    //   print(element.hospname);
    //   print(element.itemno);
    //   print(element.phoneno);
    // });
    return Center(
      child: Container(
        color: Colors.white,
        width: 540,
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: hospdata.length,
          itemBuilder: (context, index) {
            return HomepageCards(hospData: hospdata[index]);
          },
        ),
      ),
    );
  }
}
