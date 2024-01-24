import 'package:flutter/material.dart';
import 'package:klarcafe/src/ordering/presentation/widgets/items_detail.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import '../../../../core/common/widgets/bottom_sheet_widget.dart';
import '../../../../core/common/widgets/gradient_background.dart';
import '../../../../core/common/widgets/main_app_bar.dart';
import '../../../../core/common/widgets/main_screen_container.dart';
import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../widgets/categories_button.dart';
import '../widgets/items_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  static const routeName = '/menu';

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // controller for ListWheelScrollViewX
  final _categoriesController = FixedExtentScrollController();
  final _itemsController = FixedExtentScrollController();
  late List<Widget>? categories;
  late List<Widget>? items;

  int _selectedCategoriesIndex = 0;
  int _selectedItemIndex = 0;

  Widget _buildItem(String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          'https://picsum.photos/250/150',
          width: 250,
          height: 150,
        ),
        const MainText(
          'Menu',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          height: 20,
        ),
        const MainText(
          'Culture Description',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  void _updateCategories() {
    setState(() {
      categories = List.generate(
        6,
        (itemIndex) => CategoriesButton(
          categoriesName: 'Categories',
          index: itemIndex,
          selectedIndex: _selectedCategoriesIndex,
          onPressed: () {
            if (_selectedCategoriesIndex != itemIndex) {
              print(itemIndex);
              setState(() {
                _selectedCategoriesIndex = itemIndex;
                _categoriesController.animateToItem(
                  _selectedCategoriesIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              });
              _updateCategories();
            }
          },
        ),
      );
    });
  }

  void _updateItems() {
    setState(() {
      items = List.generate(
        6,
        (itemIndex) => ItemsButton(
          itemsName: 'Items',
          itemsPrice: 'Rp 10.000',
          index: itemIndex,
          selectedIndex: _selectedItemIndex,
          onPressed: () {
            print('object');
            if (_selectedItemIndex != itemIndex) {
              print(itemIndex);
              setState(() {
                _selectedItemIndex = itemIndex;
                _itemsController.animateToItem(
                  _selectedItemIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              });
              _updateItems();
            } else {
              _showModalBottomSheet(context, text: 'Menu');
            }
          },
        ),
      );
    });
  }

  @override
  void initState() {
    _updateCategories();
    _updateItems();
    super.initState();
  }

  @override
  void dispose() {
    _categoriesController.dispose();
    _itemsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colours.primaryColour,
      appBar: MainAppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.local_drink,
                size: 22,
                color: Colours.primaryColourDisabled,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText(
                  'Cafelar',
                  color: Colours.primaryColour,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                MainText(
                  'Coffee & Ice Cream',
                  color: Colours.primaryColourDisabled,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        buttonAction: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 20),
          child: Stack(
            children: [
              Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                  color: Colours.primaryColour,
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colours.accentDarkerColour,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GradientBackground(
        image: MediaRes.colorBackground,
        child: SafeArea(
          child: MainScreenContainer(
            // child: Text('Menu'),
            padding: const EdgeInsets.only(top: 0),
            child: Stack(
              children: [
                const Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: MainText(
                      'Secangkir Kopi untuk Harimu',
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colours.primaryColour,
                    ),
                  ),
                ),
                Positioned.fill(
                  top: MediaQuery.of(context).size.height * .42,
                  child: Transform.scale(
                    scale: 2.36,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colours.accentDarkerColour,
                        borderRadius: BorderRadius.only(
                          // max radius
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200),
                        ),
                      ),
                      height: double.infinity,
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -32),
                            child: Transform.scale(
                              scale: 0.5,
                              child: SizedBox(
                                height: 140,
                                // color: Colors.blue,
                                child: ListWheelScrollViewX(
                                  controller: _categoriesController,
                                  physics: const FixedExtentScrollPhysics(
                                      parent: BouncingScrollPhysics()),
                                  // diameterRatio: 1.5,
                                  offAxisFraction: 1.9,
                                  scrollDirection: Axis.horizontal,
                                  itemExtent: 70,
                                  squeeze: 0.9,
                                  children: categories,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Transform.translate(
                              offset: const Offset(0, -87),
                              child: Transform.scale(
                                scale: 1,
                                child: SizedBox(
                                  height: double.infinity,
                                  // color: Colors.blue,
                                  child: ListWheelScrollViewX(
                                    controller: _itemsController,
                                    physics: const FixedExtentScrollPhysics(
                                        parent: BouncingScrollPhysics()),
                                    // diameterRatio: 1.5,
                                    offAxisFraction: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemExtent: 100,
                                    squeeze: 0.88,
                                    perspective: 0.005,
                                    diameterRatio: 8,
                                    children: items,
                                    onSelectedItemChanged: (index) {
                                      if (_selectedItemIndex != index) {
                                        print(index);
                                        setState(() {
                                          _selectedItemIndex = index;
                                        });
                                        _updateItems();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showModalBottomSheet(BuildContext context,
      {required String text}) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) => const BottomSheetWidget(
        height: 0.8,
        // child: _buildItem(text),
        child: ItemsDetail(),
      ),
    );
  }
}
