import 'package:flutter/material.dart';

class DateTimeDemo extends StatefulWidget {
  const DateTimeDemo({Key? key}) : super(key: key);

  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime datetime = DateTime(2022, 12, 11, 11, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:
          AppBar(title: Text("Date Time"), backgroundColor: Colors.blueGrey),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Topic 2: Date & Time Picker",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text(datetime.year.toString() +
                          "/" +
                          datetime.month.toString() +
                          "/" +
                          datetime.day.toString()),
                      onPressed: () async {
                        final date = await showDatePicker(
                            context: context,
                            initialDate: datetime,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (date == null) return;
                        setState(() => datetime = date as DateTime);
                      },
                    ),
                  ),


              ElevatedButton(
                child: Text(datetime.hour.toString().padLeft(2,'0')+":"+datetime.minute.toString().padLeft(2,'0')),
                onPressed: () async {
                  final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: datetime.hour, minute: datetime.minute),
                  );
                  if (time == null) return;
                  final newdate=DateTime(
                      datetime.year,
                      datetime.month,
                      datetime.day,
                      time.hour,
                      time.minute);
                  setState(() => datetime = newdate);
                },
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
