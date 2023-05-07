import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../helpers/assets.dart';
import '../../helpers/theme.dart';
import '../screens/product_detail.dart';

Expanded productCard({image, isFav = false}) {
  return Expanded(
    child: InkWell(
      onTap: () => Get.to(() => ProductDetail(
        image: image,
      )),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: LIGHTGREY.withOpacity(0.1),
            image: DecorationImage(
              image: AssetImage('assets/images/$image.png'),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    isFav ? AppIcons.favorite_fill : AppIcons.favorite,
                    width: 30,
                    color: isFav ? RED : null,
                  ),
                )),
            Container(
              decoration: const BoxDecoration(color: WHITE),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Shirt',
                    style: TextStyle(color: TEXTGREY),
                  ),
                  const SizedBox(height: 8),
                  const Text('Essentials Men\'s Short-Sleeve Crewneck T-Shirt',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star, color: GOLD, size: 15),
                          SizedBox(width: 5),
                          Text(
                            '4.9 | 2356',
                            style: TextStyle(color: TEXTGREY),
                          ),
                        ],
                      ),
                      const Text('\$12.00',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            fontFamily: 'Konk',
                            color: PRIMARYCOLOR,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
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

Widget categoryButton(icon, title) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            color: LIGHTGREY.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            icon,
            height: 20,
            color: GREY,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        title,
        style: const TextStyle(color: TEXTGREY, fontSize: 12),
      )
    ],
  );
}