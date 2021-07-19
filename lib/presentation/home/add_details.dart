import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/infrastructure/models/user.dart';
import 'package:movieapp/infrastructure/services/database_services.dart';
import 'package:provider/provider.dart';

class Adddetails extends StatefulWidget {
  @override
  _AdddetailsState createState() => _AdddetailsState();
}

class _AdddetailsState extends State<Adddetails> {
  final List<String> category = ['oxygen cylinder', 'bed'];
  String name = '';
  String hospname = '';
  String hosploctn = '';
  String phoneno = '';
  String itemno = '';
  String phoneregexp = r"""[0-9]{10}""";
  String itemnoregexp = r"""[0-9]{1,}""";
  final _formkey = GlobalKey<FormState>();

  String _currentcatg;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userid>(context);
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              width: 300,
              child: DropdownButtonFormField(
                hint: Text('Item'),
                value: _currentcatg,
                items: category.map((catg) {
                  return DropdownMenuItem(
                    value: catg,
                    child: Text(catg),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    return _currentcatg = val;
                  });
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 300,
              child: TextFormField(
                validator: (val) {
                  return RegExp(itemnoregexp).hasMatch(val)
                      ? null
                      : 'No. of Items should be a number';
                },
                onChanged: (val) {
                  setState(() {
                    return itemno = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'No. of Items',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 300,
              // height: MediaQuery.of(context).size.height,
              child: TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Hospital name is required' : null;
                },
                onChanged: (val) {
                  setState(() {
                    return hospname = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Hospital Name',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 300,
              // height: MediaQuery.of(context).size.height,
              child: TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Hospital location is required' : null;
                },
                onChanged: (val) {
                  setState(() {
                    return hosploctn = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Hospital Location',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 300,
              // height: MediaQuery.of(context).size.height,
              child: TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Name is required' : null;
                },
                onChanged: (val) {
                  setState(() {
                    return name = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              // height: MediaQuery.of(context).size.height,
              child: TextFormField(
                validator: (val) {
                  return RegExp(phoneregexp).hasMatch(val)
                      ? null
                      : 'Phone no. should have 10 digits';
                },
                onChanged: (val) {
                  setState(() {
                    return phoneno = val;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Phone no.',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[200]),
              ),
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  await Databaseservices(uid: user.uid).updatedata(
                      name, hospname, hosploctn, phoneno, itemno, _currentcatg);
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Save changes',
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
