import 'package:equatable/equatable.dart';

enum LeaveCategory {
  leave,
  free,
  big,
  annual,
  other,
}

class LeaveTypeEntity extends Equatable {
  const LeaveTypeEntity({
    required this.name,
    required this.id,
    required this.category,
  });

  final String name;
  final int id;
  final LeaveCategory category;

  @override
  List<Object> get props => [name, id, category];

  static const leave = LeaveTypeEntity(
    name: 'Cuti',
    id: 1,
    category: LeaveCategory.leave,
  );

  static const free = LeaveTypeEntity(
    name: 'Cuti Free',
    id: 2,
    category: LeaveCategory.free,
  );

  static const big = LeaveTypeEntity(
    name: 'Cuti Besar',
    id: 3,
    category: LeaveCategory.big,
  );

  static const annual = LeaveTypeEntity(
    name: 'Cuti Tahunan',
    id: 4,
    category: LeaveCategory.annual,
  );

  static const otherExtendedAnnual = LeaveTypeEntity(
    name: 'Perpanjangan Cuti Tahunan',
    id: 5,
    category: LeaveCategory.other,
  );

  static const otherWithFamily = LeaveTypeEntity(
    name: 'Cuti Bersama Keluarga',
    id: 6,
    category: LeaveCategory.other,
  );

  static const list = [
    leave,
    free,
    big,
    annual,
    otherExtendedAnnual,
    otherWithFamily,
  ];
}
