import 'package:flutter/material.dart';

import 'home_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePage();
}

class _ProfilePage extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    'https://media-exp1.licdn.com/dms/image/C4D03AQFE3D3dSqHJsA/profile-displayphoto-shrink_800_800/0/1639668583658?e=1667433600&v=beta&t=zD0VvcUfXe0Lpg6M4Mel4CYEvAeHhu8-gLwnURv2LDA'),
              ),
              accountName: Text('Somacal'),
              accountEmail: Text('somacal@somacal.com.br'),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              subtitle: Text('Go to home page'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Profile'),
              subtitle: Text('Personal informations'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_outline),
              title: Text('Favorite'),
              subtitle: Text('Your best-loved list s2'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/favorite');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Exit'),
              subtitle: Text('Logout your account'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSwitch(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
