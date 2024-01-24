import 'package:flutter/material.dart';

import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';

class CategoriesButton extends StatelessWidget {
  const CategoriesButton({
    super.key,
    required this.onPressed,
    required this.index,
    required this.selectedIndex,
    required this.categoriesName,
  });

  final VoidCallback onPressed;
  final int index;
  final int selectedIndex;
  final String categoriesName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
          text: 'Menu',
          iconOnly: true,
          icon: Icon(
            Icons.local_drink,
            size: 22,
            color: selectedIndex == index
                ? Colours.secondaryColour
                : Colours.tertiaryColour,
          ),
          backgroundColor: selectedIndex == index
              ? Colours.accentLighterColour
              : Colours.secondaryColour,
          buttonSize: const Size(60, 60),
          radius: 100,
          horizontalPadding: 0,
          verticalPadding: 0,
          onPressed: onPressed,
          // onPressed: () {
          //   if (selectedIndex != index) {
          //     print(index);
          //     setState(() {
          //       selectedIndex = index;
          //     });
          //     _updateItems();
          //   }
          // },
        ),
        const SizedBox(
          height: 10,
        ),
        MainText(
          categoriesName,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: selectedIndex == index
              ? Colours.accentLighterColour
              : Colours.accentLighterColour,
        ),
      ],
    );
  }
}
