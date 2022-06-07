import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTitle_var1(String val) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      val,
      style: GoogleFonts.breeSerif(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    ),
  );
}

TextTitle_var2(String val, bool opacity) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      val,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: opacity ? Colors.grey[400] : Colors.black,
      ),
    ),
  );
}

SubTitle_var1(String val) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      val,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      ),
    ),
  );
}

SubTitle_var2(String val) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      val,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      ),
    ),
  );
}

MiniTextTitle(String val) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      val,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}

MiniSubTitle(String val) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      val,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[400],
      ),
    ),
  );
}

Digits(String val) {
  return Text(
    val,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}
