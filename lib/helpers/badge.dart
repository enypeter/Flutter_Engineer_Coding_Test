import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'theme.dart';

Badge buildBadge(image, text) {
  return Badge(
    label: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Text(text),
    ),
    backgroundColor: RED,
    child: SvgPicture.asset(
      image,
      width: 32,
      height: 32,
    ),
  );
}
