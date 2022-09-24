import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/second.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();


  submitform() {
    if (!formkey.currentState!.validate()) {
      return;
    } else
      (formkey.currentState!.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.network(
              "https://i.pinimg.com/564x/98/19/f3/9819f34e95388398d352bb82ea17e094.jpg",
              color: Colors.white.withOpacity(.9),
              colorBlendMode: BlendMode.modulate,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
                bottom: 170,
                left: 200,
                child: Text(
                  "Forget password!\nneed a help?",
                  style: GoogleFonts.sen(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                )),
            Center(
              child: GlassmorphicContainer(
                  width: 300,
                  height: 370,
                  borderRadius: 20,
                  blur: 5,
                  alignment: Alignment.bottomCenter,
                  border: 2,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      children: [
                        Text(
                          "Sign in",
                          style: GoogleFonts.adamina(
                              color: Colors.white,
                              fontSize: 33,
                              letterSpacing: 5),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Form(
                          key: formkey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  label: Center(
                                    child: Text(
                                      "email",
                                      style: GoogleFonts.sen(
                                          color: Colors.orange[200],
                                          fontSize: 18,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                onSaved: (String? value) {},
                                validator: (val) => !val!.contains('@')
                                    ? 'Not a vailid email' : null,
                              ),
                              TextFormField(
                                controller: passController,
                                decoration: InputDecoration(

                                  label: Center(
                                    child: Text(
                                      "password",
                                      style: GoogleFonts.sen(
                                          color: Colors.orange[200],
                                          fontSize: 18,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                onSaved: (String? value) {},
                                validator: (input) => input!.length < 8
                                    ? 'You need at least 8 characters' : null,
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: SizedBox(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Account !",
                              style: GoogleFonts.sen(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                login();
                                submitform();
                              },
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius: BorderRadius.circular(40)),
                                child: const Center(
                                    child: Icon(Icons.arrow_forward, size: 30, color: Colors.white,),),
                              ),
                            ),
                          ],
                        ),//New Account
                      ],
                    ),
                  ),),
            ),
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
      }
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Black field not allowed")));
    }
  }
}
