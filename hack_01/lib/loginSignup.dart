import 'package:flutter/material.dart';
import 'package:hack_01/mobile_layout.dart';

class Loginsignup extends StatefulWidget {
  const Loginsignup({super.key});

  @override
  State<Loginsignup> createState() => _LoginsignupState();
}
PageController Loginsignupcontroller = PageController();

class _LoginsignupState extends State<Loginsignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(10),
          child:SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    fit: BoxFit.fill,
                    width: 200,
                    image: AssetImage("lib/Assets/logo.png")
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("lOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                ),
                ListenableBuilder(
                  listenable: pageviewController, 
                  builder: (context,child){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text("As student"),
                              
                            ],
                          ),
                          Container(
                            child: Text("As Admin"),
                          ),
                          Container(
                            child: Text("Guest"),
                          )
                        ],
                      ),
                    );
                  }
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 400,
                    child: PageView(
                      controller:pageviewController ,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email"),
                              TextField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  hintText: "example@gmail.com",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide()
                                  )
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text("password"),
                              TextField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide()
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email"),
                              TextField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  hintText: "example@gmail.com",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide()
                                  )
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text("password"),
                              TextField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide()
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Text("username"),
                              TextField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  hintText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide()
                                  )
                                ),
                              ),
                              const SizedBox(height: 20,),
                             const Text("email"),
                              TextField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide()
                                  )
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text("don't have an account"),
                      TextButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signup()));
                      }, child:const Text("signup",style: TextStyle(decoration: TextDecoration.underline),))
                    ],
                  ),
                  
              ],
            ),
          ) ,
        ),
      )
    );
  }
}
class signup extends StatelessWidget {
  const signup({super.key});
static PageController signuppageController = PageController();
static List intitutions = [
  "Dedan Kimathi University Of Technology",
  "Jomo Kenya University Of Technology",
  "Kenyatta University",
  ];
static List intitutionsemail = [
  "@dkut.ac.ke",
  "@jkuat.ac.ke",
  "@ku.ac.ke",
  ];

  @override
  Widget build(BuildContext context) {
    String institution = "Select institution";
    String emailHint = "Select Institution";
    bool intitutionOpen = false;
    return  Scaffold(
      appBar: AppBar(),
      body: Card(
        
        margin:const EdgeInsets.all(10) ,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: 350,
                  image: AssetImage("lib/Assets/logo.png")),
                  Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/2,
                    child: PageView(
                      controller: signuppageController,
                      children: [
                        Container(
                          child:StatefulBuilder(
                            builder: (context,statepage) {
                              return SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Full name"),
                                    ),
                                    TextField(
                                        controller: TextEditingController(),
                                        decoration: InputDecoration(
                                          
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide()
                                          )
                                        ),
                                      ),
                                      
                                      const SizedBox(height: 20,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: const Color.fromARGB(255, 141, 140, 140)),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Column(
                                          children: [
                                            TextButton(onPressed: (){
                                              statepage((){
                                                intitutionOpen = !intitutionOpen;
                                              });
                                            }, child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,  children: [Text(institution),Icon(Icons.keyboard_arrow_down_rounded)],)),
                                            Visibility(
                                              visible: intitutionOpen,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: intitutions.length,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index) {
                                                  return ListTile(
                                                    onTap: (){
                                                      statepage((){
                                                        emailHint = intitutionsemail[index];
                                                        institution = intitutions[index];
                                                        intitutionOpen =!intitutionOpen;
                                                      });
                                                    },
                                                    title:Text(intitutions[index]) ,);
                                                },
                                              ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("email"),
                                      ),
                                      TextField(
                                        enabled: institution != "Select institution",
                                        controller: TextEditingController(),
                                        decoration: InputDecoration(
                                          hintText: emailHint,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide()
                                          )
                                        ),
                                      ),
                                      Text("Password"),
                                      TextField(
                                        enabled: institution != "Select institution",
                                        controller: TextEditingController(),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide()
                                          )
                                        ),
                                      ),
                                      Text("Confirm Password"),
                                      TextField(
                                        enabled: institution != "Select institution",
                                        controller: TextEditingController(),
                                        decoration: InputDecoration(
                                         
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide()
                                          )
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }
                          ) ,
                        )
                      ],
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [const Text("Already have an account?"),TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Loginsignup()));
                    }, child: Text("login")
                    )],),
                    Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MobileLayout()));
                        },
                        child: Container(
                          padding:const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                            ),
                          child:const Text("Sign Up")
                          ),
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}