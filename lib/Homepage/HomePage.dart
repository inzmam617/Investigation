import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: SizedBox(
                //     width: 150,
                //     height: 30,
                //     child: TextField(
                //       enabled: false,
                //       decoration: InputDecoration(
                //           hintText: ' HI! Alishba',
                //           hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                //           contentPadding: const EdgeInsets.all(6),
                //           prefixIcon: Image.asset(
                //             'assets/com...png',
                //           ),
                //           enabledBorder: const OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.white),
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(0),
                //                 topRight: Radius.circular(30),
                //                 bottomRight: Radius.circular(30),
                //                 bottomLeft: Radius.circular(0),
                //               )),
                //           filled: true,
                //           fillColor: Colors.white,
                //           border: const OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.white),
                //               borderRadius: BorderRadius.only(
                //                   topLeft: Radius.circular(0),
                //                   topRight: Radius.circular(30),
                //                   bottomRight: Radius.circular(30),
                //                   bottomLeft: Radius.circular(0)))),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Home Page',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'times new roman')),
                          ),
                          Align(alignment: Alignment.centerLeft,
                            child: Text('Folders Page',
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

        ],
      ),
    );
  }
}



