import 'package:flutter/material.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/utils/colors/app_colors.dart';
import 'package:weather_app/utils/extension/app_extensions.dart';
import 'package:weather_app/utils/styles/app_text_styles.dart';

import '../../data/models/my_response.dart';
import '../../data/models/simple/weather_main_model.dart';
import '../../utils/size/app_size.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 62.h, left: 30.w, right: 30.w),
        child: Column(
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
                  'Select City',
                  style: AppTextStyles.ubuntuCondensedRegular.copyWith(
                    color: AppColors.translucent,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 10.w, vertical: 10.h),
                              height: 300.h,
                              // width: 100,
                              decoration: BoxDecoration(
                                  color: AppColors.black,
                                  border: Border.all(
                                    color: AppColors.white,
                                  )),
                              child: Column(
                                children: [
                                  TextField(
                                    style: AppTextStyles.ubuntuCondensedRegular
                                        .copyWith(letterSpacing: 2),
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.location_on,
                                        color: AppColors.translucent,
                                      ),
                                      hintText: 'Enter city',
                                      hintStyle: AppTextStyles
                                          .ubuntuCondensedRegular
                                          .copyWith(
                                              color: AppColors.translucent),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppColors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.white
                                                .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                  10.getH()
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: const Icon(Icons.add, color: AppColors.translucent),
                ),
              ],
            ),
            42.getH(),
            FutureBuilder<MyResponse>(
              future: weatherRepository.getSimpleWeatherInfo("Tashkent"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.hasData) {
                  WeatherMainModel weatherMainModel =
                      (snapshot.data as MyResponse).data as WeatherMainModel;
                  return Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weatherMainModel.name,
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(
                                  fontSize: 24,
                                ),
                              ),
                              5.getH(),
                              Text(
                                '${(weatherMainModel.mainInMain.temp - 273.15).round()}°C',
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(
                                  color: AppColors.translucent,
                                ),
                              ),
                              5.getH(),
                              Text(
                                weatherMainModel.weatherModel[0].description
                                    .split(' ')
                                    .map((str) =>
                                        str[0].toUpperCase() +
                                        str.substring(1).toLowerCase())
                                    .join(' '),
                                style: AppTextStyles.ubuntuCondensedRegular
                                    .copyWith(
                                  color: AppColors.translucent,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 60.w,
                            width: 60.w,
                            child: Image.network(
                              weatherMainModel.weatherModel[0].icon
                                  .getWeatherIconUrl(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      50.getH(),
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
    );
  }
}
