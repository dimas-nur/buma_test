import 'package:intl/intl.dart';

extension XDateTime on DateTime {
  String dateTextFormat({
    bool isWithDay = true,
    bool isWithDayName = false,
    bool isWithMonth = true,
    bool isCompactMonth = false,
    bool isWithYear = true,
  }) {
    return DateFormat(
      "${isWithDayName ? 'EEEE, ' : ''}${isWithDay ? 'd' : ''}"
          "${isWithMonth ? isCompactMonth ? ' MMM' : ' MMMM' : ''}"
          "${isWithYear ? ' yyyy' : ''}",
      'id',
    ).format(this);
  }

  String dateNumberFormat({
    bool isYearFirst = false,
    String separator = '/',
  }) {
    return DateFormat(
      "${isYearFirst ? 'yyyy' : 'dd'}${separator}MM$separator${isYearFirst ? 'dd' : 'yyyy'}",
      'id',
    ).format(this);
  }

  String timeTextFormat({
    bool isWithSecond = false,
    bool isWithTimeZone = false,
  }) {
    return DateFormat(
      "HH:mm${isWithSecond ? ':ss' : ''}${isWithTimeZone ? ' $timeZoneName' : ''}",
      'id',
    ).format(this);
  }

  String dateRangeTextFormat(DateTime? toDate) {
    final isSameYear = year == toDate?.year;
    final isSameMonth = isSameYear && month == toDate?.month;
    final isSameDay = isSameMonth && day == toDate?.day;

    final firstDateTextFormat = !isSameDay
        ? dateTextFormat(
            isWithMonth: !isSameMonth || !isSameYear,
            isCompactMonth: true,
            isWithYear: !isSameYear,
          )
        : null;
    final secondDateTextFormat = toDate?.dateTextFormat(isCompactMonth: true);

    return '${firstDateTextFormat ?? ''}'
        '${!isSameDay ? ' - ' : ''}'
        '${secondDateTextFormat ?? ''}';
  }
}
