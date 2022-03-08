import 'package:alarm/alarm_page.dart';
import 'package:alarm/clock_page.dart';
import 'package:alarm/clok_view.dart';
import 'package:alarm/data.dart';
import 'package:alarm/enums.dart';
import 'package:alarm/models/menu_info.dart';
import 'package:alarm/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenuInfo) =>
                buildMenuButton(currentMenuInfo)).toList(),
          ),
          VerticalDivider(color: Colors.white54, width: 1,),
          Expanded(

            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if(value.menuType == MenuType.clock) {
                  return ClockPage();
                } else if(value.menuType == MenuType.alarm) {
                  return AlarmPage();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? Colors.red : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,),
              SizedBox(height: 16,),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(fontFamily: 'avenir',
                    color: Colors.white, fontSize: 14),),
            ],
          ),
        );
      },
    );
  }
}
