import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/infrastructure/models/hospital_data.dart';
import 'package:movieapp/infrastructure/models/user.dart';
import 'package:movieapp/infrastructure/services/auth_service.dart';
import 'package:provider/provider.dart';

class HomepageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthServices _authservices = AuthServices();
    final user = Provider.of<Userid>(context);

    return SafeArea(
      child: Drawer(
          child: Container(
        color: Colors.red[50],
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red[200],
                ),
                accountName: Text(user.name ?? 'Anonymous'),
                accountEmail: Text(user.email ?? 'anonymous'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/vectors/avatar.png'),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.red,
              ),
              title: Text(
                'Home',
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.red,
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.red,
              ),
              title: Text(
                'Contact me',
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(60, 20, 60, 0),
              child: ElevatedButton(
                onPressed: () {
                  _authservices.signout();
                },
                child: Text('Sign out'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[400],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
