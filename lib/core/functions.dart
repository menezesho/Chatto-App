import 'package:chatto/core/animations.dart';
import 'package:flutter/material.dart';

PageRouteBuilder goToPageWEaseInOutTransition(context, page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Animations().easeInOutTransition(context, animation, child);
    },
  );
}

PageRouteBuilder goToPageWFadeInTransition(context, page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Animations().fadeInTransition(context, animation, child);
    },
  );
}