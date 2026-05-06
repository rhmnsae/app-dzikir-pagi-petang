import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_bar_helpers.dart';
import '../widgets/grid_background.dart';
import '../data/islamic_events_data.dart';

class KalenderIslamScreen extends StatefulWidget {
  const KalenderIslamScreen({super.key});

  @override
  State<KalenderIslamScreen> createState() => _KalenderIslamScreenState();
}

class _KalenderIslamScreenState extends State<KalenderIslamScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  static const List<String> _hijriMonths = [
    '',
    'Muharram',
    'Shafar',
    'Rabi\'ul Awwal',
    'Rabi\'ul Akhir',
    'Jumadil Awwal',
    'Jumadil Akhir',
    'Rajab',
    'Sya\'ban',
    'Ramadhan',
    'Syawal',
    'Dzulqa\'dah',
    'Dzulhijjah',
  ];

  static const List<String> _dayNames = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    'Min',
  ];

  @override
  Widget build(BuildContext context) {
    final hijriNow = HijriCalendar.now();
    final hijriDate =
        '${hijriNow.hDay} ${_hijriMonths[hijriNow.hMonth]} ${hijriNow.hYear} H';
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(
      _focusedDay.year,
      _focusedDay.month,
    );
    final startWeekday = firstDayOfMonth.weekday;

    return Scaffold(
      appBar: buildAppBar(context: context, title: 'KALENDER ISLAM'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Hijri date ─────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSectionLabel('HARI INI'),
                  const SizedBox(height: 6),
                  Text(
                    hijriDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    DateFormat(
                      'EEEE, d MMMM yyyy',
                      'id_ID',
                    ).format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.grey600,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const AppBlackLine(),

            // ── Month navigation ───────────────────────────────────
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(
                    () => _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month - 1,
                    ),
                  ),
                  child: Container(
                    width: 48,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: const Text(
                      '←',
                      style: TextStyle(fontSize: 18, color: AppColors.black),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      DateFormat(
                        'MMMM yyyy',
                        'id_ID',
                      ).format(_focusedDay).toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        letterSpacing: 1.5,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(
                    () => _focusedDay = DateTime(
                      _focusedDay.year,
                      _focusedDay.month + 1,
                    ),
                  ),
                  child: Container(
                    width: 48,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: const Text(
                      '→',
                      style: TextStyle(fontSize: 18, color: AppColors.black),
                    ),
                  ),
                ),
              ],
            ),
            const AppDivider(),

            // ── Calendar grid ──────────────────────────────────────
            Row(
              children: _dayNames.map((d) {
                final isFri = d == 'Jum';
                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.grey200, width: 1),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      d.toUpperCase(),
                      style: TextStyle(
                        color: isFri ? AppColors.black : AppColors.grey400,
                        fontWeight: isFri ? FontWeight.w900 : FontWeight.w500,
                        fontSize: 9,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            ..._buildCalendarRows(startWeekday, daysInMonth, _focusedDay),
            const AppBlackLine(),
            const SizedBox(height: 16),

            // ── Islamic events ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSectionLabel('HARI-HARI PENTING'),
                  const SizedBox(height: 12),
                  ...islamicEventsList.map((event) {
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.zero,
                                border: Border(
                                  top: BorderSide(
                                    color: AppColors.black,
                                    width: 2,
                                  ),
                                  left: BorderSide(
                                    color: AppColors.black,
                                    width: 2,
                                  ),
                                  right: BorderSide(
                                    color: AppColors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: CustomPaint(
                                      painter: GridPainter(
                                        spacing: 28.0,
                                        color: AppColors.black.withValues(
                                          alpha: 0.06,
                                        ),
                                        strokeWidth: 1.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          event.title.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.black,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          event.dateString,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.grey600,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        const AppSectionLabel('DESKRIPSI'),
                                        const SizedBox(height: 8),
                                        Text(
                                          event.description,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            height: 1.6,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const AppSectionLabel(
                                          'REFERENSI SHAHIH/HASAN',
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          event.reference,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            height: 1.6,
                                            color: AppColors.grey800,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        const SizedBox(height: 32),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: AppColors.black,
                                            foregroundColor: AppColors.white,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text(
                                            'TUTUP',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: AppColors.black,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Expanded(
                              child: Text(
                                event.title.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                  color: AppColors.black,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              event.dateString,
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.grey600,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCalendarRows(
    int startWeekday,
    int daysInMonth,
    DateTime focusedDay,
  ) {
    int day = 1;
    final List<Widget> rows = [];
    while (day <= daysInMonth) {
      final cells = <Widget>[];
      for (int col = 0; col < 7; col++) {
        if ((day == 1 && col < startWeekday - 1) || day > daysInMonth) {
          cells.add(Expanded(child: Container(height: 42)));
        } else {
          final d = day;
          final date = DateTime(focusedDay.year, focusedDay.month, d);
          final isToday =
              date.year == DateTime.now().year &&
              date.month == DateTime.now().month &&
              date.day == DateTime.now().day;
          final isSelected =
              date.year == _selectedDate.year &&
              date.month == _selectedDate.month &&
              date.day == _selectedDate.day;
          final isFri = col == 4;
          day++;
          cells.add(
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });

                  // HijriCalendar fromDate takes a DateTime and gives the Hijri date
                  final hDate = HijriCalendar.fromDate(date);
                  final hStr =
                      '${hDate.hDay} ${_hijriMonths[hDate.hMonth]} ${hDate.hYear} H';
                  final mStr = DateFormat(
                    'EEEE, d MMMM yyyy',
                    'id_ID',
                  ).format(date);

                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.zero,
                          border: Border(
                            top: BorderSide(color: AppColors.black, width: 2),
                            left: BorderSide(color: AppColors.black, width: 2),
                            right: BorderSide(color: AppColors.black, width: 2),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CustomPaint(
                                painter: GridPainter(
                                  spacing: 28.0,
                                  color: AppColors.black.withValues(
                                    alpha: 0.06,
                                  ),
                                  strokeWidth: 1.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const AppSectionLabel('TANGGAL DIPILIH'),
                                  const SizedBox(height: 12),
                                  Text(
                                    hStr,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    mStr,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey600,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColors.black,
                                      foregroundColor: AppColors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      'TUTUP',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.black : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.black
                          : (isToday ? AppColors.black : AppColors.grey200),
                      width: isToday || isSelected ? 1.5 : 0.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$d',
                    style: TextStyle(
                      fontWeight: isSelected || isToday
                          ? FontWeight.w900
                          : FontWeight.w400,
                      fontSize: 13,
                      color: isSelected
                          ? AppColors.white
                          : isFri
                          ? AppColors.black
                          : AppColors.grey800,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
      rows.add(Row(children: cells));
    }
    return rows;
  }
}
