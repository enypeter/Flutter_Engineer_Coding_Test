import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:monie_point_test/helpers/assets.dart';
import 'package:monie_point_test/helpers/const.dart';
import 'package:monie_point_test/helpers/theme.dart';

import '../../helpers/badge.dart';
import '../../helpers/styles.dart';
import '../widgets/product_checkout.dart';
import '../widgets/product_detail_body.dart';
import '../widgets/product_detail_widgets.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isFavorite = true;
  String selectedTab = 'About Item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND,
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            detailAppBar(),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                kSpacing(),
                productImage(widget.image)
                    .animate()
                    .fadeIn(duration: 380.ms)
                    .slide(
                        begin:
                            SlideEffect.neutralValue.copyWith(dx: 0, dy: 0.5),
                        end: SlideEffect.neutralValue),
                kSpacing(),
                Animate(
                  effects: [
                    FadeEffect(delay: 400.ms),
                    SlideEffect(
                        begin:
                            SlideEffect.neutralValue.copyWith(dx: 0, dy: 0.5),
                        end: SlideEffect.neutralValue)
                  ],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.storefront, color: TEXTGREY, size: 15),
                          SizedBox(width: 5),
                          Text(
                            'Shirt',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: TEXTGREY),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                          'Essentials Men\'s Short-Sleeve \nCrewneck T-Shirt',
                          style: TextStyle(
                              height: 1.4,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: GOLD, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                '4.9 Ratings',
                                style: descriptStyle(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.circle,
                                  color: TEXTGREY, size: 5),
                              const SizedBox(width: 5),
                              Text(
                                '2.3k+ Reviews ',
                                style: descriptStyle(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.circle,
                                  color: TEXTGREY, size: 5),
                              const SizedBox(width: 5),
                              Text(
                                '2.9k+ Sold ',
                                style: descriptStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                kSpacing(),
                Row(
                  children: [
                    tab('About Item'),
                    tab('Reviews'),
                  ],
                ).animate().fadeIn(duration: 410.ms).slide(
                    begin: SlideEffect.neutralValue.copyWith(dx: 0, dy: 0.5),
                    end: SlideEffect.neutralValue),
                Animate(
                  effects: [
                    FadeEffect(delay: 420.ms),
                    SlideEffect(
                        begin:
                            SlideEffect.neutralValue.copyWith(dx: 0, dy: 0.5),
                        end: SlideEffect.neutralValue)
                  ],
                  child: ProductDetailBody(
                    image: widget.image,
                  ),
                ),
              ],
            )),
            const ProductCheckoutSheet()
                .animate()
                .fadeIn(duration: 400.ms)
                .slide(
                    begin: SlideEffect.neutralValue.copyWith(dx: 0, dy: 0.5),
                    end: SlideEffect.neutralValue),
          ]),
        ));
  }

  Padding detailAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => Get.back(), child: SvgPicture.asset(AppIcons.back)),
          Row(
            children: [
              InkWell(
                onTap: () => setState(() => isFavorite = !isFavorite),
                child: SvgPicture.asset(
                  isFavorite ? AppIcons.favorite_fill : AppIcons.favorite,
                  color: isFavorite ? RED : DARK,
                  width: 30,
                ),
              ),
              const SizedBox(width: 15),
              SvgPicture.asset(
                AppIcons.share,
                width: 25,
              ),
              const SizedBox(width: 15),
              buildBadge(AppIcons.bag, '1'),
            ],
          ),
        ],
      ),
    );
  }

  Expanded tab(title) {
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedTab = title),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: selectedTab == title
                          ? PRIMARYCOLOR
                          : LIGHTGREY.withOpacity(0.3),
                      width: 2))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(title,
                  style: titleStyle().copyWith(
                      color: selectedTab == title ? PRIMARYCOLOR : TEXTGREY)),
            ),
          ),
        ),
      ),
    );
  }
}
