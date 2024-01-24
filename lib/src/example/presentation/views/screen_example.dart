import 'package:flutter/material.dart';

import '../../../../core/common/widgets/bottom_sheet_widget.dart';
import '../../../../core/common/widgets/main_screen_container.dart';
import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/common/widgets/gradient_background.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';

class ScreenExample extends StatelessWidget {
  const ScreenExample({super.key});

  static const routeName = '/example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primaryColour,
      body: GradientBackground(
        image: MediaRes.colorBackground,
        child: MainScreenContainer(
          // Edit From Here
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MainText(
                  'Once upon a time, there was a beautiful princess'
                  ' who lived in a big castle. She had everything she wanted,'
                  ' and she was very happy. However, one day she was very sad'
                  ' because she had lost her favorite doll. She looked for it'
                  ' everywhere, but she couldnt find it. She was very sad,'
                  ' and she cried a lot. Suddenly, she heard a noise. It was'
                  ' coming from the garden. She went there and saw a frog.'
                  ' The frog was holding her doll! The princess was very happy'
                  ' and she thanked the frog. The frog told her that he was'
                  ' actually a prince. A witch had cast a spell on him and'
                  ' turned him into a frog. The only way to break the spell'
                  ' was to be kissed by a princess. The princess kissed the'
                  ' frog and he turned into a prince. They got married and'
                  ' lived happily ever after. After years of marriage, they'
                  ' had a beautiful daughter. The princess told her daughter'
                  ' this story every night before she went to bed. The end.'
                  'Once upon a time, there was a beautiful princess'
                  ' who lived in a big castle. She had everything she wanted,'
                  ' and she was very happy. However, one day she was very sad'
                  ' because she had lost her favorite doll. She looked for it'
                  ' everywhere, but she couldnt find it. She was very sad,'
                  ' and she cried a lot. Suddenly, she heard a noise. It was'
                  ' coming from the garden. She went there and saw a frog.'
                  ' The frog was holding her doll! The princess was very happy'
                  ' and she thanked the frog. The frog told her that he was'
                  ' actually a prince. A witch had cast a spell on him and'
                  ' turned him into a frog. The only way to break the spell'
                  ' was to be kissed by a princess. The princess kissed the'
                  ' frog and he turned into a prince. They got married and'
                  ' lived happily ever after. After years of marriage, they'
                  ' had a beautiful daughter. The princess told her daughter'
                  ' this story every night before she went to bed. The end.',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colours.blackColour,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  text: 'Village Culture',
                  onPressed: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => BottomSheetWidget(
                        height: 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://picsum.photos/250/150',
                              width: 250,
                              height: 150,
                            ),
                            const MainText(
                              'Detail Culture',
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
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // Edit Until Here
        ),
      ),
    );
  }
}
