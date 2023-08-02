import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AlarmsLists extends StatefulWidget {
  const AlarmsLists({super.key});

  @override
  State<AlarmsLists> createState() => _AlarmsListsState();
}

class _AlarmsListsState extends State<AlarmsLists> {
  // Future<List<Object?>> getAlarms() async {
  //   final CollectionReference alarmsCollection = FirebaseFirestore.instance.collection('alarms');
  //   final QuerySnapshot querySnapshot = await alarmsCollection.get();
  //   final List<Object?> alarms = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   return alarms;
  // }
  Future<List<AlarmModel>> getAlarms() async {
    final CollectionReference alarmsCollection = FirebaseFirestore.instance.collection('alarms');
    final QuerySnapshot querySnapshot = await alarmsCollection.get();
    final List<AlarmModel> alarms =
    querySnapshot.docs.map((doc) => AlarmModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    return alarms;
  }
  List<AlarmModel> alarms = [];

  Future<void> fetchAlarms() async {
    final List<AlarmModel> alarmsData = await getAlarms();

    // Get the current date and time
    final DateTime now = DateTime.now();

    // Filter out alarms with past dates and times
    final List<AlarmModel> filteredAlarms = alarmsData.where((alarm) {
      final int year = alarm.year ?? 0;
      final int month = alarm.month ?? 0;
      final int day = alarm.day ?? 0;
      final int hour = alarm.hour ?? 0;
      final int minute = alarm.minute ?? 0;

      final DateTime alarmDateTime = DateTime(year, month, day, hour, minute);
      return alarmDateTime.isAfter(now);
    }).toList();

    setState(() {
      alarms = filteredAlarms;
    });
  }


  @override
  void initState(){
    fetchAlarms();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Lists of ALarms"),

      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          alarms.length == 0 ? const Center(
            child: Text("No Alarms Activated")
          )  : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                final alarm = alarms[index];
                final String message = alarm.message ?? '';
                final String text = alarm.text ?? '';
                final String title = alarm.title ?? '';
                final String day = alarm.day?.toString() ?? '';
                final String hour = alarm.hour?.toString() ?? '';
                final String minute = alarm.minute?.toString() ?? '';
                final String year = alarm.year?.toString() ?? '';
                final String month = alarm.month?.toString() ?? '';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text("Title: $title"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Message:  $message'),
                            Text('Date : $year $hour : $minute'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
class AlarmModel {
  int? year;
  String? title;
  String? message;
  String? text;
  int? month;
  int? day;
  int? hour;
  int? minute;

  AlarmModel({
    this.text,
    this.message,
    this.title,
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
  });

  factory AlarmModel.fromJson(Map<String, dynamic> json) {
    return AlarmModel(
      year: json['year'] as int?,
      message: json['message'],
      title: json['title'],
      text: json['text'],
      month: json['month'] as int?,
      day: json['day'] as int?,
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
    );
  }
}
