import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void showSuccessMessage(String message) {
    Get.snackbar(message, '',
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  static void showErrorMessage(String message) {
    Get.snackbar(message, '',
        backgroundColor: Colors.red, colorText: Colors.white);
  }

// get formated date to send in api.
  static String getDateYYYYMMDD() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    printLog(formattedDate); // 2016-01-25

    return formattedDate;
  }

// print only in debug mode
  static void printLog(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  static String timeAgo(DateTime date, {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static String numberGen(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(0)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(0)} B";
    } else {
      return num.toString();
    }
  }

  static void showAlertDialog(
      {required BuildContext context,
      required String title,
      required String subtitle}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  static void showAlertDialogYesNo(
      {required BuildContext context,
      required String title,
      required VoidCallback function,
      required String subtitle}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () {
                    function();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  static Future<void> launchWeb(String url) async {
    try {
      if (url.startsWith('http://') || url.startsWith('https://')) {
        if (!await launchUrl(Uri.parse(url))) {
          throw Exception('Could not launch $url');
        }
      } else {
        if (!await launchUrl(Uri.parse('https://$url'))) {
          throw Exception('Could not launch $url');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('error $e');
      }
      //Utils.showErrorMessage('Unable to launch website');
    }
  }
}
