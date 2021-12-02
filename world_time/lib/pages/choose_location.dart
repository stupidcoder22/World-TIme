import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class chooselocation extends StatefulWidget {
  const chooselocation({Key? key}) : super(key: key);

  @override
  _chooselocationState createState() => _chooselocationState();
}

class _chooselocationState extends State<chooselocation> {
  @override
  List<worldTime> list = [
    worldTime(location: "India", flag: "india.png", url: "Asia/Kolkata"),
    worldTime(
        location: "Australia", flag: "australia.png", url: "Australia/Eucla"),
    worldTime(location: "Canada", flag: "canada.png", url: "America/Edmonton"),
    worldTime(location: "Germany", flag: "germany.png", url: "Europe/Berlin"),
    worldTime(
        location: "Singapore", flag: "singapore.png", url: "Asia/Singapore"),
    worldTime(location: "USA", flag: "usa.png", url: "America/New_York"),
    worldTime(location: "United Kingdom", flag: "uk.png", url: "Europe/London"),
  ];

  void updateTime(index) async {
    worldTime w = list[index];
    await w.getTime();
    Navigator.pop(context, {
      'flag': w.flag,
      'location': w.location,
      'time': w.time,
      'isDay': w.isDay,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          String image = list[index].flag!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            child: Card(
              child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(list[index].location!),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/$image'),
                  )),
            ),
          );
        },
      ),
    );
  }
}
