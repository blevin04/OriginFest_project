import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Clubs extends StatefulWidget {
  const Clubs({super.key});

  @override
  State<Clubs> createState() => _ClubsState();
}
List clubnames = [
  "Engineering Community ",
  "Art Club Of Kimathi",
  "Karati & Taekwondo",
  "Google Developer Clubs",
  "Elite Football Club",
  "Cristian union Kimathi",
  "Microsoft Student Ambasadors",
  "Computer Science sociaty Of Kimathi",
  ];

  List tags = [
    "#Engineering, #Cad, #Softwaredev",
    "#art,#painting,#galaryvibz",
    "#karati,#jackichan",
    "#dev,#googleIo",
    "#mbuzitornament",
    "#jesus",
    "#MLSA",
    "#softwaredev,#cyberSec",
  ];
  List clubImages = [
    "https://www.discoverengineering.org/wp-content/uploads/2023/12/mj_11235_4.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVkxPDAwHR2CTOqHMJ-IAfzXepxBcTc_9MEw&s",
    "https://thumbs.dreamstime.com/b/karate-logo-design-martial-art-fighter-illustration-vector-template-320401815.jpg",
    "https://yt3.googleusercontent.com/ytc/AIdro_mQRyioMUO4VBrlP-jILdsU6_wMf1KSU9syWtUN4hmK1hg=s900-c-k-c0x00ffffff-no-rj",
    "https://cdn.britannica.com/51/190751-131-B431C216/soccer-ball-goal.jpg",
    "https://static.wixstatic.com/media/0aaabe_f82c53ea7553466cbbb3c8019d0e9429~mv2.jpg/v1/fill/w_504,h_364,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/ChristianUnionLogo-highres_JPG.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkXAPDn5EwDHEdqizBKgm3ckUljUi8mb9e0A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-IZmvzSRRso7AakTA6xMeOHkVShdebwKNTw&s",

  ];
  List filteredImgs = clubImages;
  List filterednames = clubnames;
  List filteredtags = tags; 
class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(
              leading: Icon(Icons.search),
            ),
            Divider(
              
            ),
            StatefulBuilder(
              builder: (BuildContext context, setState0) {
                return ListView.builder(
              shrinkWrap: true,
              itemCount:filteredImgs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(filteredImgs[index]),
                        ),
                        Icon(FontAwesomeIcons.signal,size: 15,)
                      ],
                    ),
                    title: Text(filterednames[index]),
                    subtitle: Text(filteredtags[index]),
                    trailing: IconButton(onPressed: (){
                      setState0(() {
                        filteredImgs.removeAt(index);
                        filterednames.removeAt(index);
                        filteredtags.removeAt(index);
                      });
                    }, icon:const Icon(Icons.add),)
                  ),
                );
              },
            );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}