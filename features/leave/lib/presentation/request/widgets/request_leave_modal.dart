import 'package:components/components.dart';
import 'package:core/extensions/text_style.extension.dart';
import 'package:core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:leave/domain/entities/leave_entity.dart';

class RequestLeaveModal extends StatelessWidget {
  const RequestLeaveModal({super.key, required this.leave});

  final LeaveEntity leave;

  void _sendRequestLeave(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog.success(
          message: 'Aktivitas cuti kamu berhasil ditambahkan',
          onPositiveTap: () {
            Navigator.of(context)
              ..pop()
              ..pop();
          },
        );
      },
    );
  }

  void _cancelRequestLeave(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog.error(
          message: 'Aktivitas cuti kamu batal ditambahkan',
          onPositiveTap: () {
            Navigator.of(context)
              ..pop()
              ..pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Tambah Aktivitas Cuti',
            style: AppTypography.h5,
          ),
          Gap.h16,
          Row(
            children: [
              Text(
                'Tipe Cuti',
                style: AppTypography.h8.colorDark,
              ),
              Gap.w24,
              Expanded(
                child: Text(
                  leave.type.name,
                  style: AppTypography.body.colorDark,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Gap.h16,
          Row(
            children: [
              Text(
                'Durasi',
                style: AppTypography.h8.colorDark,
              ),
              Gap.w16,
              Expanded(
                child: Text(
                  '${leave.duration} Hari',
                  style: AppTypography.body.colorDark,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Gap.h16,
          const PrimaryDivider.horizontal(),
          Gap.h16,
          Text(
            'Apakah kamu yakin ingin menambahkan aktivitas cuti ini?',
            style: AppTypography.body.colorDark,
            textAlign: TextAlign.center,
          ),
          Gap.h16,
          Row(
            children: [
              Expanded(
                child: CustomButton.secondary(
                  onPressed: () => _cancelRequestLeave(context),
                  isStretched: true,
                  text: 'Batal',
                ),
              ),
              Gap.w16,
              Expanded(
                child: CustomButton.primary(
                  onPressed: () => _sendRequestLeave(context),
                  isStretched: true,
                  text: 'Tambahkan',
                  prefixIconPath: Assets.icons.add.path,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
