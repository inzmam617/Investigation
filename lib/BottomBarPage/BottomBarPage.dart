import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';
import '../Homepage/HomePage.dart';
import '../courtdate.dart';
import '../notebook.dart';
import '../setting.dart';


class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 1;
 late List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      initialize();

      print( id);

    });
    initialize();
    _widgetOptions = <Widget>[
      const courtdate(),
      // AllCases(id: id),
      const HomePage(),
      const setting(),


    ];

  }
  String id = "";
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getString("id").toString();
    print(id);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          backgroundColor:Colors.white,
          onPressed: () {

            _showMyDialog();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const notebook()),
            // );


          },
          child: const Icon(Icons.add,color: Colors.black,size: 50,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[


          BottomNavigationBarItem(
            backgroundColor: const Color(0xff2a2e4d),
            icon: SvgPicture.asset('assets/Component 12 – 1.svg'),
            label: '', // Remove label for spacing
          ),
          const BottomNavigationBarItem(
            backgroundColor: Color(0xff2a2e4d),
            icon: Icon(Icons.home, size: 30),
            label: '', // Remove label for spacing
          ),
          const BottomNavigationBarItem(
            backgroundColor: Color(0xff2a2e4d),
            icon: Icon(Icons.settings, size: 28),
            label: '   ', // Add spacing by adjusting the label content
          ),

        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        onTap: _onItemTapped,

      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        // barrierDismissible: false, // user must tap button!
        builder: (BuildContext context)
    {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 3.6)
                    ]),
                height: 40,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 15),

                        helperText: "Enter A name of Case",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),


            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Create'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
    );
  }
}