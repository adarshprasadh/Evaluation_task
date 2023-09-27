import 'package:evaltask_dob/constants/appconstants.dart';
import 'package:flutter/services.dart';

class DateFormatter extends TextInputFormatter {
  String dateFormat = AppConstants.dateFormat;

  String getFormattedDate(String input) {
    List<String> dateFormatList = dateFormat.split('');
    int inputLength = input.length;

    if (inputLength == 0) {
      return dateFormatList.join();
    } 
    else if (inputLength <= dateFormatList.length) {
      List<String> formattedDate = List.from(dateFormatList);

      for (int i = 0; i < inputLength; i++) {
        formattedDate[i] = input[i];
      }
      return formattedDate.join();
    } 
    else {
      return "";
    }
  }

  @override
  TextEditingValue formatEditUpdate(
  
    TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex;

    String previousText = oldValue.text;
    String currentText = newValue.text;

    int currentLength = currentText.length;
    int previousLength = previousText.length;

    if (currentLength == 1) {
      if (int.parse(currentText) > 3) {
        currentText = "0$currentText/";
      }
    } 
    else if (currentLength == 2 && previousLength == 1) {
      int day = int.parse(currentText.substring(0, 2));
      if (day == 0 || day > 31) {
        currentText = currentText.substring(0, 1);
      }
      else {
        currentText += '/';
      }
    } 
    else if (currentLength == 4) {
      if (int.parse(currentText.substring(3, 4)) > 1) {
        currentText = "${currentText.substring(0, 3)}0${currentText.substring(3, 4)}";
      } 
    } 
    else if (currentLength == 5 && previousLength == 4) {
      int month = int.parse(currentText.substring(3, 5));
      if (month == 0 || month > 12) {
        currentText = currentText.substring(0, 4);
      } 
      else {
        currentText += '/';
      }
    } 
    else if (currentLength == 3 && previousLength == 2) {
      if (int.parse(currentText.substring(2, 3)) > 1) {
        currentText = '${currentText.substring(0, 2)}/';
      } 
      else {
        currentText =
            '${currentText.substring(0, previousLength)}/${currentText.substring(previousLength, previousLength + 1)}';
      }
    } 
    else if (currentLength == 6 && previousLength == 5) {
      int year = int.parse(currentText.substring(5, 6));
      if (year < 1 || year > 2) {
        currentText = '${currentText.substring(0, 5)}/';
      } 
      else {
        currentText = '${currentText.substring(0, 5)}/${currentText.substring(5, 6)}';
      }
    } 
    else if (currentLength == 7) {
      int year = int.parse(currentText.substring(6, 7));
      if (year < 1 || year > 2) {
        currentText = currentText.substring(0, 6);
      }
    } 
    else if (currentLength == 11) {
      currentText = currentText.substring(0, 10);
    }

    selectionIndex = currentText.length;
    return TextEditingValue(
      text: currentText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
