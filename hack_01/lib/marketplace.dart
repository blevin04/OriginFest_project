import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}
List categories = [
  "Dekutes",
  "Canteens",
  "Electronics",
  "Phones",
  "Computing",
  "Beauty",
  "Home and Office",
  "Fashion",
  "Sporting",

];
ValueNotifier showsearchbar = ValueNotifier(false);
List categoryImgs = [
  "lib/Assets/dekutes.jpg",
  "lib/Assets/messhat.webp",
  "lib/Assets/computing.jpg",
  "lib/Assets/phones.jpg",
  "lib/Assets/electronics.jpg",
  "lib/Assets/beauty.jpeg",
  "lib/Assets/homeoffice.webp",
  "lib/Assets/fashiom.jpg",
  "lib/Assets/sport.jpg",
];
List itemsDisplayed = [
  "lib/Assets/Sp1.jpeg",
  "lib/Assets/Sp2.webp",
    "lib/Assets/head1.jpg",
  "lib/Assets/phone1.jpg",
];
Map<dynamic,dynamic> itemdetails = {
  0:["Sound System Sanyo","ksh.4000"],
  1:["Sony Sound System","ksh.8000"],
  2:["Sony Headphones","ksh.2000"],
  3:["Itel c200","ksh.12000"],
};
bool filtervisible = false;
List filternames = [
  "Price low to high",
  "Price high to low",
];
String filtervalue = "Filter";
class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        ListenableBuilder(listenable: showsearchbar, builder: (context,child){
          return showsearchbar.value==true ?const Text("Marketplace"):
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: SearchBar(
            leading: Icon(Icons.search),
          ),
        );
        }),
        
        actions: [
          IconButton(onPressed: (){
            if (showsearchbar.value == true) {
              showsearchbar.value = false;
            }else{
              showsearchbar.value = true;
            }
          }, icon:const Icon(Icons.search)),
          IconButton(onPressed: (){}, 
          icon:const Badge(
            label: Text("2"),
            backgroundColor: Colors.red,
            child: Icon(FontAwesomeIcons.comment),
          )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Card(
              margin:const EdgeInsets.all(5),
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AspectRatio(
                      aspectRatio: 2,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage("lib/Assets/dkutfarm.jpeg")))
                  ],
                ),

              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(69, 104, 103, 103),
                borderRadius: BorderRadius.circular(10)
              ),
              child: GridView.builder(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: categoryImgs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Expanded(child: Image(image: AssetImage(categoryImgs[index]))),
                        Text(categories[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
            StatefulBuilder(
              builder: (context,setstatefilter) {
                return Container(
                   alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Text(filtervalue),
                          IconButton(onPressed: (){
                            setstatefilter((){
                              filtervisible = !filtervisible;
                            });
                          },icon: const Icon(Icons.keyboard_arrow_down_sharp))
                        ],
                      ),
                      Visibility(
                        visible: filtervisible,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: filternames.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: (){
                                filtervalue = filternames[index];
                                setstatefilter((){
                                  filtervisible = !filtervisible;
                                });
                              },
                              title: Text(filternames[index]),
                            );
                          },
                        ),
                        )
                    ],
                  ),
                );
              }
            ),
            GridView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: itemsDisplayed.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context){
                        return Dialog(
                          child: Container(
                            height: 500,
                            child: Column(
                              children: [
                                Expanded(child: Image(image: NetworkImage(itemsDisplayed[index]))),
                                Text(itemdetails[index].first),
                        Text(itemdetails[index].last),
                              Text("Contact Seller"),
                              ListTile(
                                title:Row(
                                  children: [
                                    const Text("Phone:"),
                                    Text("+254703742765")
                                  ],
                                ),
                                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.call)),
                              ),
                              ListTile(
                                title: Text("WhatsApp:"),
                                trailing: IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.comment)),
                              )
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    child: Column(
                      children: [
                        Expanded(child: Image(image: AssetImage(itemsDisplayed[index]))),
                        const Divider(endIndent: 5,indent: 5,),
                        Text(itemdetails[index].first),
                        Text(itemdetails[index].last)

                      ],
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