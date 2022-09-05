import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 320,
                    height: 320,
                    child: Image.asset('assets/images/fundologin.png'),
                  ),
                  SizedBox(height: 15),
                  Card(
                    color: Colors.grey.shade200.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 12, left: 12, top: 20, bottom: 12),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (text) {
                              email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            onChanged: (text) {
                              password = text;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(118, 223, 64, 251),
                            ),
                            onPressed: () {
                              if (email == '123@123.com' && password == '123') {
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              } else {
                                print('Login invalido');
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              child: Text('Enter', textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/lavander.gif',
                  fit: BoxFit.cover,
                )),
            Container(color: Colors.white.withOpacity(0.5)),
            _body(),
          ],
        ),
      ),
    );
  }
}
