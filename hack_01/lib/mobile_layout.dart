import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack_01/clubs.dart';
import 'package:hack_01/homepage.dart';
import 'package:hack_01/navigation_home.dart';
import 'package:hack_01/profile.dart';
import 'package:hack_01/resources_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("App Logo"),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
              ),
              ListTile(
                onTap: () {},
                title: const Text("Ambulance"),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const Text("Security"),
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const Text("Counceling"),
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
                  onTap: (index) {
                    pageviewController.animateToPage(index,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                  },
                  index: pageviewController.page == null
                      ? 2
                      : pageviewController.page!.toInt(),
                  items: const [
                    Icon(
                      FontAwesomeIcons.mapLocationDot,
                      size: 30,
                    ),
                    FaIcon(FontAwesomeIcons.layerGroup),
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Icon(
                      Icons.group,
                      size: 30,
                    ),
                    FaIcon(
                      FontAwesomeIcons.user,
                      size: 30,
                    )
                  ]);
            }));
  }
}
