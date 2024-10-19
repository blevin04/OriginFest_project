import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
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
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: InkWell(
                    child: ListTile(
                      title: Text("Mechatronics 3.2 notes "),
                      subtitle: Text("uploaded on 16th march 2020"),
                      trailing: IconButton(
                          onPressed: () {},
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
