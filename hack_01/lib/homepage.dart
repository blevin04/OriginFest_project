import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hack_01/navigation_home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Container(
              decoration: const BoxDecoration(
                  color: const Color.fromARGB(34, 120, 119, 119)),
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 5,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Lectures",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Divider(
                                    thickness: 8,
                                    indent: 5,
                                    endIndent: 5,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("MSP 2 at 2pm"),
                              )
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Events",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Divider(
                                    thickness: 8,
                                    indent: 5,
                                    endIndent: 5,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("Origin fest \n tomorrow 9am"),
                              )
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Activities",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Divider(
                                    color: Colors.blue,
                                    thickness: 8,
                                    endIndent: 5,
                                    indent: 5,
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("Gym at 6pm"),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            const Divider(),
            Card(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(37, 118, 118, 118)),
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://i.pinimg.com/originals/0d/64/98/0d64989794b1a4c9d89bff571d3d5842.jpg"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("User name"),
                                  Text("12 hrs ago"),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert_outlined))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image(
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            image: const NetworkImage(
                                "https://marketplace.canva.com/EAE1N1HOFho/1/0/900w/canva-image-background-dark-green-phone-wallpaper-Ybf9RZciQtI.jpg")),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.favorite),
                                    Text("100"),
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [Icon(Icons.comment), Text("52")],
                                )),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.share))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
