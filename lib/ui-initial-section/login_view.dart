import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/buttonApp.dart';
import 'package:renstatefrontend/shared/logo.dart';
import 'package:renstatefrontend/shared/services/UserService.dart';
import 'package:renstatefrontend/ui-initial-section/register_view.dart';
import 'package:renstatefrontend/ui-initial-section/welcome_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late UserService userService = UserService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    if (userService.getUserLogedId() == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF78BCC4),
      body: Center(
        child: Column(
          children: [
            logo(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textLogin(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: size.height * 0.07,
                      ),
                      child: Column(
                        children: [
                          emailInput(emailController),
                          passwordInput(passwordController),
                        ],
                      ),
                    ),
                  ),
                  notHaveAccount(context),
                  buttonApp(
                    "Log In",
                      (){
                      print(emailController.text);
                      print(passwordController.text);
                      _performLogin(emailController.text, passwordController.text, context);

                      }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void _performLogin(String email, String password, BuildContext context) async {
    final int? userId = await userService.loginUser(email, password);

    if (userId != null) {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeView()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciales incorrectas'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}

Widget notHaveAccount(context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("You do not have an account? ", style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterView()),
            );
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF064789),
            ),
          ),
        ),
      ],
    ),
  );
}


Widget textLogin(){
    return Text(
      'Log In',
      style: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF064789),
      ),
    );
}

Widget emailInput(TextEditingController controller){
  return Container(
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 10, 9, 9),
          fontWeight: FontWeight.w700,
        ),
      ),
      onChanged: (value) {},
    ),
  );
}
Widget passwordInput(TextEditingController controller){
  return Container(
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 12, 11, 11),
          fontWeight: FontWeight.w700,
        ),
      ),
      onChanged: (value) {},
    )
  );
}
