import 'package:clinic_app/app/medical_report/models/medical_report_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MedicalReportScreen extends StatelessWidget {
  const MedicalReportScreen({super.key, required this.medicalReport});
  final MedicalReportModel medicalReport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: Text(
          "Medical Report",
          style: TextStyle(
            color: AppColors.mainTextColor,
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
                backgroundColor: AppColors.backgroundColor,
                progressBarColor: AppColors.primaryColor,
                scrollHeadStyle: PdfScrollHeadStyle(
                  backgroundColor: AppColors.primaryColor,
                  pageNumberTextStyle: TextStyle(
                    color: AppColors.widgetBackgroundColor,
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
