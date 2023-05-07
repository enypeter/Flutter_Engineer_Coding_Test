import 'package:flutter/material.dart';

import 'theme.dart';

TextStyle bigStyle() {
  return const TextStyle(fontSize: 42, fontWeight: FontWeight.w700);
}


TextStyle titleStyle() {
  return const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: DARK,
    fontFamily: 'Outfit',
  );
}

TextStyle descriptStyle() {
  return const TextStyle(
      height: 1.1,
      fontSize: 16,
      fontFamily: 'Outfit',
      fontWeight: FontWeight.w500,
      color: TEXTGREY);
}


TextStyle descriptStyle2() {
  return const TextStyle(
      fontFamily: 'Outfit',
      height: 1.1,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: DARK);
}

