
import 'package:flutter/material.dart';

import 'ui/screens/Login.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("welcom user"),
            SizedBox(height: 70,),
            OutlinedButton.icon(onPressed: (){
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => Login()));

            }, icon: Icon(Icons.logout), label: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
