import 'package:clinic_app/app/vital_signals/controllers/bloc/bloc/vital_signals_bloc.dart';
import 'package:clinic_app/app/vital_signals/views/widgets/info_vital_signals.dart';
import 'package:clinic_app/app/vital_signals/views/widgets/vital_signals_loading_widget.dart';
import 'package:clinic_app/core/widgets/failure_screen_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VitalSignalScreen extends StatelessWidget {
  const VitalSignalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VitalSignalsBloc()..add(VitalSignalsEvent()),
      child: BlocBuilder<VitalSignalsBloc, VitalSignalsState>(
        builder: (context, state) {
          switch (state) {
            ////////////visitor///////////////////////////////
            case VitalSignalsVisitor():
              return FailureScreenWidget(
                isVisitor: true,
                pathImage: "assets/images/No data-cuate.png",
                errorMessage: S.current.login_first_to_show_your_data,
              );
            //////////loading////////////////////////////////
            case VitalSignalsLoading():
              return VitalSignalsLoadingWidget();
            ///////////vital signals information//////////////
            case VitalSignalsSuccess():
              return InfoVitalSignals();
            //////////failure/////////////////////////////////
            case VitalSignalsFailure():
              return FailureScreenWidget(
                isVisitor: false,
                pathImage:
                    "assets/images/404_Error_with_a_cute_animal-pana.png",
                errorMessage: state.message,
              );
          }
          return FailureScreenWidget(
            isVisitor: false,
            pathImage: "assets/images/404_Error_with_a_cute_animal-pana.png",
            errorMessage: S.current.data_not_found,
          );
        },
      ),
    );
  }
}

