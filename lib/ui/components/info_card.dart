import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../models/card_info.dart';

class InfoCardComponent extends StatelessWidget {
  final CardInfo cardInfo;
  InfoCardComponent({required this.cardInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cardInfo.onCardClick != null) {
          cardInfo.onCardClick!(cardInfo);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 7,left: 5,right: 5,),
        child: Card(
          elevation: 4,
          shadowColor: Colors.cyan[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(cardInfo.image,
                    ),
                  )
                ),

              ),

              const SizedBox(
                height: 15,
              ),
              Text(
                cardInfo.title,
                style: GoogleFonts.playfairDisplay(
                  color: Colors.blueGrey,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                cardInfo.subtitle,
                style: const TextStyle(fontSize: 12,color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
