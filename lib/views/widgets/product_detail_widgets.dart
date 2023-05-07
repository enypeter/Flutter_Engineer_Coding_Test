import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/const.dart';
import '../../helpers/styles.dart';
import '../../helpers/theme.dart';

Divider divider() => Divider(
  thickness: 2,
  color: LIGHTGREY.withOpacity(0.2),
);


Widget descriptionTile(title, description) {
  return RichText(
      text: TextSpan(style: descriptStyle(), children: [
        TextSpan(text: '$title: '),
        TextSpan(text: ' $description', style: descriptStyle2()),
      ]));
}

Padding productImage(image) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 420,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: LIGHTGREY.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(BODYPADDING),
        child: Stack(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: BODYPADDING + 10),
              child: Image.asset('assets/images/$image.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productOtherImages('assets/images/$image.png'),
                const SizedBox(height: 10),
                productOtherImages('assets/images/$image.png'),
                const SizedBox(height: 10),
                productOtherImages('assets/images/$image.png'),
                const SizedBox(height: 10),
                productOtherImages('assets/images/$image.png'),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}


Container productOtherImages(image) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        color: LIGHTGREY.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        )),
  );
}

Widget productOtherImages2(image, {andMore = false}) {
  return Expanded(
    child: Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: LIGHTGREY.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              )),
        ),
        if (andMore)
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: DARK.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '132+',
                style: TextStyle(color: WHITE, fontSize: 15),
              ),
            ),
          ),
      ],
    ),
  );
}

Icon star({isHalf = false, isEmpty = false}) => Icon(
  isHalf
      ? Icons.star_half_rounded
      : isEmpty
      ? Icons.star_border_rounded
      : Icons.star_rounded,
  color: GOLD,
  size: 20,
);

Widget progress(double percentage) {
  return Container(
    height: 10,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: LIGHTGREY.withOpacity(0.3)),
    padding: EdgeInsets.only(right: Get.width - (Get.width * percentage)),
    child: Container(
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: PRIMARYCOLOR),
    ),
  );
}

Row descriptionText(text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(5.0),
        child: Icon(Icons.circle, size: 7, color: TEXTGREY),
      ),
      Expanded(
        child: Text(text, style: descriptStyle()),
      ),
    ],
  );
}


Padding progressRating(value, reviews, double percentage) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      children: [
        star(),
        kSmallHorSpace(),
        Text(
          value,
          style: const TextStyle(color: TEXTGREY, fontSize: 16),
        ),
        kSmallHorSpace(),
        Expanded(flex: 4, child: progress(percentage)),
        kSmallHorSpace(),
        Expanded(
          child: Text(
            reviews,
            style: const TextStyle(
                color: DARK, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}



Padding pages(pageNumber) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(pageNumber),
  );
}

Container arrow(icon, {isLast = false}) {
  return Container(
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: LIGHTGREY.withOpacity(0.1),
                offset: const Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 1),
            BoxShadow(
                color: LIGHTGREY.withOpacity(0.2),
                offset: const Offset(-1, -1),
                blurRadius: 1,
                spreadRadius: 1),
          ],
          shape: BoxShape.circle,
          color: isLast ? WHITE : LIGHTGREY.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 20,
        ),
      ));
}

Column reviews() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/images.jpeg'))),
          ),
          kHorSpacing(),
          Expanded(
              child: Text(
                'Eren Y***r',
                style: titleStyle(),
              )),
          Row(
            children: [
              star(),
              const SizedBox(width: 3),
              Text('5.0', style: titleStyle()),
              const SizedBox(width: 5),
              const Icon(
                Icons.more_horiz_outlined,
                color: LIGHTGREY,
                size: 40,
              )
            ],
          ),
        ],
      ),
      kSpacing(),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          reviewFeedback('Product in good condition'),
          reviewFeedback('Very fast delivery'),
          reviewFeedback('Fast seller response'),
        ],
      ),
      kSpacing(),
      Text(
        'According to my experience. This is the best.\nThank you',
        style: descriptStyle().copyWith(color: DARK, height: 1.4),
      ),
      kSpacing(),
      Row(
        children: [
          const Icon(
            Icons.thumb_up_sharp,
            color: PRIMARYCOLOR,
          ),
          kHorSpacing(),
          Text(
            'Helpful ?',
            style: titleStyle().copyWith(color: PRIMARYCOLOR),
          ),
          const Spacer(),
          Text(
            'Yesterdays',
            style: descriptStyle(),
          ),
        ],
      ),
      kSpacing(),
      divider(),
      kSpacing(),
    ],
  );
}

Container reviewFeedback(text) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: PRIMARYCOLOR),
        borderRadius: BorderRadius.circular(15),
        color: PRIMARYCOLOR.withOpacity(0.2)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 3),
      child: Text(
        text,
        style: const TextStyle(color: PRIMARYCOLOR, fontSize: 11),
      ),
    ),
  );
}