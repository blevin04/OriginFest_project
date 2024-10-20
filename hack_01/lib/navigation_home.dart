import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationHome extends StatefulWidget {
  const NavigationHome({super.key});

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
}

showsnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

List cardnames = [
  "Admin Offices",
  "Labs",
  "Classes",
  "SOE",
  "RC",
  "SOB",
  "Mess",
  "Halls"
];
List assetnames = [
  "lib/Assets/office.png",
  "lib/Assets/lab.png",
  "lib/Assets/class.png",
  "lib/Assets/SOE.jpg",
  "lib/Assets/RC.jpeg",
  "lib/Assets/sob.png",
  "lib/Assets/mess.jpg",
  "lib/Assets/halls.jpg"
];
ValueNotifier<bool> showListView = ValueNotifier(false);
String filtervalue = "";

class _NavigationHomeState extends State<NavigationHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: showListView,
        builder: (context, child) {
          bool showrooms = showListView.value;
          return showrooms
              ? searchnavigation(filter: filtervalue)
              : Scaffold(
                  body: Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      itemCount: cardnames.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              filtervalue = cardnames[index];
                              if (showListView.value == true) {
                                showListView.value = false;
                              } else {
                                showListView.value = true;
                              }
                            },
                            splashColor: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image(
                                    image: AssetImage(assetnames[index]),
                                    // image: NetworkImage(
                                    //     "https://cdn-icons-png.flaticon.com/512/1183/1183110.png")
                                  ),
                                ),
                                AspectRatio(
                                  aspectRatio: 5,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(77, 98, 98, 98)),
                                    child: Text(cardnames[index]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ));
        });
  }
}

class searchnavigation extends StatelessWidget {
  final filter;
  const searchnavigation({super.key, required this.filter});
  static List adminNames = [
    "COD's Offices School Of Engineering",
    "Dean Shool Of nursing",
    "Finance Office",
    "Chemical Department",
    "Students Registrars Office",
    "Academic Audit Office",
    "COD Dept. Of Community Health",
    "(ITHOM) Institute Of Tourism and Hospitality Management",
    "(IGGRES) Institute Of Geomatics and Remote Sensing ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      filtervalue = "";
                      if (showListView.value = true) {
                        showListView.value = false;
                      } else {
                        showListView.value = true;
                      }
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Expanded(
                  child: SearchBar(
                    leading: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: adminNames.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  roomInfo(name: adminNames[index])));
                    },
                    title: Text(adminNames[index]),
                    subtitle: Text(index == 2 ? "Finance" : "Administration"),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: SizedBox(
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Navigate to...",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Divider(
                                          endIndent: 10,
                                          indent: 10,
                                        ),
                                        ListTile(
                                          title: const Text("Locate Office"),
                                          trailing:
                                              const Icon(Icons.location_on),
                                          onTap: () {
                                            showsnackbar(context,
                                                "Navigations Comming Soon");
                                          },
                                        ),
                                        ListTile(
                                          title: const Text(
                                              "Live from to Navigation"),
                                          trailing:
                                              Icon(FontAwesomeIcons.route),
                                          onTap: () {
                                            String name = adminNames[index];
                                            if (name ==
                                                "COD's Offices School Of Engineering") {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>roomInfo(
                                                name: name,
                                                navigate: true,
                                              )));
                                            } else {
                                              showsnackbar(context,
                                                  "Navigator not attached");
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(Icons.more_vert_outlined)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class roomInfo extends StatefulWidget {
  final name;
  final navigate;
  const roomInfo({super.key, required this.name, this.navigate = false});

  @override
  State<roomInfo> createState() => _roomInfoState();
}

Map<String, dynamic> officeInfo = {
  "Prof. James Njihia": ["0745222065", "COD Mechatronics Engineering"],
  "prof.Kiplagat": ["0703742765", "COD Electrical & Elecronics Engineering"],
  "Dr. Mark kamau": ["0740081977", "COD Mechanical Engineering"],
  "Mrs. Olivia chebet": ["0114068601", "COD Civil Engineering"],
};
List roles = [""];
late LocationData _locationData;
List usenames = [
  "COD's Offices School Of Engineering",
  "Dean Shool Of nursing",
];
Location location = new Location();
Future getlocation() async {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return location;
    }
  }
  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  _locationData = await location.getLocation();
}

class _roomInfoState extends State<roomInfo> {
  @override
  void initState() {
    getlocation();
    // TODO: implement initState
    

    // Location.instance.onLocationChanged.listen((LocationData currentlocation) {
    //   _locationData = currentlocation;
    //   setState(() {});
    // });
    Location.instance
        .changeSettings(accuracy: LocationAccuracy.high, interval: 5);
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(widget.name),

          ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: widget.navigate
                ? StreamBuilder(
                    stream: Location.instance.onLocationChanged,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      double latitude = snapshot.data.latitude;
                      double longitude = snapshot.data.longitude;
                      double altitude = snapshot.data.altitude;
                      double dest_latitude = 0;
                      double dest_longitude = 0;
                      //double dest_altitude = 0;
                      if (widget.name ==
                          "COD's Offices School Of Engineering") {
                        dest_latitude = -0.3989241;
                        dest_longitude = 36.9629088;
                        //dest_altitude = 17161.9;
                      }
                      print(altitude);
                      double x_dif = ((sqrt(dest_latitude*dest_latitude)-sqrt(latitude*latitude))*100000);
                      double y_dif = (((sqrt(dest_longitude*dest_longitude)-sqrt(longitude*longitude))*100000));
                      //List range = [dest_latitude - latitude,dest_longitude-longitude];
                       double scale =1.2;
                       x_dif = sqrt(x_dif*x_dif);
                       y_dif = sqrt(y_dif*y_dif);
                       while (x_dif>100||x_dif<-100) {
                         x_dif = x_dif/10;
                       };
                       while(y_dif>100||y_dif<-100){
                        y_dif = y_dif/10;
                       }
                      return Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Column(
                              children: [
                                Text(latitude.toString()),
                                Text(longitude.toString()),
                               const Text("__________________"),
                                Text(dest_latitude.toString()),
                                Text(dest_longitude.toString())
                              ],
                            ),
                            Positioned(
                                left: (200*sqrt((dest_latitude*dest_latitude))),
                                bottom: (5*dest_longitude) ,
                                child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.blue,
                                )),
                            Positioned(
                                left: (200*sqrt((dest_latitude*dest_latitude)))+x_dif,
                                bottom:(5*dest_longitude)+y_dif,
                                child: StatefulBuilder(
                                    builder: (context, statepos) {
                                     
                                  return AnimatedScale(
                                   duration: Duration(seconds: 1),
                                   scale: scale,
                                   child: const Icon(Icons.location_on,color: Colors.red,),
                                    onEnd: (){
                                      statepos((){
                                        print("pp");
                                        scale==1.0?scale=0.2:scale==1.0;
                                        });
                                    },
                                  );
                                })),
                            
                          ],
                        ),
                      );
                    },
                  )
                : const AspectRatio(
                    aspectRatio: 2,
                    child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage("lib/Assets/officeview.jpeg")),
                  ),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    widget.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text("Administration Office"),
                  const Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("School Of Engineering,Ground floor "),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 6,
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: officeInfo.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  List _keys = officeInfo.keys.toList();
                  //print(officeInfo[_keys[index]]);
                  return ListTile(
                    title: Text(_keys[index]),
                    subtitle: Text(officeInfo[_keys[index]].last),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                var url = Uri.parse(
                                    "tel:${officeInfo[_keys[index]].first}");
                                try {
                                  await launchUrl(url);
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              icon: const Icon(Icons.call)),
                          IconButton(
                              onPressed: () async {
                                var contact =
                                    "+254${officeInfo[_keys[index]].first}";
                                var url = Uri.parse(
                                    "whatsapp://send?phone=$contact&text=Hi, I need some help");
                                try {
                                  await launchUrl(url);
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              icon: const Icon(FontAwesomeIcons.comment))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
