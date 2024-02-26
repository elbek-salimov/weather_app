import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/screens/home/widgets/details_item.dart';
import 'package:weather_app/screens/locations/locations_screen.dart';
import 'package:weather_app/screens/settings/settings_screen.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/extension/app_extensions.dart';
import 'package:weather_app/utils/images/app_images.dart';
import 'package:weather_app/utils/styles/app_text_styles.dart';

import '../../data/models/detail/one_call_data.dart';
import '../../data/models/my_response.dart';
import '../../data/models/simple/weather_main_model.dart';
import '../../data/repository/weather_repository.dart';
import '../../utils/size/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  OneCallData? oneCallData;

  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<MyResponse>(
        future: weatherRepository.getSimpleWeatherInfo('Tashkent'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            );
          }
          if (snapshot.hasData) {
            WeatherMainModel weatherMainModel =
                (snapshot.data as MyResponse).data as WeatherMainModel;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 62.h, left: 30.w, right: 22.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(weatherMainModel.name,
                              style: AppTextStyles.ubuntuCondensedRegular),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LocationsScreen();
                              }));
                            },
                            icon: SvgPicture.asset(AppImages.location),
                          ),
                          8.getW(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SettingsScreen();
                              }));
                            },
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
                              style:
                                  AppTextStyles.ubuntuCondensedRegular.copyWith(
                                fontSize: 10,
                                color: AppColors.translucent,
                              )),
                          30.getH(),
                          Text(
                            weatherMainModel.dateTime
                                .getParsedDate()
                                .toString(),
                            style:
                                AppTextStyles.ubuntuCondensedRegular.copyWith(
                              color: AppColors.translucent,
                            ),
                          ),
                          20.getH(),
                          RichText(
                            text: TextSpan(
                                text:
                                    (weatherMainModel.mainInMain.temp - 273.15)
                                        .round()
                                        .toString(),
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(fontSize: 96),
                                children: [
                                  TextSpan(
                                    text: '°C',
                                    style: AppTextStyles.ubuntuCondensedRegular
                                        .copyWith(fontSize: 36),
                                  )
                                ]),
                          ),
                          20.getH(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.arrowBottom),
                              Text(
                                '${(weatherMainModel.mainInMain.tempMin - 273.15).round()}°C',
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(color: AppColors.translucent),
                              ),
                              20.getW(),
                              SvgPicture.asset(AppImages.arrowTop),
                              Text(
                                '${(weatherMainModel.mainInMain.tempMax - 273.15).round()}°C',
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(color: AppColors.translucent),
                              ),
                            ],
                          ),
                          50.getH(),
                          SizedBox(
                            height: 128.w,
                            width: 128.w,
                            child: Image.network(
                              weatherMainModel.weatherModel[0].icon
                                  .getWeatherIconUrl(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          20.getH(),
                          Text(
                            weatherMainModel.weatherModel[0].description
                                .split(' ')
                                .map((str) =>
                                    str[0].toUpperCase() +
                                    str.substring(1).toLowerCase())
                                .join(' '),
                            style: AppTextStyles.ubuntuCondensedRegular
                                .copyWith(color: AppColors.translucent),
                          ),
                          50.getH(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.sunrise),
                              10.getW(),
                              Text(
                                weatherMainModel.sysInMain.sunrise
                                    .getParsedHour(),
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(color: AppColors.translucent),
                              ),
                              20.getW(),
                              SvgPicture.asset(AppImages.sunset),
                              10.getW(),
                              Text(
                                weatherMainModel.sysInMain.sunset
                                    .getParsedHour(),
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(color: AppColors.translucent),
                              ),
                            ],
                          )
                        ],
                      ),
                      FutureBuilder<MyResponse>(
                        future: weatherRepository.getComplexWeatherInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }
                          if (snapshot.hasData) {
                            print((snapshot.data as MyResponse).errorText);
                            oneCallData = (snapshot.data as MyResponse).data
                                as OneCallData;
                            return CarouselSlider(
                              options: CarouselOptions(
                                aspectRatio: 0.1,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: false,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: <Widget>[
                                DetailsItem(
                                  precipitation:
                                      '${oneCallData!.minutely[0].precipitation} mm',
                                  seWind:
                                      '${oneCallData!.current.windSpeed} km/h',
                                  humidity:
                                      '${oneCallData!.current.humidity} %',
                                  visibility:
                                      '${oneCallData!.current.visibility / 1000} km',
                                  uv: '${oneCallData!.current.uvi}',
                                  pressure:
                                      '${oneCallData!.current.pressure} hPa',
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Forecast',
                                        style: AppTextStyles
                                            .ubuntuCondensedRegular
                                            .copyWith(
                                          fontSize: 24,
                                        ),
                                      ),
                                      40.getH(),
                                      Text(
                                        'Hourly Forecast',
                                        style: AppTextStyles
                                            .ubuntuCondensedRegular
                                            .copyWith(
                                          color: AppColors.translucent,
                                        ),
                                      ),
                                      20.getH(),
                                      SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                                oneCallData!.hourly.length,
                                                (index) {
                                              var hourData =
                                                  oneCallData!.hourly[index];
                                              return Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                          hourData.dt
                                                              .getParsedHour(),
                                                          style: AppTextStyles
                                                              .ubuntuCondensedRegular
                                                              .copyWith(
                                                                  fontSize: 14,
                                                                  color: AppColors
                                                                      .translucent)),
                                                      10.getH(),
                                                      SizedBox(
                                                        height: 30.w,
                                                        width: 30.w,
                                                        child: Image.network(
                                                          hourData
                                                              .weather[0].icon
                                                              .getWeatherIconUrl(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  30.getW()
                                                ],
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      40.getH(),
                                      Text(
                                        'Daily Forecast',
                                        style: AppTextStyles
                                            .ubuntuCondensedRegular
                                            .copyWith(
                                          color: AppColors.translucent,
                                        ),
                                      ),
                                      20.getH(),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                                oneCallData!.daily.length,
                                                (index) {
                                              var daily =
                                                  oneCallData!.daily[index];
                                              return Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        daily.dt.getParsedDay(),
                                                        style: AppTextStyles
                                                            .ubuntuCondensedRegular
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      10.getH(),
                                                      SizedBox(
                                                        height: 40.w,
                                                        width: 40.w,
                                                        child: Image.network(
                                                          daily.weather[0].icon
                                                              .getWeatherIconUrl(),
                                                        ),
                                                      ),
                                                      10.getH(),
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              AppImages
                                                                  .arrowTop),
                                                          Text(
                                                            '${oneCallData!.daily[index].dailyTemp.max}°C',
                                                            style: AppTextStyles
                                                                .ubuntuCondensedRegular
                                                                .copyWith(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .translucent,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      17.getH(),
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              AppImages
                                                                  .arrowBottom),
                                                          Text(
                                                            '${oneCallData!.daily[index].dailyTemp.min}°C',
                                                            style: AppTextStyles
                                                                .ubuntuCondensedRegular
                                                                .copyWith(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .translucent,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  30.getW()
                                                ],
                                              );
                                            })
                                          ],
                                        ),
                                      ),
                                      30.getH(),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          );
        },
      ),
    );
  }
}
