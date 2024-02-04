import 'package:equatable/equatable.dart';

import 'leave_type_entity.dart';

class LeaveEntity extends Equatable {
  const LeaveEntity({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.type,
  });

  final int id;
  final DateTime startDate;
  final DateTime? endDate;
  final LeaveTypeEntity type;

  int get duration => (endDate?.difference(startDate).inDays ?? 0) + 1;

  @override
  List<Object?> get props => [id, startDate, endDate, type];
}

final dummyUserLeaves = [
  LeaveEntity(
    id: 1,
    startDate: DateTime(2024, 3, 18),
    endDate: DateTime(2024, 3, 19),
    type: LeaveTypeEntity.leave,
  ),
  LeaveEntity(
    id: 2,
    startDate: DateTime(2024, 3, 22),
    endDate: null,
    type: LeaveTypeEntity.free,
  ),
  LeaveEntity(
    id: 3,
    startDate: DateTime(2024, 3, 20),
    endDate: DateTime(2024, 3, 21),
    type: LeaveTypeEntity.big,
  ),
  LeaveEntity(
    id: 4,
    startDate: DateTime(2024, 3, 25),
    endDate: DateTime(2024, 3, 27),
    type: LeaveTypeEntity.annual,
  ),
  LeaveEntity(
    id: 5,
    startDate: DateTime(2024, 3, 28),
    endDate: DateTime(2024, 3, 28),
    type: LeaveTypeEntity.otherExtendedAnnual,
  ),
  LeaveEntity(
    id: 6,
    startDate: DateTime(2024, 4, 1),
    endDate: DateTime(2024, 4, 1),
    type: LeaveTypeEntity.otherWithFamily,
  ),
];
