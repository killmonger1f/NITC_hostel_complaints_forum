import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/presentation/core/login_option_screen.dart';
import 'package:movieapp/presentation/core/wrapper.dart';

class ViewonlyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                accountName: Text('Anonymous'),
                accountEmail: Text('anony@mous.com'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Wrapper(),
                    ),
                  );
                },
                child: Text('Go back to Login page'),
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
