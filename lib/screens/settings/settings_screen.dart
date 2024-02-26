import 'package:flutter/material.dart';
import 'package:weather_app/screens/settings/widgets/settings_items.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/size/app_size.dart';
import '../../utils/styles/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 62.h, left: 30.w, right: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,
                      color: AppColors.translucent),
                ),
                Text(
                  'Settings',
                  style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                    color: AppColors.translucent,
                  ),
                ),
              ],
            ),
            42.getH(),
            SettingsItems(
              section: 'Theme',
              titleOne: 'Dark Theme',
              titleTwo: 'Light Theme',
              subtitleOne: 'Join the Dark Side!',
              subtitleTwo: 'Let There be Light!',
              iconOne: true,
              iconTwo: false,
              onTap: (){},
            ),
            SettingsItems(
              section: 'Feedback',
              titleOne: 'Report an Issue',
              titleTwo: 'Rate on Play Store',
              subtitleOne: 'Facing an issue? Report and we’ll look into it.',
              subtitleTwo: 'Enjoying the app? Leave a review on the Play Store.',
              iconOne: false,
              iconTwo: false,
              onTap: (){},
            ),
            SettingsItems(
              section: 'About',
              titleOne: 'About Weather',
              titleTwo: 'The Team',
              subtitleOne: 'Read a bit more about the app.',
              subtitleTwo: 'Get to know the team that made Weather a reality.',
              iconOne: false,
              iconTwo: false,
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
