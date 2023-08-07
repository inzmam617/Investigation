import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'AlarmLists.dart';

class courtdate extends StatefulWidget {
  const courtdate({Key? key}) : super(key: key);

  @override
  State<courtdate> createState() => _courtdateState();
}

class _courtdateState extends State<courtdate> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController casenumber = TextEditingController();
  TextEditingController reminder = TextEditingController();

  DateTime Date =DateTime.now();
  TimeOfDay Time = TimeOfDay.now();
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState(){
    super.initState();
    _assetsAudioPlayer.open(
        Playlist(
          audios: [
            Audio('assets/nokia_sms_tone.mp3'),

          ],
        ),
        showNotification: false,
        autoStart: false,
        loopMode: LoopMode.none);


  }
  String _formatDateTime(DateTime dateTime) {
    // Format the DateTime object to display only the date in a specific format.
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }
  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final TimeOfDay pickedTime = timeOfDay;
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
    final DateFormat formatter = DateFormat.jm(); // Format: 6:00 AM
    return formatter.format(dateTime);
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        Date = picked;
        date.text =    _formatDateTime(_selectedDate); // Update the TextEditingController value.
        if (kDebugMode) {
          print(date.text);
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        Time =picked;
        time.text =  _formatTimeOfDay(_selectedTime)  ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(

                  color: Colors.black,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 140,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(0),
                                bottomLeft: Radius.circular(0))),
                      ),
                      Transform.translate(
                        offset: const Offset(-130, 0),
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(Icons.arrow_back_ios, size: 14),
                            )),
                      ),
                      Transform.translate(
                        offset: const Offset(-115, 0),
                        child: const Text(
                          'Court date',
                        ),
                      ),
                      Transform.translate(
                          offset: const Offset(10, 10),
                          child: Image.asset('assets/court.png')),


                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey),
                              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ))
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                              return const AlarmsLists();
                            }));
                          }, child: const Text("See the List")),
                    ],
                  )
                ],
              ),
            ),
           Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.3,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Text('Date:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                              Expanded(
                                child: TextField(
                                  controller: date,
                                  // enabled: false,
                                  onTap: (){
                                    if (kDebugMode) {
                                      print("object");
                                    }
                                    _selectDate(context);
                                  },
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 8,left: 20),
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border:InputBorder.none,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric( horizontal: 10),
                          child: Row(
                            children: [
                              const Text('Time:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                child: TextField(
                                  onTap: (){
                                    _selectTime(context);
                                  },
                                  readOnly: true,
                                  controller: time,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 8,left: 20),

                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.white,
                                    border: InputBorder.none,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children:  [
                              const Text('Note:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Expanded(
                                child: TextField(
                                  controller: note,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 8,left: 20),
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children:  [
                              const Text('Case#:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Expanded(
                                child: TextField(
                                  controller: casenumber,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 8,left: 20),
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 3)
                          ],
                        ),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children:  [
                              const Text('Reminder:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Expanded(
                                child: TextField(
                                  controller: reminder,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 8,left: 20),
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 3.5, color: Colors.grey)
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: SizedBox(
                  width: 160,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)))),
                      onPressed: () {
                        // if (kDebugMode) {
                        //   print(time.text);
                        //   print(note.text);
                        //   print(casenumber.text);
                        //   print(reminder.text);
                        //   print(date.text);
                        //
                        // }

                        // Schedule the alarm using the "alarm" package

                        setAlarm(note.text ,casenumber.text  ,reminder.text);
                      },
                      child: const Text(
                        'Save',
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
  Future<void> _showMyDialog(String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),

          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(text),

              ],
            ),
          ),
          actions: <Widget>[

            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> setAlarm(String message, String text ,String title ) async {
    final String dateInput = date.text;
    final String timeInput = time.text;
    final List<String> dateParts = dateInput.split('-');
    final int year = int.parse(dateParts[0]);
    final int month = int.parse(dateParts[1]);
    final int day = int.parse(dateParts[2]);
    final DateFormat timeFormat = DateFormat('h:mm a');
    final DateTime parsedTime = timeFormat.parse(timeInput);
    final int hour = parsedTime.hour;
    final int minute = parsedTime.minute;

    final tz.TZDateTime selectedDateTime = tz.TZDateTime(
      tz.getLocation('US/Eastern'),
      year,
      month,
      day,
      hour,
      minute,
    );

    final Duration timeDifference = selectedDateTime.difference(tz.TZDateTime.now(tz.getLocation('US/Eastern')));

    // Calculate the difference between the selectedDateTime and the current time (now).
    // final Duration timeDifference = selectedDateTime.difference(tz.TZDateTime.now(tz.local));


    final CollectionReference alarmsCollection = FirebaseFirestore.instance.collection('alarms');

    await alarmsCollection.add({
      'message': message,
      'text': text,
      'title': title,
      'year': year,
      'month': month,
      'day': day,
      'hour': hour,
      'minute': minute,
    });

    // Show a confirmation dialog.
    _showMyDialog('Alarm set for: $year-$month-$day $hour:$minute');
    // Only schedule the notification if the selectedDateTime is in the future.
    if (timeDifference.isNegative) {
      _showMyDialog('Selected time is in the past. Please choose a future time.');
      if (kDebugMode) {
        print('Selected time is in the past. Please choose a future time.');
      }
    } else {
      final List<String> messages = [
        '$message.',
        text,
      ];


      //show alarm here chatGpt
      showAlarmNotification(selectedDateTime, messages , title);
    }
  }







Future<void> showAlarmNotification(tz.TZDateTime alarmDateTime,  List<String>  note ,String title ) async {
    final int alarmId = alarmDateTime.millisecondsSinceEpoch ~/ 1000;

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channel_id',
      'channel_name',

      importance: Importance.high,
      priority: Priority.high,
      showWhen: false,

      vibrationPattern:  Int64List.fromList([0, 1000, 500, 1000]),
    );
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await FlutterLocalNotificationsPlugin().zonedSchedule(
      alarmId,
      title,
      note.join('\n'),
      alarmDateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'alarm_data',
    );
    if (kDebugMode) {
      print('Alarm set for: $alarmDateTime');
    }
  }
}
