import 'dart:math' show max;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surfgear_webpage/assets/images.dart';
import 'package:surfgear_webpage/assets/text_styles.dart';
import 'package:surfgear_webpage/components/menu.dart';
import 'package:surfgear_webpage/pages/main/main_page.dart';

class MainPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _LogoAndText();
  }
}

class _LogoAndText extends StatefulWidget {
  @override
  __LogoAndTextState createState() => __LogoAndTextState();
}

class __LogoAndTextState extends State<_LogoAndText> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    // if (!_visible) {
    //   Future.delayed(const Duration(milliseconds: 1000),
    //       () => setState(() => _visible = true));
    // }

    final children = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 56.0,
          vertical: 32.0,
        ),
        child: Image.asset(imgLogo),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 56.0,
          vertical: 32.0,
        ),
        child: AutoSizeText(
          'Плагины для Flutter-проектов',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: pageHeadlineTextStyle(color: Colors.white),
        ),
      ),
    ];

    if (MediaQuery.of(context).size.width > MEDIUM_SCREEN_WIDTH) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }
  }
}