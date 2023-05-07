import 'package:flutter/material.dart';

import '../../helpers/const.dart';
import '../../helpers/styles.dart';
import '../../helpers/theme.dart';
import 'home_widgets.dart';
import 'product_detail_widgets.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  bool showMore = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        kSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: descriptionTile('Brand', 'ChArmkpR')),
            Expanded(child: descriptionTile('Color', 'Aprkot')),
          ],
        ),
        kSpacing(),
        Row(
          children: [
            Expanded(child: descriptionTile('Category', 'Casual Shirt')),
            Expanded(child: descriptionTile('Material', 'Polyester')),
          ],
        ),
        kSpacing(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: descriptionTile('Condition', 'New')),
          Expanded(child: descriptionTile('Heavy', '200 g'))
        ]),
        kSpacing(),
        Text('Description:', style: titleStyle()),
        const SizedBox(height: 15),
        descriptionText(
            'Long-sleeve shirt in clasic fit featuring button-down collar'),
        const SizedBox(height: 5),
        descriptionText('Patch Pocket on Left Chest'),
        const SizedBox(height: 5),
        descriptionText('Durable Combination Cotton Fabric'),
        const SizedBox(height: 5),
        descriptionText(
            'Go To Classic button down shirt for all special occasions'),
        kSpacing(),
        Text(
            'Chat us Long-sleeve shirt in classic fit featuring button-down collar',
            style: descriptStyle()),
        kSpacing(),
        Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                trailing: const SizedBox.shrink(),
                initiallyExpanded: true,
                maintainState: true,
                onExpansionChanged: (value) {
                  setState(() => showMore = value);
                },
                title: Row(
                  children: [
                    Text(
                      showMore ? "See less" : "See more",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: PRIMARYCOLOR),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      showMore ? Icons.expand_less : Icons.expand_more,
                      color: GREY,
                    )
                  ],
                ),
                children: [
                  divider(),
                  kSpacing(),
                  Text('Shipping Information:', style: titleStyle()),
                  kSpacing(),
                  descriptionTile(
                      'Delivery', 'Shipping from Jakarta, Indonesia'),
                  kSpacing(),
                  descriptionTile('Shipping', 'FREE International Shipping'),
                  kSpacing(),
                  descriptionTile(
                      'Arrive', 'Estimate arrival on 25 - 27 Oct., 2022'),
                  kSpacing(),
                  divider(),
                  kSpacing(),
                  Text('Seller Information:', style: titleStyle()),
                  kSpacing(),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: TEXTGREY.withOpacity(0.2)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'Thrifting Store.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 13),
                              )),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: WHITE, width: 2),
                                  color: TEXTGREY.withOpacity(0.4)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Thrifting_Store', style: descriptStyle2()),
                            const SizedBox(height: 10),
                            Text('Active 5 Min ago | 96.7% Positive Feedback',
                                style: descriptStyle().copyWith(fontSize: 13)),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: PRIMARYCOLOR),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 10),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.storefront,
                                            color: PRIMARYCOLOR, size: 17),
                                        SizedBox(width: 8),
                                        Text(
                                          'Visit store',
                                          style: TextStyle(
                                              color: PRIMARYCOLOR,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ])),
        kSpacing(),
        divider(),
        kSpacing(),
        Text('Reviews & Ratings', style: titleStyle()),
        Row(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(color: TEXTGREY),
                            children: [
                          TextSpan(
                              text: '4.9',
                              style: bigStyle().copyWith(color: DARK)),
                          const TextSpan(text: ' /5.0'),
                        ])),
                    Row(
                      children: [
                        star(),
                        star(),
                        star(),
                        star(),
                        star(isHalf: true),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  '2.3k+ Reviews',
                  style: TextStyle(color: TEXTGREY),
                )
              ],
            ),
            kHorSpacing(),
            Expanded(
              child: Column(
                children: [
                  progressRating('5', '1.5k', 1.0),
                  progressRating('4', '710', 0.9),
                  progressRating('3', '140', 0.8),
                  progressRating('2', '10', 0.7),
                  progressRating('1', '4', 0.63),
                ],
              ),
            ),
          ],
        ),
        kSpacing(),
        Text('Reviews with images & videos', style: titleStyle()),
        kSpacing(),
        Row(
          children: [
            productOtherImages2('assets/images/${widget.image}.png'),
            kHorSpacing(),
            productOtherImages2('assets/images/${widget.image}.png'),
            kHorSpacing(),
            productOtherImages2('assets/images/${widget.image}.png'),
            kHorSpacing(),
            productOtherImages2('assets/images/${widget.image}.png',
                andMore: true),
          ],
        ),
        kSpacing(),
        divider(),
        Text('Top Reviews', style: titleStyle()),
        Row(
          children: [
            Expanded(
                child:
                    Text('Showing 3 of 2.3k+ reviews', style: descriptStyle())),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: LIGHTGREY.withOpacity(0.7))),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  const Text('Popular'),
                  kHorSpacing2(),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: LIGHTGREY,
                  )
                ],
              ),
            )
          ],
        ),
        kSpacing(),
        ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (_, i) => reviews(),
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        Row(
          children: [
            arrow(Icons.chevron_left),
            kHorSpacing1(),
            pages('1'),
            pages('2'),
            pages('3'),
            pages('....'),
            kHorSpacing1(),
            arrow(Icons.chevron_right, isLast: true),
            const Spacer(),
            const Text(
              'See more',
              style:
                  TextStyle(color: PRIMARYCOLOR, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        kSpacing(),
        kSpacing2(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Recommendation',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text(
              'See more',
              style:
                  TextStyle(color: PRIMARYCOLOR, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        kSpacing(),
        Row(
          children: [
            productCard(image: 'prew'),
            const SizedBox(width: 20),
            productCard(image: 'shirt3'),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
