import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_bloc.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_event.dart';
import 'package:clinic_app/app/onboarding/controllers/onboarding_bloc/onboarding_state.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
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
                      color: Theme.of(context).hintTextColor,
                      activeColor: Theme.of(context).primaryColor,
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
              style: TextStyle(
                color: Theme.of(context).primaryTextColor,
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
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
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).hintTextColor,
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
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            S.current.get_started,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).foregroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        : Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).foregroundColor,
                          ),
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
