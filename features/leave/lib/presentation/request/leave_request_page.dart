import 'package:auto_route/annotations.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave/domain/entities/leave_type_entity.dart';

import 'widgets/widgets.dart';

@RoutePage()
class LeaveRequestPage extends StatefulWidget {
  const LeaveRequestPage({super.key});

  @override
  State<LeaveRequestPage> createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  final _formKey = GlobalKey<FormState>();

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _leaveDurationController = TextEditingController();

  late final Map<int, String> _typeLeaveList;

  LeaveTypeEntity? _selectedTypeLeave;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  bool _isMultipleDays = true;

  bool get _isCanInput => _selectedTypeLeave != null;

  void _initTypeLeaveList() {
    _typeLeaveList = {
      for (final typeLeave in LeaveTypeEntity.list)
        typeLeave.id: typeLeave.name,
    };
  }

  void _updateDateCalculations() {
    _startDateController.text =
        _selectedStartDate?.dateTextFormat(isCompactMonth: true) ?? '';
    _endDateController.text =
        _selectedEndDate?.dateTextFormat(isCompactMonth: true) ?? '';

    final duration = (_selectedEndDate != null && _selectedStartDate != null)
        ? _selectedEndDate!.difference(_selectedStartDate!)
        : null;
    _leaveDurationController.text =
        duration != null ? '${duration.inDays} Hari' : '';
  }

  @override
  void initState() {
    _initTypeLeaveList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar.secondary(
        title: 'Aktivitas Cuti',
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: CustomScrollView(
            slivers: [
              GapSliver.h16,
              SliverToBoxAdapter(
                child: _choseTypeSection,
              ),
              GapSliver.h16,
              const SliverToBoxAdapter(
                child: PrimaryDivider.horizontal(),
              ),
              GapSliver.h16,
              SliverToBoxAdapter(
                child: _infoSection,
              ),
              GapSliver.h16,
              const SliverToBoxAdapter(
                child: PrimaryDivider.horizontal(),
              ),
              GapSliver.h16,
              SliverToBoxAdapter(
                child: _formSection,
              ),
              GapSliver.h16,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomActionBar(),
    );
  }

  Widget get _choseTypeSection {
    return Column(
      children: [
        const ToastInline.neutral(
          message: 'Silahkan pilih tipe cuti yang ingin kamu ajukan',
          isWithIcon: false,
        ),
        Gap.h16,
        DropdownInput(
          label: 'Tipe Cuti',
          hint: 'Pilih tipe cuti',
          isRequired: true,
          selectedValue: _selectedTypeLeave?.id,
          item: _typeLeaveList,
          validator: InputValidationHelper.requiredWithLabel(
            'Tipe cuti',
          ),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedStartDate = null;
                _selectedEndDate = null;
                _updateDateCalculations();

                _selectedTypeLeave = LeaveTypeEntity.list.firstWhere(
                  (e) => e.id == value,
                );
              });
            }
          },
        ),
      ],
    );
  }

  Widget get _infoSection {
    return Row(
      children: [
        Assets.icons.suitcaseTagBoldDuotone.svg(
          width: 40.r,
          height: 40.r,
          // ignore: deprecated_member_use
          color: AppColors.primary500,
        ),
        Gap.w8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cuti',
                style: AppTypography.bodySmall.colorLightDark,
              ),
              Gap.h4,
              Text.rich(
                TextSpan(
                  text: 'Pekerja Cuti pada tanggal',
                  children: [
                    WidgetSpan(
                      child: Gap.w4,
                    ),
                    TextSpan(
                      text: '23 Sep - 6 Oct 2023',
                      style: AppTypography.body.bold.colorDark,
                    ),
                  ],
                  style: AppTypography.body,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _formSection {
    final now = DateTime.now();
    final maxDate = now.add(
      const Duration(days: 365),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ToastInline.neutral(
          message:
              'Untuk mengajukan cuti kamu perlu melengkapi data dibawah ini',
          isWithIcon: false,
        ),
        Gap.h16,
        Text(
          'Tanggal Cuti',
          style: AppTypography.h6,
        ),
        Gap.h24,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DateInput(
                controller: _startDateController,
                label: 'Tanggal Mulai',
                information: 'Pilih tanggal mulai cuti',
                isRequired: true,
                isEnabled: _isCanInput,
                validator: InputValidationHelper.requiredWithLabel(
                  'Tanggal mulai cuti',
                ),
                initialDate: _selectedStartDate,
                firstDate: now,
                lastDate: maxDate.subtract(const Duration(days: 1)),
                onChanged: (date) {
                  if (date != null && date != _selectedStartDate) {
                    setState(() {
                      _selectedStartDate = date;
                      // Reset end date if start date is after end date
                      if (_selectedStartDate!
                          .isAfter(_selectedEndDate ?? _selectedStartDate!)) {
                        _selectedEndDate = null;
                      }
                      // Set end date if multiple days is false
                      if (!_isMultipleDays) {
                        _selectedEndDate = date.add(
                          const Duration(days: 1),
                        );
                      }
                      // Update date calculations
                      _updateDateCalculations();
                      _formKey.currentState?.validate();
                    });
                  }
                },
              ),
            ),
            Gap.w24,
            Expanded(
              child: SwitchInput(
                label: 'Cuti Beberapa Hari',
                information: 'Untuk cuti lebih dari 1 hari',
                value: _isMultipleDays,
                isEnabled: _isCanInput,
                onChanged: (isMultipleDays) {
                  if (isMultipleDays != _isMultipleDays) {
                    setState(() {
                      if (!isMultipleDays) {
                        _selectedEndDate = _selectedStartDate?.add(
                          const Duration(days: 1),
                        );
                      }
                      _isMultipleDays = isMultipleDays;
                      if (_selectedStartDate != null &&
                          _selectedEndDate != null) {
                        _updateDateCalculations();
                      }
                    });
                  }

                  _formKey.currentState?.validate();
                },
              ),
            ),
          ],
        ),
        Gap.h24,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DateInput(
                controller: _endDateController,
                label: 'Tanggal Selesai',
                information: 'Pilih tanggal selesai cuti',
                isRequired: true,
                isEnabled: _isCanInput && _isMultipleDays,
                validator: InputValidationHelper.requiredWithLabel(
                  'Tanggal selesai cuti',
                ),
                initialDate: _selectedEndDate,
                firstDate:
                    (_selectedStartDate ?? now).add(const Duration(days: 1)),
                lastDate: maxDate,
                onChanged: (date) {
                  if (date != null && date != _selectedEndDate) {
                    setState(() {
                      _selectedEndDate = date;
                      _updateDateCalculations();
                    });
                  }
                  if (_selectedStartDate != null && _isMultipleDays) {
                    _formKey.currentState?.validate();
                  }
                },
              ),
            ),
            Gap.w24,
            Expanded(
              child: TextInput(
                controller: _leaveDurationController,
                label: 'Lama Cuti',
                hint: 'Total lama cuti',
                information: 'Jumlah lama kamu cuti',
                isEnabled: false,
                validator: InputValidationHelper.requiredWithLabel(
                  'Lama cuti',
                ),
              ),
            ),
          ],
        ),
        Gap.h16,
        const ToastInline.info(
          message: 'Jika Cuti Tahunan di update maka cuti lain akan terhapus',
        ),
      ],
    );
  }
}
