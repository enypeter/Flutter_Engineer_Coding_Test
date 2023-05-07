import 'package:flutter/material.dart';
import 'package:monie_point_test/helpers/const.dart';
import '../../helpers/styles.dart';
import '../../models/carousel_model.dart';
import '../../helpers/theme.dart';

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
                        width: 300,
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

// Widget indicator(double width, double opacity) {

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

Padding indicator({required double width, required double opacity}) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      height: 3,
      width: width,
      decoration: BoxDecoration(
          color: DARK.withOpacity(opacity),
          borderRadius: BorderRadius.circular(3)),
    ),
  );
}
