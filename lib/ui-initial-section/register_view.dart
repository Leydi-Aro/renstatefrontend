import 'package:flutter/material.dart';
import 'package:renstatefrontend/ui-initial-section/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register_view';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF78BCC4),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.ibb.co/9T6qrHD/logoroom.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF064789),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: size.height * 0.05,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 10, 9, 9),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 10, 9, 9),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 10, 9, 9),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 12, 11, 11),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Confirm password',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 12, 11, 11),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    child: Text(
                      '¿Ya tienes una cuenta? Iniciar Sesion',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF064789),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.id);
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
