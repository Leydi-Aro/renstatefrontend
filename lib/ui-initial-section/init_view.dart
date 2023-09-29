import 'package:flutter/material.dart';
import 'package:renstatefrontend/ui-initial-section/register_view.dart';
import 'package:renstatefrontend/ui-initial-section/login_view.dart';

class InitView extends StatelessWidget {
  const InitView({super.key});
  static String id = 'init_view';

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF064789),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage('https://i.ibb.co/9T6qrHD/logoroom.png'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login view
                    Navigator.pushNamed(context, LoginView.id);
                  },
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the register view
                    Navigator.pushNamed(context, RegisterView.id);
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
