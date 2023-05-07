import 'package:flutter/material.dart';

class CarouselModel {
  final String hashTag;
  final String title;
  final String? description;
  final String image;
  final Color bgColor;
  CarouselModel({
    required this.hashTag,
    required this.title,
    this.description,
    required this.image,
    required this.bgColor,
  });

  CarouselModel copyWith({
    String? header,
    String? smallTitle,
    String? mediumTitle,
    String? description,
    String? image,
    Color? bgColor,
  }) {
    return CarouselModel(
      hashTag: header ?? hashTag,
      title: mediumTitle ?? title,
      description: description ?? this.description,
      image: image ?? this.image,
      bgColor: bgColor ?? this.bgColor,
    );
  }
}
