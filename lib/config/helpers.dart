import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyHelpers {

  static Future<void> launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(url);
    } else {
      throw 'Could not launch URL: $url';
    }
  }

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

}