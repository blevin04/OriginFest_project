import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  List resouces = [
    "Mechatronics 3.2 Notes",
    "Chemical Engineering",
    "Machines Lab Manual",
    "List Of Available Hostels",
    "Manual For Ecitizen Fees Payment",
    "Mechatronics 3.2 Notes",
    "Chemical Engineering",
    "Machines Lab Manual",
    "List Of Available Hostels",
    "Manual For Ecitizen Fees Payment",
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(
              leading: Icon(Icons.search),
            ),
            Divider(),
            ListView.builder(
              itemCount: resouces.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: InkWell(
                    child: ListTile(
                      title: Text(resouces[index]),
                      subtitle:const Text("uploaded on 16th march 2020"),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(context: context, builder: (context){
                              return Dialog(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Download"),
                                            Icon(Icons.download)
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Share link"),
                                            Icon(Icons.share)
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Open Link in elearning"),
                                            Icon(Icons.open_in_browser)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                          icon: const Icon(Icons.more_vert_rounded)),
                    ),
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
