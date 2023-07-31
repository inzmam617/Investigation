import 'package:flutter/material.dart';
import 'package:crime_investigation/UploadCases/scenesketch.dart';
import 'package:intl/intl.dart';

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
        print(date.text);
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
              child: Row(
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
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: const Icon(Icons.arrow_back_ios, size: 14),
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
                      child: Image.asset('assets/court.png'))
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
                                    print("object");
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
                                  decoration: InputDecoration(
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
                              Text('Case#:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Expanded(
                                child: TextField(
                                  controller: casenumber,
                                  decoration: InputDecoration(
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
                              Text('Reminder:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Expanded(
                                child: TextField(
                                  controller: reminder,
                                  decoration: InputDecoration(
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
                        print(date.text);
                        print(time.text);
                        print(note.text);
                        print(casenumber.text);
                        print(reminder.text);




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
            // SizedBox(
            //   height: 30,
            //   child: Container(
            //     decoration: const BoxDecoration(
            //         boxShadow: [
            //           BoxShadow(blurRadius: 3.5, color: Colors.grey)
            //         ],
            //         color: Colors.white,
            //         borderRadius: BorderRadius.only(
            //             topRight: Radius.circular(20),
            //             bottomRight: Radius.circular(20),
            //             topLeft: Radius.circular(20),
            //             bottomLeft: Radius.circular(20))),
            //     child: SizedBox(
            //       width: 160,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.white,
            //               shape: const RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.only(
            //                       bottomLeft: Radius.circular(20),
            //                       topLeft: Radius.circular(20),
            //                       bottomRight: Radius.circular(20),
            //                       topRight: Radius.circular(20)))),
            //           onPressed: () {
            //
            //
            //
            //           },
            //           child: const Text(
            //             'Add',
            //             style: TextStyle(color: Colors.black),
            //           )),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }




}
