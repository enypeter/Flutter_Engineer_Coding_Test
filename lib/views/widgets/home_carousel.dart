import 'dart:async';

import 'package:flutter/material.dart';
import 'carousel_card.dart';
import '../../models/carousel_model.dart';

class CarouselCard extends StatefulWidget {
  const CarouselCard({
    super.key,
  });

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  int _currentIndex = 0;
  final _pageController = PageController();

  final List<CarouselModel> _carouselData = [
    CarouselModel(
        hashTag: "#FASHION DAY",
        title: "80% OFF",
        description: "Discover fashion that suits to your style",
        image: "assets/images/hanged_shirt.png",
        bgColor: const Color(0xFFE8EBEA)),
    CarouselModel(
        hashTag: "#BEAUTYSALE",
        title: "DISCOVER OUR BEAUTY SELECTION",
        image: "assets/images/cosmetic.png",
        bgColor: const Color(0xFFEAE1E2))
  ];

  @override
  void initState() {
    if (mounted) {
      playCarousel();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _carouselData.length,
      onPageChanged: (v) {
        _currentIndex = v;
      },
      itemBuilder: (_, i) => DashboardCarouselCard(
        data: _carouselData[i],
        index: i,
        currentIndex: _currentIndex,
        count: _carouselData.length,
      ),
    );
  }

  void playCarousel() {
    Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      _pageController.animateToPage(
        _currentIndex == 0 ? 1 : 0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }
}
