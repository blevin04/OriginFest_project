import 'package:flutter/material.dart';

class NavigationHome extends StatefulWidget {
  const NavigationHome({super.key});

  @override
  State<NavigationHome> createState() => _NavigationHomeState();
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
  "Assets/office.png",
  "Assets/lab.png",
  "Assets/class.png",
  "Assets/SOE.jpg",
  "Assets/RC.jpeg",
  "Assets/sob.png",
  "Assets/mess.jpg",
  "Assets/halls.jpg"
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
                Expanded(
                  child: SearchBar(
                    leading: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text("ROOM NAME"),
                    subtitle: Text("Class/lab/office"),
                    trailing: IconButton(
                        onPressed: () {},
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
