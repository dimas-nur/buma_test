import 'package:components/components.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Information Leave',
          textAlign: TextAlign.center,
          style: AppTypography.h5,
        ),
        Gap.h4,
        Text(
          'Please check detail your information leave ',
          textAlign: TextAlign.center,
          style: AppTypography.bodySmall,
        ),
        Gap.h16,
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: ShapeDecoration(
            color: AppColors.backgroundLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Berikut informasi terkait cuti yang dapat dilakukan '
                  'sebelum membuat request cuti, pilih "create form leave" '
                  'untuk membuat pengajuan cuti',
                  textAlign: TextAlign.justify,
                  style: AppTypography.body,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
