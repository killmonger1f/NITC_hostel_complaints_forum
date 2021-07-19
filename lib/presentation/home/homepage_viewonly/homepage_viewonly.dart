import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/infrastructure/models/hospital_data.dart';
import 'package:movieapp/infrastructure/services/database_services.dart';
import 'package:movieapp/presentation/home/homepage_list.dart';
import 'package:movieapp/presentation/home/homepage_viewonly/viewonly_drawer.dart';
import 'package:provider/provider.dart';

class HomepageViewonly extends StatefulWidget {
  @override
  _HomepageViewonlyState createState() => _HomepageViewonlyState();
}

class _HomepageViewonlyState extends State<HomepageViewonly> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<HospData>>.value(
      value: Databaseservices().hospdata,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Covi Care',
            style: GoogleFonts.comingSoon(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // floatingActionButton: IconButton(
        //   icon: Icon(
        //     CupertinoIcons.plus_app_fill,
        //     color: Colors.black,
        //     size: 45,
        //   ),
        //   onPressed: () {
        //     showModalBottomSheet(
        //         context: context,
        //         builder: (context) {
        //           return Container(
        //             padding: EdgeInsets.all(16),
        //             child: Adddetails(),
        //           );
        //         });
        //   },
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        backgroundColor: Colors.white,
        drawer: ViewonlyDrawer(),
        body: HomepageList(),
      ),
    );
  }
}
