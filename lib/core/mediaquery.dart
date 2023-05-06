import 'package:flutter/material.dart';

double getHeight(context) {
  var height = MediaQuery.of(context).size.height;
  return height;
}

double getWidth(context) {
  var width = MediaQuery.of(context).size.width;
  return width;
}
