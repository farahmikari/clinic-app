import 'package:clinic_app/app/medical_report/models/medical_report_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MedicalReportScreen extends StatelessWidget {
  const MedicalReportScreen({super.key, required this.medicalReport});
  final MedicalReportModel medicalReport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.medical_report,
          style: TextStyle(
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SfPdfViewerTheme(
              data: SfPdfViewerThemeData(
                backgroundColor: Theme.of(context).primaryBackgroundColor,
                progressBarColor: Theme.of(context).primaryColor,
                scrollHeadStyle: PdfScrollHeadStyle(
                  backgroundColor: Theme.of(context).primaryColor,
                  pageNumberTextStyle: TextStyle(
                    color: Theme.of(context).accentBackgroundColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              child: SfPdfViewer.network(
                medicalReport.medicalReport,
                canShowPaginationDialog: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
