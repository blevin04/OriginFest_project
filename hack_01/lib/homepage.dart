import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hack_01/navigation_home.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
String originImg = "https://originlabsafrica.org/img/hackerthon.jpg";
List Postmessage = [
  "Origin labs presents OriginFest hackerthon to be hosten in dedan kimathi university from 18th to 20th of October the perticipants are given 4 challanges to solve and by the end of the hackerthon present and the judges will deside which team had the best solution in each challange",
  "Today Super strickers made history by beating the great unbeaten castillas 1-0. What a game what a team",
  
  "Origin labs presents OriginFest hackerthon to be hosten in dedan kimathi university ",
];
List Usernames = ["Jymo","Rechael","Dennis","Mike"];
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
              child: Row(
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
                              const Column(
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
                              TimerCountdown(
                                spacerWidth: 2,
                                daysDescription: "D",
                                hoursDescription: "H",
                                minutesDescription: "m",
                                secondsDescription: "S",
                                timeTextStyle: TextStyle(),
                                descriptionTextStyle: TextStyle(fontWeight: FontWeight.w500),
                                endTime: DateTime(2024,10,20,12)
                                ),
                                const Divider(color: Colors.green,thickness: 6,),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("Machines",style: TextStyle(fontWeight: FontWeight.bold),),
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
                              const Column(
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
                              TimerCountdown(
                                spacerWidth: 2,
                                daysDescription: "D",
                                hoursDescription: "H",
                                minutesDescription: "m",
                                secondsDescription: "S",
                                timeTextStyle: TextStyle(),
                                descriptionTextStyle: TextStyle(fontWeight: FontWeight.w500),
                                endTime: DateTime(2024,10,20,12)
                                ),
                                const Divider(color: Colors.green,thickness: 6,),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("Origin fest ",style: TextStyle(fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
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
                              TimerCountdown(
                                spacerWidth: 2,
                                daysDescription: "D",
                                hoursDescription: "H",
                                minutesDescription: "m",
                                secondsDescription: "S",
                                timeTextStyle: TextStyle(),
                                descriptionTextStyle: TextStyle(fontWeight: FontWeight.w500),
                                endTime: DateTime(2024,10,20,12)
                                ),
                                const Divider(color: Colors.green,thickness: 6,),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("Elite vs Sambas",style: TextStyle(fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return  Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(37, 118, 118, 118)),
                  height: 500,
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
                                  backgroundImage: AssetImage("lib/Assets/dp0.png")
                                      
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(Usernames[index]),
                                   const Text("12 hrs ago"),
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
                              image:index==1?const AssetImage("lib/Assets/match.jpg"):index==0?const AssetImage("lib/Assets/or1.png"): const AssetImage(
                                  "lib/Assets/halls.jpg")),
                        ),
                      ),
                      Text(Postmessage[index],maxLines: 2,overflow: TextOverflow.ellipsis,),
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
              );
                },
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
