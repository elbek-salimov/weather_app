import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({
    super.key,
    required this.section,
    required this.titleOne,
    required this.titleTwo,
    required this.subtitleOne,
    required this.subtitleTwo,
    required this.iconOne,
    required this.iconTwo,
    required this.onTap,
  });

  final String section;
  final String titleOne;
  final String titleTwo;
  final String subtitleOne;
  final String subtitleTwo;
  final bool iconOne;
  final bool iconTwo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section,
          style: AppTextStyles.ubuntuCondensedRegular.copyWith(
            fontSize: 24,
          ),
        ),
        20.getH(),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleOne,
                    style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                      color: AppColors.translucent,
                    ),
                  ),
                  5.getH(),
                  Text(
                    subtitleOne,
                    style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                      color: AppColors.translucent,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (iconOne) SvgPicture.asset(AppImages.checked),
            ],
          ),
        ),
        20.getH(),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleTwo,
                    style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                      color: AppColors.translucent,
                    ),
                  ),
                  5.getH(),
                  Text(
                    subtitleTwo,
                    style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                      color: AppColors.translucent,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (iconTwo) SvgPicture.asset(AppImages.checked),
            ],
          ),
        ),
        50.getH(),
      ],
    );
  }
}
