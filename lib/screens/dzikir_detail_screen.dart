import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import '../core/theme/app_colors.dart';
import '../data/dzikir_pagi_data.dart';
import '../data/dzikir_petang_data.dart';
import '../data/models/dzikir_model.dart';
import '../providers/app_provider.dart';
import '../widgets/app_bar_helpers.dart';

class DzikirDetailScreen extends StatefulWidget {
  final bool isPagi;
  final int initialIndex;

  const DzikirDetailScreen({
    super.key,
    required this.isPagi,
    this.initialIndex = 0,
  });

  @override
  State<DzikirDetailScreen> createState() => _DzikirDetailScreenState();
}

class _DzikirDetailScreenState extends State<DzikirDetailScreen>
    with SingleTickerProviderStateMixin {
  late int _currentIndex;
  late List<DzikirModel> _dzikirs;
  bool _showFaedah = false;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _dzikirs = widget.isPagi ? dzikirPagiList : dzikirPetangList;
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  DzikirModel get _current => _dzikirs[_currentIndex];

  int _getCounter(AppProvider prov) => widget.isPagi
      ? prov.pagiCounters[_currentIndex]
      : prov.petangCounters[_currentIndex];

  bool _isDone(AppProvider prov) => _getCounter(prov) >= _current.repeatCount;

  Future<void> _tap(AppProvider prov) async {
    if (_isDone(prov)) return;
    HapticFeedback.lightImpact();
    _scaleController.forward().then((_) => _scaleController.reverse());
    try {
      final hasVibrator = await Vibration.hasVibrator();
      if (hasVibrator == true) Vibration.vibrate(duration: 30, amplitude: 64);
    } catch (_) {}
    if (widget.isPagi) {
      await prov.incrementPagiCounter(_currentIndex);
    } else {
      await prov.incrementPetangCounter(_currentIndex);
    }
  }

  void _goNext() {
    if (_currentIndex < _dzikirs.length - 1) {
      setState(() { _currentIndex++; _showFaedah = false; });
    }
  }

  void _goPrev() {
    if (_currentIndex > 0) {
      setState(() { _currentIndex--; _showFaedah = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<AppProvider>();
    final counter = _getCounter(prov);
    final done = _isDone(prov);
    final progress = _current.repeatCount > 0
        ? (counter / _current.repeatCount).clamp(0.0, 1.0)
        : 1.0;
    final overallProgress = (_dzikirs.where((d) {
          final idx = _dzikirs.indexOf(d);
          final c = widget.isPagi
              ? prov.pagiCounters[idx]
              : prov.petangCounters[idx];
          return c >= d.repeatCount;
        }).length /
        _dzikirs.length).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Center(
            child: Text('←',
                style: TextStyle(fontSize: 18, color: AppColors.black)),
          ),
        ),
        title: Text(
          widget.isPagi ? 'DZIKIR PAGI' : 'DZIKIR PETANG',
          style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w900, letterSpacing: 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${_currentIndex + 1} / ${_dzikirs.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 12,
                  color: AppColors.grey600,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: overallProgress,
                backgroundColor: AppColors.grey200,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.black),
                minHeight: 1.5,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${_current.number}.',
                        style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w400,
                          color: AppColors.grey400,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _current.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 15,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const AppDivider(),
                  const SizedBox(height: 20),

                  ...(() {
                    final arabics = _current.arabic.split('\n\n');
                    final latins = _current.transliteration.split('\n\n');
                    final translations = _current.translation.split('\n\n');
                    final count = arabics.length;
                    
                    return List.generate(count, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (count > 1 && index > 0) ...[
                            const SizedBox(height: 8),
                          ],
                          // Arabic
                          Text(
                            arabics[index],
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontFamily: 'Scheherazade New',
                              fontSize: 28, height: 2.2,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const AppDivider(),
                          const SizedBox(height: 14),

                          // Transliteration
                          const AppSectionLabel('LATIN'),
                          const SizedBox(height: 8),
                          Text(
                            latins.length > index ? latins[index] : '',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 13, height: 1.7,
                              color: AppColors.grey600,
                            ),
                          ),
                          const SizedBox(height: 14),
                          const AppDivider(),
                          const SizedBox(height: 14),

                          // Translation
                          const AppSectionLabel('TERJEMAHAN'),
                          const SizedBox(height: 8),
                          Text(
                            translations.length > index ? translations[index] : '',
                            style: const TextStyle(
                              fontSize: 13, height: 1.7, color: AppColors.black,
                            ),
                          ),
                          
                          if (index < count - 1) ...[
                            const SizedBox(height: 32),
                            const Divider(color: AppColors.black, thickness: 3, height: 0),
                            const SizedBox(height: 32),
                          ] else ...[
                            const SizedBox(height: 16),
                            const AppDivider(),
                            const SizedBox(height: 12),
                          ],
                        ],
                      );
                    });
                  }()),

                  // Faedah toggle
                  GestureDetector(
                    onTap: () =>
                        setState(() => _showFaedah = !_showFaedah),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppSectionLabel('FAEDAH'),
                        Text(
                          _showFaedah ? '−' : '+',
                          style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300,
                            color: AppColors.grey600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_showFaedah) ...[
                    const SizedBox(height: 10),
                    Text(
                      _current.faedah,
                      style: const TextStyle(
                        fontSize: 13, height: 1.6, color: AppColors.grey800,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  const AppDivider(),
                  const SizedBox(height: 10),

                  // Reference
                  const AppSectionLabel('REFERENSI'),
                  const SizedBox(height: 6),
                  Text(
                    _current.reference,
                    style: const TextStyle(
                      fontSize: 11, color: AppColors.grey400, height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Bottom counter
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.black, width: 1.5)),
            ),
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$counter / ${_current.repeatCount}x',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 22,
                        color: AppColors.black,
                      ),
                    ),
                    if (done)
                      const Text(
                        'SELESAI',
                        style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w900,
                          letterSpacing: 2, color: AppColors.grey600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.grey200,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.black),
                  minHeight: 1.5,
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _currentIndex > 0 ? _goPrev : null,
                      child: Container(
                        width: 48, height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentIndex > 0
                                ? AppColors.black
                                : AppColors.grey200,
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '←',
                          style: TextStyle(
                            fontSize: 18,
                            color: _currentIndex > 0
                                ? AppColors.black
                                : AppColors.grey400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: GestureDetector(
                          onTap: () => _tap(prov),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 52,
                            decoration: BoxDecoration(
                              color: done ? Colors.transparent : AppColors.black,
                              border: Border.all(color: AppColors.black, width: 1.5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              done
                                  ? 'SELESAI'
                                  : 'KETUK  —  ${_current.repeatCount - counter}x LAGI',
                              style: TextStyle(
                                color: done ? AppColors.grey600 : AppColors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: _currentIndex < _dzikirs.length - 1
                          ? _goNext
                          : null,
                      child: Container(
                        width: 48, height: 52,
                        decoration: BoxDecoration(
                          color: _currentIndex < _dzikirs.length - 1
                              ? AppColors.black
                              : Colors.transparent,
                          border: Border.all(
                            color: _currentIndex < _dzikirs.length - 1
                                ? AppColors.black
                                : AppColors.grey200,
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '→',
                          style: TextStyle(
                            fontSize: 18,
                            color: _currentIndex < _dzikirs.length - 1
                                ? AppColors.white
                                : AppColors.grey400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
