import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../login.dart';
import 'StartingPageTwo.dart';

class StartingPageOne extends StatelessWidget {
  const StartingPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
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
                      padding: const EdgeInsets.only(top: 30,right: 20),
                      child: InkWell(onTap:() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ),
                        );

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>login()),
                        // );
                      },
                        child: const Text
                          ('skip',style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Center(
                      child: SvgPicture.asset
                        ('assets/CASE STUDY.svg'),
                    )
                  ],
                ),


              ),
              Transform.translate(offset: const Offset(0,-30),
                  child: Image.asset('assets/Component 6 – 1.png')),
              const SizedBox(
                height: 20,
              ),
              const Text('Lorem ipsum dollar sitam',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              const Text('et consectur',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'lorem ipsum dollar sit amet,consectetu',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const Text(
                'elit,sed do eiusmod tempor',
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
                          builder: (context) => const StartingPageTwo(),
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

