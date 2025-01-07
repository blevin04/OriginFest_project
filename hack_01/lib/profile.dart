import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}
PageController profiletabs = PageController();
List profiletabnames = [
  "Callender",
  "Posts",
  "Clubs",
  "Events",
  "My Marketplace",

];
bool floatinvisible = false;
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        "lib/Assets/dp0.png"),
                    ),
                    IconButton(onPressed: (){}, icon:const Icon(Icons.camera_alt))
                  ],
                ),
              ),
              const SizedBox(height: 10,),
             const Text("UserName"),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: ListenableBuilder(listenable: profiletabs, builder: (context,child){
                  return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: profiletabnames.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: profiletabs.page == index?
                          Colors.blue:Colors.transparent
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            profiletabs.animateToPage(index, duration:const Duration(milliseconds: 250),   curve: Curves.bounceInOut);
                              
                          },
                          child: Text(
                            profiletabnames[index],
                            style:const TextStyle(fontSize:15),
                            ),
                        ),
                      ),
                    );
                  },
                );
                })
                
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/1.5,
                child: PageView(
                  controller: profiletabs,
                  children: [
                    TableCalendar(
                      focusedDay: DateTime.now(),
                       firstDay: DateTime(2020), 
                       lastDay: DateTime(2050),
                       ),
                    ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("12 days ago"),
                                const Divider(),
                                AspectRatio(
                                  aspectRatio: 2,
                                  child: Image(image: AssetImage("lib/Assets/lab.png"))),
                                  const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [Icon(Icons.favorite),Text("100"),
                                    const SizedBox(width: 10,),
                                    Row(children: [Icon(Icons.comment),Text("12")],)],),
                                    Row(children: [
                                      Text("6"),
                                      Icon(Icons.share)
                                    ],)
                                    
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              
                            ),
                            title: Text("Club Name"),
                            subtitle: Text("#IT, #Hackerthon"),
                            trailing: Icon(Icons.auto_graph),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(),
                            title: Text("OriginFest Hackerthon"),
                            subtitle: Text("on 12th march"),
                            trailing: Icon(FontAwesomeIcons.ellipsisVertical),
                            ),
                            
                            );
                      },
                    ),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    
                                    Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTndc60D3vyCFZIbNLbynSmxtgRWYRlqOBMCQ&s")),
                                    Text("Sold",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              Text("item name")
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
        ),
        floatingActionButton: StatefulBuilder(
          builder: (context,floatingstate) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(78, 133, 133, 133),
                    child: IconButton(onPressed: (){
                        floatingstate((){
                          floatinvisible = !floatinvisible;
                        });
                      }, icon: Icon(floatinvisible?FontAwesomeIcons.xmark:Icons.add)),
                  ),
                  Visibility(
                    visible: floatinvisible,
                    child: Column(
                      children: [
                         IconButton(onPressed: (){}, icon:const Icon(FontAwesomeIcons.bell)),
                  IconButton(onPressed: (){}, icon:const Icon(FontAwesomeIcons.table))
                      ],
                    )
                    ),
                    
                 
                ],
              ),
            );
          }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}