
import 'package:alarm/enums.dart';
import 'package:alarm/models/alarm_info.dart';
import 'package:alarm/models/menu_info.dart';
import 'package:alarm/theme_data.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Часы', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Будильник', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Таймер', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Секундомер', imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
      description: 'Office',gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),
      description: 'Sport',gradientColors: GradientColors.sunset),
];