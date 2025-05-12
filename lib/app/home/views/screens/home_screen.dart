import 'package:clinic_app/app/appointments/views/screens/appointments_screen.dart';
import 'package:clinic_app/app/book%20feature/views/screens/book_appointment_screen.dart';
import 'package:clinic_app/app/home/controllers/most_rated_doctors_bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/app/home/views/widgets/action_button.dart';
import 'package:clinic_app/app/home/views/widgets/card_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_shimmer_widget.dart';
import 'package:clinic_app/app/home/views/widgets/most_rated_doctors_widget.dart';
import 'package:clinic_app/app/home/views/widgets/search_widget.dart';
import 'package:clinic_app/app/home/views/widgets/service_button.dart';
import 'package:clinic_app/app/home/views/widgets/subtitle_widget.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<MostRatedDoctorsBloc>().add(FetchMostRatedDoctors());
  // }

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      const BoxShadow(
        color: Color(0x1A000000),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
    return BlocProvider(
      create: (context) => getIt<MostRatedDoctorsBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
          toolbarHeight: 12.0.hp,
          leadingWidth: 12.0.hp,
          titleSpacing: 0.0.sp,
          actionsPadding: EdgeInsets.symmetric(vertical: 2.0.hp),
          leading: Container(
            margin: EdgeInsets.all(4.0.wp),
            decoration: BoxDecoration(
              color: AppColors.widgetBackgroundColor,
              borderRadius: BorderRadius.circular(8.0.sp),
              boxShadow: boxShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0.sp),
              child: const Image(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkAJEkJQ1WumU0hXNpXdgBt9NUKc0QDVIiaw&s",
                ),
              ),
            ),
          ),
          title: ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              "Patient Profile",
              style: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              "Junior Garcia",
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            ActionButton(
              icon: Icons.notifications_outlined,
              onPressed: () {
                Get.to(() => AppointmentsScreen());
              },
            ),
            ActionButton(icon: Icons.shopping_cart_outlined, onPressed: () {}),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(7.0.hp),
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.location_on,
                color: AppColors.darkGreyColor,
                size: 20.0.sp,
              ),
              title: Text(
                'Umayyad Mosque, Damascus, Syria',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primaryColor,
                size: 14.0.sp,
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 2.0.wp),
          children: [
            //-----------------------Search Text Field-------------------------------------------
            SearchWidget(),
            //----------------------Most Rated Subtitle-------------------------------------------
            SubtitleWidget(title: "Most Rated"),
            //-----------------------Most Rated Doctors-------------------------------------------
            Container(
              height: 30.0.hp,
              margin: EdgeInsets.only(top: 4.0.wp),
              child: BlocBuilder<MostRatedDoctorsBloc, MostRatedDoctorsState>(
                builder: (context, state) {
                  switch (state) {
                    case MostRatedDoctorsLoading():
                      return MostRatedDoctorsShimmerWidget();
                    case MostRatedDoctorsLoaded():
                      return MostRatedDoctorsWidget(
                        mostRatedDoctors: state.mostRatedDoctors,
                      );
                    case MostRatedDoctorsFailed():
                      return Center(child: Text(state.errorMessage));
                  }
                },
              ),
            ),
            //------------------------------Card-------------------------------------------
            CardWidget(),
            //------------------------Services Subtitle------------------------------------
            SubtitleWidget(title: "Services"),
            //-------------------------Services Buttons------------------------------------
            Builder(
              builder: (context) {
                return GridView(
                  padding: EdgeInsets.all(4.0.wp),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0.wp,
                    mainAxisSpacing: 2.0.wp,
                    mainAxisExtent: 20.0.hp,
                  ),
                  children: [
                    ServiceButton(
                      icon: Icons.calendar_month,
                      title: "Book Now",
                      subtitle: "Find The Best Doctors In Syria",
                      backgroundColor: AppColors.primaryColor,
                      iconColor: AppColors.widgetBackgroundColor,
                      titleColor: AppColors.widgetBackgroundColor,
                      subTitleColor: AppColors.widgetBackgroundColor,
                      onPressed: () {
                        Get.to(
                          () => const BookAppointmentScreen(),
                          transition: Transition.fade,
                        );
                      },
                    ),
                    ServiceButton(
                      icon: Icons.local_hospital,
                      title: "Prescriptions",
                      subtitle: "Your Medications, Treatment & drugs",
                      backgroundColor: AppColors.widgetBackgroundColor,
                      iconColor: AppColors.primaryColor,
                      titleColor: AppColors.mainTextColor,
                      subTitleColor: AppColors.hintTextColor,
                      onPressed: () {},
                    ),
                    ServiceButton(
                      icon: Icons.science,
                      title: "Lab Tests",
                      subtitle: "Lab Reports Radiology Microbiology",
                      backgroundColor: AppColors.widgetBackgroundColor,
                      iconColor: AppColors.primaryColor,
                      titleColor: AppColors.mainTextColor,
                      subTitleColor: AppColors.hintTextColor,
                      onPressed: () {},
                    ),
                    ServiceButton(
                      icon: Icons.shopping_bag,
                      title: "Marketplace",
                      subtitle: "Medicine\nCosmetics & More",
                      backgroundColor: AppColors.widgetBackgroundColor,
                      iconColor: AppColors.primaryColor,
                      titleColor: AppColors.mainTextColor,
                      subTitleColor: AppColors.hintTextColor,
                      onPressed: () {},
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
