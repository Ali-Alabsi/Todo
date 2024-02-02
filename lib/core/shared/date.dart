
import 'package:intl/intl.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MMM-dd').format(now);
String formattedTime = DateFormat('hh:mm').format(now);