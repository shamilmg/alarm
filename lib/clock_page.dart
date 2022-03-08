import 'dart:async';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:alarm/clok_view.dart';
import 'package:alarm/theme_data.dart';
import 'package:flutter/material.dart';


class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();

}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedData = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset
        .toString()
        .split('.')
        .first;
    var offsetSing = '';
    if (!timezoneString.startsWith('-')) offsetSing = '+';
    print(timezoneString);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Часы',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor, fontSize: 24),),
          ),

          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(fontFamily: 'avenir',
                      color: Colors.white, fontSize: 64),
                ),
                Text(
                  formattedData,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w300,
                      color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),

          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery
                    .of(context)
                    .size
                    .height / 4,),),),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Часовой пояс',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w500,
                      color: Colors.white, fontSize: 24),
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Icon(Icons.language,
                      color: Colors.white,),
                    SizedBox(width: 4,),
                    Text(
                      'RUS' + offsetSing + timezoneString,
                      style: TextStyle(fontFamily: 'avenir',
                          color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
