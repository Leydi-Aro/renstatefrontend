import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/buttonApp.dart';
import 'package:renstatefrontend/shared/logo.dart';
import 'package:renstatefrontend/shared/services/UserService.dart';
import 'package:renstatefrontend/ui-initial-section/login_view.dart';
import 'package:renstatefrontend/ui-initial-section/welcome_view.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();


class RegisterView extends StatelessWidget {

  late UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF78BCC4),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              logo(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textRegister(),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.04,
                        ),
                        child: formRegister(),
                      ),
                    ),
                    haveAccount(context),
                    buttonApp(
                        "Register",
                        (){
                          _performRegister(nameController.text, lastNameController.text,
                              emailController.text, passwordController.text, context);
                        }
                        )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _performRegister(String mame, String lastName, String email, String password, BuildContext context) async {
    final int? userId = await userService.registerUser(mame, lastName,email, password);

    print(userId);
    print("==================================");
    if (userId != null) {
      userService.saveUserId(userId);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeView()),
      );
    }
  }
}


Widget textRegister(){
  return Text(
    'Register',
    style: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF064789),
    ),
  );
}

Widget haveAccount(context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Have an account? ", style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
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
            'Log In',
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

Widget formRegister(){

  return Column(
    children: [
      TextField(
        keyboardType: TextInputType.emailAddress,
        controller: nameController,
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
        controller: lastNameController,
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
        controller: emailController,
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
        controller: passwordController,
        obscureText: true,
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
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Confirm password',
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 12, 11, 11),
          ),
        ),
        onChanged: (value) {},
      ),
    ],
  );
}
