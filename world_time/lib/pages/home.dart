import 'package:flutter/material.dart';

// import 'package:hexcolor/hexcolor.dart';
// #ffdeff
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};
  @override
  Widget build(BuildContext context) {
    data = data!.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    String pic = data!['isDay'] ? 'day.png' : 'night.png';
    Color color = data!['isDay']
        ? Color.fromRGBO(255, 222, 255, 1)
        : Colors.indigo.shade700;
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$pic'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Icon(Icons.edit_location),
                    TextButton(
                      child: Text(
                        'Edit location',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () async {
                        dynamic newdata =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': newdata['time'],
                            'location': newdata['location'],
                            'flag': newdata['flag'],
                            'isDay': newdata['isDay']
                          };
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data!['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data!['time'],
                  style: TextStyle(fontSize: 66.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
