import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/auth_prompt/views/screens/auth_prompt_screen.dart';
import 'package:clinic_app/app/book_appointment_with_offer/views/screens/book_appointment_with_offer_screen.dart';
import 'package:clinic_app/app/offers/models/offer_model.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentWithOfferAuthDecisionWidget extends StatelessWidget {
  const BookAppointmentWithOfferAuthDecisionWidget({
    super.key,
    required this.offer,
  });
  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      CheckUserAuthenticationBloc,
      CheckUserAuthenticationState
    >(
      builder: (context, state) {
        switch (state) {
          case CheckUserAuthenticationLoading():
            return Scaffold(body: LoadingWidget());
          case UserAuthenticated():
            return BookAppointmentWithOfferScreen(offer: offer);
          case UserUnAuthenticated():
            return AuthPromptScreen(
              title: "Sign In to Use Your Offer",
              subtitle:
                  "Log in to your account to unlock this special deal and book your appointment at the clinic.",
            );
        }
      },
    );
  }
}
