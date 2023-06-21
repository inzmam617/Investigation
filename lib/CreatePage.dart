import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/courtdate.dart';
import 'package:crime_investigation/notebook.dart';
import 'package:crime_investigation/AllCasesPage.dart';
import 'package:crime_investigation/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  void initState(){
    super.initState();
    initialize();
  }
  String? name ;
  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name =  prefs.get("name").toString();
    print("This is the name$name");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: InkWell(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>const courtdate()),
              );
            },
                child: SvgPicture.asset('assets/Component 12 – 1.svg')),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Text(''),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:InkWell(onTap: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {return const setting(); }));
            },

              child: SvgPicture.asset(
                'assets/Iconly-Bold-Setting.svg',
              ),
            ),
            label: '',
          ),
        ],
      ),
      body:
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(

              children: [

                const SizedBox(height: 50,),

                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 150,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: ' HI! $name',
                          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                          contentPadding: const EdgeInsets.all(6),
                          prefixIcon: Image.asset(
                            'assets/com...png',
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(0),
                              )),
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(0)))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Mobile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'times new roman')),
                          ),
                          Align(alignment: Alignment.centerLeft,
                            child: Text('Pocket Guide',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'times new roman')),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                          child: Image.asset('assets/OBJECT.png',fit: BoxFit.scaleDown,)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          InkWell(onTap:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const notebook()),
            );
          },
            child: Container(
                height: 260,
                width: 260,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(180),
                        bottomRight: Radius.circular(180),
                        topRight: Radius.circular(180),
                        topLeft: Radius.circular(180))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(160),
                              bottomRight: Radius.circular(160),
                              topRight: Radius.circular(160),
                              topLeft: Radius.circular(160))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey, blurRadius: 3)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50))),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          const Text(
                            'Create New',style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'times new roman'),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
