import 'package:crime_investigation/StartingScreens/StartingPageThree.dart';
import 'package:crime_investigation/SignIn_SignUp/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crime_investigation/login.dart';


class StartingPageTwo extends StatelessWidget {
  const StartingPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 20),
                      child: InkWell(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>const login()),
                        );
                      },
                          child: const Text('skip',style: TextStyle(color: Colors.grey))),
                    ),
                    Center(
                      child: SvgPicture.asset
                        ('assets/Component 7 – 1.svg'),
                    )
                  ],
                ),
                
              ),
              Transform.translate(
                  offset: const Offset(0, -40),
                  child: Image.asset('assets/Component 9 – 1.png')),
              const SizedBox(
                height: 30,
              ),

              const Text('Court Reminder',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),

              const Text(
                'Remind yourself of the next court date for',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const Text(
                'any subpoena, deposition, or trial. ',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 140,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                   onPressed: () {
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                         builder: (context) => const StartingPageThree(),
                       ),
                     );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
