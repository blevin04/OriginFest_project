import 'package:flutter/material.dart';

class Clubs extends StatefulWidget {
  const Clubs({super.key});

  @override
  State<Clubs> createState() => _ClubsState();
}

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
            ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                    title: Text("Club Name"),
                    subtitle: Text("Tags like #engineering and #tech"),
                    trailing: Icon(Icons.pie_chart),
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