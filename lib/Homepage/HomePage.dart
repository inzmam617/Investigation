import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllCasesPage.dart';

class HomePage extends StatefulWidget {
  final String? FolderName;
  final String? id;

  const HomePage({super.key, this.FolderName, this.id});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id = "";

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString("id") ?? "";
    });
  }

  late BannerAd _bannerAd;
  //
  @override
  void initState() {
    super.initState();
    initialize();
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Your Ad Unit ID
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('Ad loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to load: $error');
        },
        // Implement other listener methods as needed
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

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
                const SizedBox(
                  height: 50,
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
                            child: Text('Home Page',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'times new roman')),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
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
                          child: Image.asset(
                            'assets/OBJECT.png',
                            fit: BoxFit.scaleDown,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (id == "")
            Column(children: const [
              CircularProgressIndicator(),
              // Show circular indicator while waiting for ID
            ])
          else
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Cases')
                  .doc(id)
                  .collection('AllFolders')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (!snapshot.hasData) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text('No documents found'),
                  );
                }

                final allFolders = snapshot.data!.docs;

                print(snapshot.data!.size);
                if(snapshot.data!.size == 0){
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text('No documents found'),
                  );
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Set the desired number of columns
                        crossAxisSpacing: 30.0,
                        mainAxisSpacing: 30.0,
                      ),
                      itemCount: allFolders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            print( snapshot.data!.docs[index]["Name"],);
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return AllCases(FolderName:  snapshot.data!.docs[index]["Name"]);
                            }));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 2.5)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/folder.png",fit: BoxFit.scaleDown,height: 50,width: 50,),
                                  const SizedBox(height: 10),
                                  Text(snapshot.data!.docs[index]["Name"] ?? ''),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child:  Container(
              alignment: Alignment.center,
              child: AdWidget(ad: _bannerAd),
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
            ),
          )


        ],
      ),
    );
  }
}
