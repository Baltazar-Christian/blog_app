// ----- STRINGS ------
import 'package:flutter/material.dart';

const baseURL = 'http://192.168.7.249:9000/api';
const loginURL = '$baseURL/login';
const registerURL = '$baseURL/register';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/user';
const postsURL = '$baseURL/posts';
const productsURL = '$baseURL/products';
const venuesURL = '$baseURL/venues';
const eventsURL = '$baseURL/events';
const commentsURL = '$baseURL/comments';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

// --- input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
    // labelText: label,
    filled: true,
    fillColor: Color.fromARGB(218, 228, 135, 4).withOpacity(0.2),
    contentPadding: const EdgeInsets.all(10),
    border: const OutlineInputBorder(
        borderSide:
            BorderSide(width: 1, color: Color.fromARGB(218, 228, 135, 4))),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Color.fromARGB(
              218, 228, 135, 4)), // Border color when the field is in focus
    ),
    // enabledBorder: const OutlineInputBorder(
    //   borderSide: BorderSide(
    //       color: Color.fromARGB(255, 237, 102, 29)), // Default border color
    // ),
  );
}

// button

TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(
      label,
      style: const TextStyle(color: Colors.black),
    ),
    style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => Color.fromARGB(218, 228, 135, 4)),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.symmetric(vertical: 15))),
    onPressed: () => onPressed(),
  );
}

// loginRegisterHint
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: const TextStyle(color: Color.fromARGB(218, 228, 135, 4)),
      ),
      GestureDetector(
          child: Text(label,
              style: const TextStyle(color: Color.fromARGB(218, 228, 135, 4))),
          onTap: () => onTap())
    ],
  );
}

// likes and comment btn

Expanded kLikeAndComment(
    int value, IconData icon, Color color, Function onTap) {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              const SizedBox(width: 4),
              Text('$value')
            ],
          ),
        ),
      ),
    ),
  );
}
