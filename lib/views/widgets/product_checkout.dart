import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/assets.dart';
import '../../helpers/theme.dart';

class ProductCheckoutSheet extends StatelessWidget {
  const ProductCheckoutSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        color: WHITE,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total Price',
                    style: TextStyle(color: TEXTGREY),
                  ),
                  Text('\$12.00',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                        fontFamily: 'Konk',
                        color: PRIMARYCOLOR,
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: PRIMARYCOLOR,
                        borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(5))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.bag,
                          color: WHITE,
                          width: 22,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '1',
                          style: TextStyle(
                              fontSize: 16,
                              color: WHITE,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: DARK,
                        borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(5))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 15.6),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                          color: WHITE,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  }
}
