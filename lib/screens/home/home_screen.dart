import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/images/app_images.dart';
import 'package:weather_app/utils/styles/app_text_styles.dart';

import '../../utils/size/app_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 62.h, left: 30.w, right: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Tashkent',
                        style: AppTextStyles.ubuntuCondensedRegular),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.location),
                    ),
                    8.getW(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.settings),
                    )
                  ],
                ),
                Text('Current location',
                    style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                      fontSize: 10,
                      color: AppColors.translucent,
                    )),
              ],
            ),
          ),
          50.getH(),
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Text('in sync',
                        style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                          fontSize: 10,
                          color: AppColors.translucent,
                        )),
                    30.getH(),
                    Text('Friday, 25 December 2020',
                        style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                          color: AppColors.translucent,
                        )),
                    20.getH(),
                    RichText(
                      text: TextSpan(
                          text: '22',
                          style: AppTextStyles.ubuntuCondensedRegular
                              .copyWith(fontSize: 96),
                          children: [
                            TextSpan(
                                text: '°C',
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(fontSize: 36))
                          ]),
                    ),
                    20.getH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.arrowBottom),
                        Text(
                          '16°C',
                          style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                            color: AppColors.translucent,
                          ),
                        ),
                        20.getW(),
                        SvgPicture.asset(AppImages.arrowTop),
                        Text(
                          '26°C',
                          style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                            color: AppColors.translucent,
                          ),
                        ),
                      ],
                    ),
                    50.getH(),
                    SvgPicture.asset('assets/icons/cloud.svg'),
                    20.getH(),
                    Text(
                      'Light Drizzle',
                      style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                        color: AppColors.translucent,
                      ),
                    ),
                    50.getH(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/sunrise.svg'),
                        10.getW(),
                        Text(
                          '09:18 AM',
                          style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                            color: AppColors.translucent,
                          ),
                        ),
                        30.getW(),
                        SvgPicture.asset('assets/icons/sunrise.svg'),
                        10.getW(),
                        Text(
                          '06:32 PM',
                          style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                            color: AppColors.translucent,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 0.1,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Details',
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(
                                  fontSize: 24,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Forecast',
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(
                                  fontSize: 24,
                                  color: AppColors.translucent,
                                ),
                              ),
                            ],
                          ),
                          30.getH(),
                          Text(
                            'Precipitation',
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              fontSize: 12,
                              color: AppColors.translucent,
                            ),
                          ),
                          5.getH(),
                          const Text('0.0 mm',
                              style: AppTextStyles.ubuntuCondensedRegular),
                          20.getH(),
                          Text(
                            'SE Wind',
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              fontSize: 12,
                              color: AppColors.translucent,
                            ),
                          ),
                          5.getH(),
                          const Text('10.23 km/h',
                              style: AppTextStyles.ubuntuCondensedRegular),
                          20.getH(),
                          Text(
                            'Humidity',
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              fontSize: 12,
                              color: AppColors.translucent,
                            ),
                          ),
                          5.getH(),
                          const Text('56 %',
                              style: AppTextStyles.ubuntuCondensedRegular),
                          20.getH(),
                          Text(
                            'Visibility',
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              fontSize: 12,
                              color: AppColors.translucent,
                            ),
                          ),
                          5.getH(),
                          const Text('14.83 km',
                              style: AppTextStyles.ubuntuCondensedRegular),
                          20.getH(),
                          Text(
                            'UV',
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              fontSize: 12,
                              color: AppColors.translucent,
                            ),
                          ),
                          5.getH(),
                          const Text('Lowest',
                              style: AppTextStyles.ubuntuCondensedRegular),
                          20.getH(),
                          Text(
                            'Pressure',
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              fontSize: 12,
                              color: AppColors.translucent,
                            ),
                          ),
                          5.getH(),
                          const Text('1012 hPa',
                              style: AppTextStyles.ubuntuCondensedRegular),
                          20.getH(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forecast',
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          50.getH(),
                          Text('Hourly Forecast', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                            color: AppColors.translucent,
                          ),),
                          20.getH(),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text('10:00', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                    fontSize: 12,
                                  ),),
                                  10.getH(),
                                  SvgPicture.asset('assets/icons/sunrise_weather.svg'),
                                ],
                              ),
                              30.getW(),
                              Column(
                                children: [
                                  Text('10:00', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                    fontSize: 12,
                                  ),),
                                  10.getH(),
                                  SvgPicture.asset('assets/icons/sunrise_weather.svg'),
                                ],
                              ),
                            ],
                          ),
                          50.getH(),
                          Text('Daily Forecast', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                            color: AppColors.translucent,
                          ),),
                          20.getH(),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text('26 Dec', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                    fontSize: 12,
                                  ),),
                                  10.getH(),
                                  SvgPicture.asset('assets/icons/sunrise_weather.svg'),
                                  10.getH(),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.arrowTop, height: 11.h,),
                                      Text('26°C', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                        fontSize: 10,
                                        color: AppColors.translucent,
                                      ),),
                                    ],
                                  ),
                                  10.getH(),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.arrowBottom, height: 11.h,),
                                      Text('16°C', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                        fontSize: 10,
                                        color: AppColors.translucent,
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                              30.getW(),
                              Column(
                                children: [
                                  Text('26 Dec', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                    fontSize: 12,
                                  ),),
                                  10.getH(),
                                  SvgPicture.asset('assets/icons/sunrise_weather.svg'),
                                  10.getH(),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.arrowTop, height: 11.h,),
                                      Text('26°C', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                        fontSize: 10,
                                        color: AppColors.translucent,
                                      ),),
                                    ],
                                  ),
                                  10.getH(),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.arrowBottom, height: 11.h,),
                                      Text('16°C', style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                                        fontSize: 10,
                                        color: AppColors.translucent,
                                      ),),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
