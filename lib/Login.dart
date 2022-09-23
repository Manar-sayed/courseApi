
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/second.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                icon: Icon(Icons.email),
                // hintText: 'What do people call you?',
                labelText: 'Email',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              obscureText: true,


              controller: passController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                icon: Icon(Icons.password),
                labelText: 'Password',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              // validator: (String? value) {
              //   return (value != null && value.contains('@'))
              //       ? ' use the @ char.'
              //       : null;
              // },
            ),
            SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              onPressed: () {
                login();
              },
              icon: Icon(Icons.login),
              label: Text("Login"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: ({
            'email': emailController.text,
            'password': passController.text
          }));
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => second()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black field not allowed")));
    }
  }
}
