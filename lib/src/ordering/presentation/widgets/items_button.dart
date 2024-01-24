import 'package:flutter/material.dart';
import 'package:klarcafe/src/ordering/presentation/widgets/items_image.dart';

import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/res/colours.dart';

class ItemsButton extends StatelessWidget {
  const ItemsButton({
    super.key,
    required this.onPressed,
    required this.index,
    required this.selectedIndex,
    required this.itemsName,
    required this.itemsPrice,
  });

  final VoidCallback onPressed;
  final int index;
  final int selectedIndex;
  final String itemsName;
  final String itemsPrice;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0,
          padding: const EdgeInsets.all(0),
          backgroundColor: Colours.accentDarkerColour),
      onPressed: onPressed,
      child: Column(
        children: [
          const ItemsImage(),
          const SizedBox(
            height: 4,
          ),
          MainText(
            itemsName,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Colours.accentLighterColour,
          ),
          const SizedBox(
            height: 1,
          ),
          MainText(
            itemsPrice,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colours.accentLighterColour,
          ),
        ],
      ),
    );
  }
}
