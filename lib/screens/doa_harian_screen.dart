import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/doa_harian_data.dart';
import '../widgets/app_bar_helpers.dart';

class DoaHarianScreen extends StatefulWidget {
  const DoaHarianScreen({super.key});

  @override
  State<DoaHarianScreen> createState() => _DoaHarianScreenState();
}

class _DoaHarianScreenState extends State<DoaHarianScreen> {
  int? _expandedIndex;
  final _searchController = TextEditingController();
  String _query = '';
  List<DoaModel> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = doaHarianList;
    _searchController.addListener(() {
      setState(() {
        _query = _searchController.text.toLowerCase();
        _expandedIndex = null;
        _filtered = doaHarianList
            .where((d) =>
                d.title.toLowerCase().contains(_query) ||
                d.transliteration.toLowerCase().contains(_query) ||
                d.translation.toLowerCase().contains(_query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'DOA HARIAN'),
      body: Column(
        children: [
          // ── Search ──────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSectionLabel('CARI DOA'),
                const SizedBox(height: 8),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.black, width: 1.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Ketik kata kunci...',
                            hintStyle: TextStyle(
                                color: AppColors.grey400, fontSize: 13),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          style: const TextStyle(
                              fontSize: 13, color: AppColors.black),
                        ),
                      ),
                      if (_query.isNotEmpty)
                        GestureDetector(
                          onTap: () => _searchController.clear(),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('×',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.grey400,
                                    fontWeight: FontWeight.w300)),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${_filtered.length} doa ditemukan',
                  style: const TextStyle(
                      fontSize: 10, color: AppColors.grey400),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const AppBlackLine(),

          // ── List ────────────────────────────────────────────────
          Expanded(
            child: _filtered.isEmpty
                ? const Center(
                    child: Text('Doa tidak ditemukan',
                        style: TextStyle(color: AppColors.grey600)))
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) {
                      final doa = _filtered[index];
                      final globalIndex = doaHarianList.indexOf(doa);
                      final isExpanded = _expandedIndex == globalIndex;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => _expandedIndex =
                                isExpanded ? null : globalIndex),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 13),
                              decoration: BoxDecoration(
                                color: isExpanded
                                    ? AppColors.black
                                    : Colors.transparent,
                                border: const Border(
                                  bottom: BorderSide(
                                      color: AppColors.grey200, width: 1),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 26,
                                    child: Text(
                                      '${globalIndex + 1}.',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: isExpanded
                                            ? AppColors.grey400
                                            : AppColors.grey400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doa.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            color: isExpanded
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          doa.sanadLevel,
                                          style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1,
                                            color: isExpanded
                                                ? AppColors.grey400
                                                : AppColors.grey400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    isExpanded ? '−' : '+',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: isExpanded
                                          ? AppColors.grey400
                                          : AppColors.grey400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (isExpanded)
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.black, width: 1.5),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    doa.arabic,
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontFamily: 'Scheherazade New',
                                      fontSize: 24,
                                      height: 2.0,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const AppDivider(),
                                  const SizedBox(height: 10),
                                  const AppSectionLabel('LATIN'),
                                  const SizedBox(height: 6),
                                  Text(
                                    doa.transliteration,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 13, height: 1.6,
                                      color: AppColors.grey600,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const AppDivider(),
                                  const SizedBox(height: 10),
                                  const AppSectionLabel('TERJEMAHAN'),
                                  const SizedBox(height: 6),
                                  Text(
                                    doa.translation,
                                    style: const TextStyle(
                                        fontSize: 13, height: 1.6),
                                  ),
                                  const SizedBox(height: 12),
                                  const AppDivider(),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${doa.sanadLevel}  ·  ${doa.reference}',
                                    style: const TextStyle(
                                      fontSize: 10, color: AppColors.grey400,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
