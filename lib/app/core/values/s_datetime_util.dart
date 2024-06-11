import 'package:intl/intl.dart';

class SDateTimeUtil {
  SDateTimeUtil._();

  // Commonly used format patterns
  static const String formatPattern1 = 'yyyy-MM-dd HH:mm:ss';
  static const String formatPattern2 = 'yyyy/MM/dd HH:mm:ss';

  static const String formatPattern3 = 'MM/dd/yyyy hh:mm a';
  static const String formatPattern4 = 'yyyy-MM-dd HH:mm';
  static const String formatPattern5 = 'MMMM dd, yyyy';
  static const String formatPattern6 = 'd MMM, yyyy';
  static const String formatPattern7 = 'hh:mm a';
  static const String formatPattern8 = 'yyyy-MM-dd';
  static const String formatPattern9 = 'dd/MM/yyyy';

  static const String formatPattern10 = 'MMMM dd, yyyy hh:mm a';
  static const String formatPattern11 = 'EEE, MMM d, ' 'yy';
  static const String formatPattern12 = 'HH:mm:ss';
  static const String formatPattern13 = 'yyyy/MM/dd';
  static const String formatPattern14 = 'dd/MM/yyyy HH:mm';
  static const String formatPattern15 = 'MMM d, yyyy';
  static const String formatPattern16 = 'dd-MM-yyyy';
  static const String formatPattern17 = 'yyyy.MM.dd';
  static const String formatPattern18 = 'MM-dd-yyyy';

  static const String formatPattern19 = 'HH:mm';

  static const String formatPattern20 = 'd MMM, yyyy HH:mm';
  static const String formatPattern21 = 'yyyy-MM-ddTHH:mm:ss';
  static const String formatPattern22 = 'dd/MM/yyyy h:mm:ss a';
  static const String formatPattern23 = 'yyyy/MM/dd hh:mm a';
  static const String formatPattern24 = 'dd-MM-yyyy HH:mm:ss';
  static const String formatPattern25 = 'yyyy.MM.dd HH:mm:ss';
  static const String formatPattern26 = 'dd/MM/yyyy HH:mm:ss';
  static const String formatPattern27 = 'EEE, MMM dd, yyyy';
  static const String formatPattern28 = 'dd/MM/yy hh:mm a';
  static const String formatPattern29 = 'MMMM dd, yyyy hh:mm:ss a';
  static const String formatPattern30 = 'dd-MMM-yyyy HH:mm:ss';
  static const String formatPattern31 = 'yy-MM-dd HH:mm';
  static const String formatPattern32 = 'yyyy-MM-ddTHH:mm:ss.SSS';
  static const String formatPattern33 = 'dd.MM.yy HH:mm:ss';
  static const String formatPattern34 = 'MM/dd/yyyy HH:mm';
  static const String formatPattern35 = 'd MMM, yyyy h:mm a';
  static const String formatPattern36 = 'yyyy-MM-ddTHH:mm:ss.SSSZ';
  static const String formatPattern37 = 'dd/MM/yyyy h:mm a';
  static const String formatPattern38 = 'HH:mm:ss.SSS';
  static const String formatPattern39 = 'yyyy-MM-dd HH:mm:ss.SSS';
  static const String formatPattern40 = 'dd/MM/yyyy HH:mm:ss.SSS';
  static const String formatPattern41 = 'MM/dd/yyyy h:mm:ss a';
  static const String formatPattern42 = 'yyyy.MM.dd h:mm:ss a';
  static const String formatPattern43 = 'dd/MM/yyyy h:mm:ss a';
  static const String formatPattern44 = 'EEE, MMM dd, yyyy hh:mm a';
  static const String formatPattern45 = 'dd-MM-yyyy h:mm:ss a';
  static const String formatPattern46 = 'yyyy.MM.dd hh:mm a';
  static const String formatPattern47 = 'MMM dd, yyyy h:mm:ss a';
  static const String formatPattern48 = 'd MMM, yyyy HH:mm:ss';
  static const String formatPattern49 = 'dd/MM/yy h:mm:ss a';
  static const String formatPattern50 = 'MM/dd/yyyy h:mm a';

  // Convert a formatted string to DateTime
  static DateTime stringToDateTime(String formattedString, String format) {
    try {
      final dateTime = DateFormat(format).parse(formattedString);
      return dateTime;
    } catch (e) {
      throw Exception('Invalid date format or input: $e');
    }
  }

  // Convert DateTime to a formatted string
  static String dateTimeToString(DateTime dateTime, String format) {
    try {
      final formattedString = DateFormat(format).format(dateTime);
      return formattedString;
    } catch (e) {
      throw Exception('Invalid date format: $e');
    }
  }

  // Example usage:
  // String formattedDateString = TimeUtil.dateTimeToString(DateTime.now(), 'yyyy-MM-dd HH:mm:ss');
  // DateTime dateTime = TimeUtil.stringToDateTime('2023-09-18 15:30:00', 'yyyy-MM-dd HH:mm:ss');
}
