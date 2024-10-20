import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack_01/clubs.dart';
import 'package:hack_01/homepage.dart';
import 'package:hack_01/main.dart';
import 'package:hack_01/marketplace.dart';
import 'package:hack_01/navigation_home.dart';
import 'package:hack_01/profile.dart';
import 'package:hack_01/resources_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

PageController pageviewController = PageController(initialPage: 2);

class _MobileLayoutState extends State<MobileLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Image(
                    alignment: Alignment.bottomLeft,
                    width: 100,
                    height: 60,
                    fit: BoxFit.contain,
                    image: AssetImage("lib/Assets/logo.png")),
                    
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.left,
                    "UniHub",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Marketplace()));
            }, icon:const Icon(FontAwesomeIcons.shop))
          ],
        ),
        body: PageView(
          controller: pageviewController,
          children: const [
            NavigationHome(),
            ResourcesPage(),
            Homepage(),
            Clubs(),
            Profile(),
          ],
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatefulBuilder(
                builder: (BuildContext context, setStatetheme) {
                  return IconButton(onPressed: (){
                if (_value)
                {MyApp.of(context)!.changeTheme(ThemeMode.dark);}
              else
                {MyApp.of(context)!.changeTheme(ThemeMode.light);}
                setState(() {
                  _value = !_value;
                });
              }, icon: _value? Icon(Icons.sunny):Icon(Icons.dark_mode));
                },
              ),
              
              Center(
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("lib/Assets/dp0.png"),
                ),
              ),
              ListTile(
                onTap: ()async {
                  var url = Uri.parse("tel:0745222065");
                              try {
                                await launchUrl(url);
                              } catch (e) {
                                print(e.toString());
                              }
                },
                title: const Text("Ambulance"),
              ),
              const Divider(),
              ListTile(
                onTap: ()async {
                  showDialog(context: context, builder: (context){
                    return Dialog(
                      child: Container(
                        height: 380,
                        child: Column(
                          children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: const Text("Security Office",style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                           ),
                           const SizedBox(height: 10,),
                           Card(
                             child: ListTile(
                              title: Text("Resource Center, Ground floor"),
                              trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.location_on)),
                             ),
                           ),
                            Card(
                              child: ListTile(
                                title:const Text("Call Security Office"),
                                trailing: IconButton(onPressed: ()async{}, icon:const Icon(Icons.call)),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text("email"),
                                trailing: Icon(Icons.email),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text("Report"),
                                trailing: Icon(Icons.security),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text("Lost and Found"),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                title: const Text("Security"),
              ),
              const Divider(),
              ListTile(
                onTap: () async{
                  showDialog(context: context, builder: (context){
                    return Dialog(
                      child: SizedBox(
                        height: 240,
                        child: Column(
                          children: [
                            Text("Guidance and Counselling",style: TextStyle(fontWeight: FontWeight.bold),),
                            Card(
                              child: ListTile(
                                title: Text("Counselling Offices"),
                                subtitle: Text("Mess,ground floor"),
                                trailing: Icon(Icons.location_on),
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Text("Contact us:"),
                                  Row(
                                    children: [
                                      Text("Phone"),
                                      SizedBox(width: 20,),
                                      SelectableText("0703742765"),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.call))
                                    ],
                                  ),
                                  Row(children: [
                                    Text("Email"),
                                    SizedBox(width: 20,),
                                    SelectableText("councelingdkut@dkut.ac.ke"),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.email))
                                  ],)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                title: const Text("Counselling"),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const Text("Financial Help"),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const Text("Other"),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const Text("Feedback"),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const Text("About "),
              ),
              const Divider(),
            ],
          ),
        ),
        bottomSheet: ListenableBuilder(
            listenable: pageviewController,
            builder: (context, child) {
              return CurvedNavigationBar(
                color:_value? Colors.white:Colors.black,
                  onTap: (index) {
                    pageviewController.animateToPage(index,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                  },
                  index: pageviewController.page == null
                      ? 2
                      : pageviewController.page!.toInt(),
                  items:  [
                    Icon(
                      FontAwesomeIcons.mapLocationDot,
                      color: _value?Colors.black:Colors.white,
                      size: 30,
                    ),
                    FaIcon(
                      color: _value?Colors.black:Colors.white,
                      FontAwesomeIcons.layerGroup),
                    Icon(
                      color: _value?Colors.black:Colors.white,
                      Icons.home,
                      size: 30,
                    ),
                    Icon(
                      color: _value?Colors.black:Colors.white,
                      Icons.group,
                      size: 30,
                    ),
                    FaIcon(
                      color: _value?Colors.black:Colors.white,
                      FontAwesomeIcons.user,
                      size: 30,
                    )
                  ]);
            }));
  }
}
