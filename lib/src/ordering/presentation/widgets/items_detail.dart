import 'package:flutter/material.dart';
import 'package:klarcafe/core/res/colours.dart';
import 'package:klarcafe/src/ordering/presentation/widgets/items_image.dart';

import '../../../../core/common/widgets/main_text.dart';

class ItemsDetail extends StatefulWidget {
  const ItemsDetail({super.key});

  @override
  State<ItemsDetail> createState() => _ItemsDetailState();
}

class _ItemsDetailState extends State<ItemsDetail> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ItemsImage(
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: MainText(
                  'Americano Dingin',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colours.primaryColour,
                ),
              ),
              MainText(
                'Rp20.000',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          MainText(
            'Culture Description',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
