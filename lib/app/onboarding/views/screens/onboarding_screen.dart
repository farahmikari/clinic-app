import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_bloc.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_event.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_state.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardingBloc>(),
      child: Scaffold(
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    state.pageIndex = value;
                    BlocProvider.of<OnboardingBloc>(
                      context,
                    ).add(OnboardingEvent());
                  },
                  children: [
                    _page(
                      pageIndex: 0,
                      imageUrl: 'assets/images/Person with a cold-pana.png',
                      title: S.current.onboarding_1,
                      context: context,
                    ),
                    _page(
                      pageIndex: 1,
                      imageUrl: 'assets/images/Doctors-pana.png',
                      title: S.current.onboarding_2,
                      context: context,
                    ),
                    _page(
                      pageIndex: 2,
                      imageUrl: 'assets/images/Online calendar-pana.png',
                      title: S.current.onboarding_3,
                      context: context,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 22.0.hp,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position:
                        BlocProvider.of<OnboardingBloc>(
                          context,
                        ).state.pageIndex.toDouble(),
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: AppColors.primaryColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(36.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _page({
    required pageIndex,
    required String imageUrl,
    required String title,
    required BuildContext context,
  }) {
    //final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10.0.hp),
        Image.asset(imageUrl, height: 40.0.hp, width: 100.0.wp),
        SizedBox(height: 10.0.hp),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SizedBox(height: 8.0.hp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment:
                pageIndex == 2
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: pageIndex != 2,
                child: InkWell(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text(
                    S.current.skip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pageIndex == 2
                      ? Get.to(() => LoginScreen())
                      : controller.animateToPage(
                        pageIndex + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      );
                },
                child:
                    pageIndex == 2
                        ? Container(
                          width: 150,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            S.current.get_started,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                        : Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0.hp),
      ],
    );
  }
}
