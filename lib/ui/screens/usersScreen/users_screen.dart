import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/card_info.dart';
import '../../../models/user.dart';
import '../../../repos/users.dart';
import '../../components/info_card.dart';
import '../Login.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<List<User>> _usersListFuture;

  @override
  void initState() {
    super.initState();
    _usersListFuture = Users().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(icon:Icon(Icons.arrow_back,color:Colors.blueGrey,),onPressed: (){
          Navigator.pop(
              context, MaterialPageRoute(builder: (context) => Login()));

        },),
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text("Users list",  style: GoogleFonts.lemonada(
          color: Colors.blueGrey,
          fontSize: 20,
        ),
        ),
      ),
      body: _getUsersGrid(),
    );
  }

  Widget _getUsersGrid() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white
         // gradient: LinearGradient(
         //      begin: Alignment.topLeft,
         //      end: Alignment.bottomRight,
         //      colors: [
         //         Color(0xFFfcab88).withOpacity(0.03),
         //         Color(0xFFfcab88).withOpacity(0.1),
         //      ],
         //      stops: [
         //        0.1,
         //        1,
         //      ]),
        // image: DecorationImage(
        //   image: NetworkImage("https://i.pinimg.com/236x/7a/e2/88/7ae288e85317ada73b6772ca324727eb.jpg"),
        // )
      ),
      child: FutureBuilder<List<User>>(
          future: _usersListFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                childAspectRatio: 1/1.2,
                crossAxisCount: 2,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                children: List.generate(
                  snapshot.data!.length,
                  (index) => InfoCardComponent(
                    cardInfo: CardInfo(
                      title:
                          "${snapshot.data![index].firstName} ${snapshot.data![index].lastName}",
                      subtitle: snapshot.data![index].email,
                      image: snapshot.data![index].image,
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
