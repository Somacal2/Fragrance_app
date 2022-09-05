import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

import 'OcasiaoPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CardItem {
  final String urlImage;
  final String title;
  final String description;

  const CardItem(
      {required this.urlImage, required this.title, required this.description});
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  List<CardItem> items = [
    CardItem(
        urlImage:
            'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Trabalho',
        description:
            'No ambiente de trabalho indica-se utilizar fragrâncias mais acomedidas na projeção, que marquem presença sem ser invasivo. Neste local o perfume utilizado mostrará toda a sua personalidade, além de ser um complemento perfeito para a sua vestimenta de trabalho'),
    CardItem(
        urlImage:
            'https://images.pexels.com/photos/1587927/pexels-photo-1587927.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Balada',
        description: 'batata'),
    CardItem(
        urlImage:
            'https://images.pexels.com/photos/4255483/pexels-photo-4255483.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Encontros',
        description: 'batata'),
    CardItem(
        urlImage:
            'https://images.pexels.com/photos/3916019/pexels-photo-3916019.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        title: 'Casamento',
        description: 'batata'),
  ];

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
                Navigator.of(context).pushReplacementNamed('/profile');
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
            SizedBox(height: 200),
            CustomSwitch(),
            Text('Change theme', textAlign: TextAlign.center),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Fragrance Guide'),
        actions: [
          //CustomSwitch(),
        ],
      ),

      //Lista de Perfumes por Ocasião
      body: Container(
        height: 256,
        child: ListView.separated(
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, _) => SizedBox(width: 12),
          itemBuilder: (context, index) => buildCard(item: items[index]),
        ),
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      child: Ink.image(
                        image: NetworkImage(item.urlImage),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OcasiaoPage(
                                item: item,
                                description: item.description,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      );
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
