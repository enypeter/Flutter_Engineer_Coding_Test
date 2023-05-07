import 'dart:async';
import 'package:flutter/material.dart';
import '../../helpers/const.dart';
import '../../helpers/styles.dart';
import '../../helpers/theme.dart';
import '../../models/carousel_model.dart';
import 'home_widgets.dart';

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
        bgColor: const Color(0xFFE5E8E7)),
    CarouselModel(
        hashTag: "#BEAUTYSALE",
        title: "DISCOVER OUR BEAUTY SELECTION",
        image: "assets/images/cosmetic.png",
        bgColor: const Color(0xFFFFF3EE))
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
    _pageController.dispose();    super.dispose();
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
      if(mounted) {
        _pageController.animateToPage(
        _currentIndex == 0 ? 1 : 0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInCubic,
      );
      }
    });
  }
}

class DashboardCarouselCard extends StatelessWidget {
  final CarouselModel data;
  final int index;
  final int currentIndex;
  final int count;

  const DashboardCarouselCard(
      {super.key,
        required this.data,
        required this.index,
        required this.currentIndex,
        required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [data.bgColor.withOpacity(0.4), data.bgColor])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(left: BODYPADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.hashTag,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: PageIndicator(
                    index: index,
                    count: count,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.only(left: BODYPADDING, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(data.title,
                          style: bigStyle()
                              .copyWith(fontSize: index == 1 ? 20 : null)),
                      if (data.description != null)
                        Text(data.description!, style: descriptStyle()),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: DARK),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(19, 10, 19, 10),
                          child: Text(
                            'Check this out',
                            style: TextStyle(color: WHITE, fontSize: 13),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        data.image,
                        width: 350,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}


class PageIndicator extends StatelessWidget {
  final int index;
  final int count;

  const PageIndicator({super.key, required this.index, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          count,
              (i) => indicator(
              width: i == index ? 12 : 3, opacity: i == index ? 1 : 0.3)),
    );
  }
}

