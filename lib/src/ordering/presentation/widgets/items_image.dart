import 'package:flutter/material.dart';

import '../../../../core/res/colours.dart';

class ItemsImage extends StatelessWidget {
  const ItemsImage({
    super.key,
    this.height,
    this.width,
    this.imageUrl,
  });

  final double? height;
  final double? width;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null ? height! * 1.3 : 130,
      width: width ?? 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: height ?? 100,
            width: width ?? 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colours.accentColour,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            child: Transform.translate(
              offset: width != null
                  ? Offset(0, width! / 2.941)
                  : const Offset(0, 34),
              child: Transform.scale(
                scale: 1.4,
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  imageUrl ??
                      'https://www.thecocktaildb.com/images/ingredients/gin-Medium.png',
                  width: width != null ? width! * 2.5 : 250,
                  height: height != null ? height! * 1.5 : 150,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
