import 'package:intl/intl.dart';
import '../models/subscription.dart';

String timestampToDatestring(int unixTimestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      unixTimestamp * 1000,
    );
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
  
int addTimeToActualDate(DateTime actualDate, Period period) {
    DateTime newDate;
    switch (period) {
      case Period.DAILY:
        newDate = actualDate.add(Duration(days: 1));
        break;
      case Period.WEEKLY:
        newDate = actualDate.add(Duration(days: 7));
        break;
      case Period.MONTHLY:
        newDate = DateTime(actualDate.year, actualDate.month + 1, actualDate.day);
        break;
      case Period.YEARLY:
        newDate = DateTime(actualDate.year + 1, actualDate.month, actualDate.day);
        break;
      default:
        newDate = actualDate;
    }
    return (newDate.millisecondsSinceEpoch / 1000).round();
}