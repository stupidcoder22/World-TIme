import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class worldTime {
  String? flag;
  String? url;
  String? location;
  String? time;
  bool? isDay;

  worldTime({
    this.url,
    this.flag,
    this.location,
    this.time,
  });

  Future<void> getTime() async {
    try {
      Response res =
          await get(Uri.parse('http://www.worldtimeapi.org/api/timezone/$url'));
      Map finaldata = jsonDecode(res.body);
      String datetime = finaldata['datetime'];
      String offset = finaldata['utc_offset'].substring(1, 3);
      DateTime date = DateTime.parse(datetime);
      date = date.add(Duration(hours: int.parse(offset)));
      isDay = (date.hour > 6 && date.hour < 18) ? true : false;
      time = DateFormat.jm().format(date);
      // print(isDay);
    } catch (e) {
      // print("error is : $e");
      time = "could not get your data";
      isDay = false;
    }
  }
}
