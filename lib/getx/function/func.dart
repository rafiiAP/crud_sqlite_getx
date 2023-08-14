import 'package:intl/intl.dart';

class C {
  static timeFormate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MMMM-yyyy').format(now);
    return formattedDate;
  }
}
