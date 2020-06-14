import 'package:flutter/material.dart';

List<BoxShadow> getBoxShadowList({double blur = 33, double spread = 6}) {
  return [
    BoxShadow(color: Color(0xfffae3f2), blurRadius: blur, spreadRadius: spread),
  ];
}
