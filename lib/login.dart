import 'package:flutter/material.dart';
import 'package:crime_investigation/SignIn_SignUp/SignInPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login(),
  ));
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Container(
          height: MediaQuery.of(context).size.height/1.1 ,
          width: MediaQuery.of(context).size.width /1.2,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Component 13 – 1.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Wellcome to',
                                  style: TextStyle(color: Colors.grey),
                                ))),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Crime Scene Geeks',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Mobile Pocket Guide',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Lorem ipsum dolar sit amet,consectetu elit,sed do iusmod',
                            style:
                                TextStyle(fontSize: 7.5, color: Colors.grey)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                            'tempor Lorem ipsum dolor sit amet,consectetu elit,sed do',
                            style:
                                TextStyle(fontSize: 7.5, color: Colors.grey)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'eiusmod tempor',
                          style: TextStyle(fontSize: 7.5, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset('assets/Component 16 – 1.svg'),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {return SignInPage();}));
                    },
                    child: Text('Crime Scene Investigator'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
