import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/app_size.dart';
import '../../../utils/styles/app_text_styles.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    super.key,
    required this.precipitation,
    required this.seWind,
    required this.humidity,
    required this.visibility,
    required this.uv,
    required this.pressure,
  });

  final String precipitation;
  final String seWind;
  final String humidity;
  final String visibility;
  final String uv;
  final String pressure;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Details',
                style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                  fontSize: 24,
                ),
              ),
              const Spacer(),
              Text(
                'Forecast',
                style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                  fontSize: 24,
                  color: AppColors.translucent,
                ),
              ),
            ],
          ),
          30.getH(),
          Text(
            'Precipitation',
            style: AppTextStyles.ubuntuCondensedRegular.copyWith(
              fontSize: 13,
              color: AppColors.translucent,
            ),
          ),
          5.getH(),
          Text(precipitation, style: AppTextStyles.ubuntuCondensedRegular),
          20.getH(),
          Text(
            'SE Wind',
            style: AppTextStyles.ubuntuCondensedRegular.copyWith(
              fontSize: 13,
              color: AppColors.translucent,
            ),
          ),
          5.getH(),
          Text(seWind, style: AppTextStyles.ubuntuCondensedRegular),
          20.getH(),
          Text(
            'Humidity',
            style: AppTextStyles.ubuntuCondensedRegular.copyWith(
              fontSize: 13,
              color: AppColors.translucent,
            ),
          ),
          5.getH(),
          Text(humidity, style: AppTextStyles.ubuntuCondensedRegular),
          20.getH(),
          Text(
            'Visibility',
            style: AppTextStyles.ubuntuCondensedRegular.copyWith(
              fontSize: 13,
              color: AppColors.translucent,
            ),
          ),
          5.getH(),
          Text(visibility, style: AppTextStyles.ubuntuCondensedRegular),
          20.getH(),
          Text(
            'UV',
            style: AppTextStyles.ubuntuCondensedRegular.copyWith(
              fontSize: 13,
              color: AppColors.translucent,
            ),
          ),
          5.getH(),
          Text(uv, style: AppTextStyles.ubuntuCondensedRegular),
          20.getH(),
          Text(
            'Pressure',
            style: AppTextStyles.ubuntuCondensedRegular.copyWith(
              fontSize: 13,
              color: AppColors.translucent,
            ),
          ),
          5.getH(),
          Text(pressure, style: AppTextStyles.ubuntuCondensedRegular),
          20.getH(),
        ],
      ),
    );
  }
}
