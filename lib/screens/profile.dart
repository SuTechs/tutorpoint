import 'package:flutter/material.dart';
import 'package:tutorpoint/constants.dart';
import 'package:tutorpoint/widgets/bottomSheet.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/top.jpg'),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 75),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'Su Mit',
                  style: TextStyle(
                      color: kBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),

                ///
                Expanded(
                  child: ListView(
                    children: [
                      BottomSheetOptionTile(
                        title: 'Subject',
                        icon: Icons.book,
                      ),
                      BottomSheetOptionTile(
                        title: 'Support',
                        icon: Icons.help,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.5 - 60,
          child: Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(70))),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 60,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
