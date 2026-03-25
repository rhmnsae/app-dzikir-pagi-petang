import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/doa_nabi_data.dart';
import '../widgets/app_bar_helpers.dart';

class DoaNabiScreen extends StatefulWidget {
  const DoaNabiScreen({super.key});

  @override
  State<DoaNabiScreen> createState() => _DoaNabiScreenState();
}

class _DoaNabiScreenState extends State<DoaNabiScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  List<DoaNabiModel> _filtered = [];
  String? _selectedNabi;

  List<String> get _nabiList {
    final s = doaNabiList.map((e) => e.namaNabi).toSet().toList();
    // Maintain chronological order or alphabetical? We'll just leave them in insertion order.
    return s;
  }

  @override
  void initState() {
    super.initState();
    _filtered = doaNabiList;
    _searchController.addListener(_onSearch);
  }

  void _onSearch() => setState(() {
        _query = _searchController.text.toLowerCase();
        _applyFilter();
      });

  void _applyFilter() {
    _filtered = doaNabiList.where((d) {
      final matchQ = _query.isEmpty ||
          d.namaNabi.toLowerCase().contains(_query) ||
          d.konteks.toLowerCase().contains(_query) ||
          d.arti.toLowerCase().contains(_query) ||
          d.latin.toLowerCase().contains(_query);
      final matchK = _selectedNabi == null || d.namaNabi == _selectedNabi;
      return matchQ && matchK;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'DOA PARA NABI'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            hintText: 'Ketik kata kunci atau nama nabi...',
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
                const SizedBox(height: 10),
              ],
            ),
          ),

          // ── Category filter ──────────────────────────────────────
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              children: [
                _FilterChip(
                  label: 'SEMUA NABI',
                  selected: _selectedNabi == null,
                  onTap: () => setState(() {
                    _selectedNabi = null;
                    _applyFilter();
                  }),
                ),
                ..._nabiList.map((n) => _FilterChip(
                      label: n.toUpperCase(),
                      selected: _selectedNabi == n,
                      onTap: () => setState(() {
                        _selectedNabi = _selectedNabi == n ? null : n;
                        _applyFilter();
                      }),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 6),
            child: Text(
              '${_filtered.length} doa ditemukan',
              style: const TextStyle(fontSize: 10, color: AppColors.grey400),
            ),
          ),
          const AppBlackLine(),

          Expanded(
            child: _filtered.isEmpty
                ? const Center(
                    child: Text('Doa tidak ditemukan',
                        style: TextStyle(color: AppColors.grey600)))
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 24),
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) =>
                        _DoaNabiItem(doa: _filtered[index], index: index),
                  ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? AppColors.black : Colors.transparent,
          border: Border.all(color: AppColors.black, width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
            color: selected ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}

class _DoaNabiItem extends StatefulWidget {
  final DoaNabiModel doa;
  final int index;
  const _DoaNabiItem({required this.doa, required this.index});

  @override
  State<_DoaNabiItem> createState() => _DoaNabiItemState();
}

class _DoaNabiItemState extends State<_DoaNabiItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.doa;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              color: _expanded ? AppColors.black : Colors.transparent,
              border: const Border(
                bottom: BorderSide(color: AppColors.grey200, width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DOA KE-${widget.index + 1} • ${d.namaNabi.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        color: _expanded
                            ? AppColors.grey400
                            : AppColors.grey400,
                      ),
                    ),
                    Text(
                      _expanded ? '−' : '+',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: _expanded
                            ? AppColors.grey400
                            : AppColors.grey400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  d.konteks,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    height: 1.3,
                    color: _expanded ? AppColors.white : AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.black, width: 1.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  d.arab,
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
                  d.latin,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 13,
                    height: 1.6,
                    color: AppColors.grey600,
                  ),
                ),
                const SizedBox(height: 12),
                const AppDivider(),
                const SizedBox(height: 10),
                const AppSectionLabel('TERJEMAHAN'),
                const SizedBox(height: 6),
                Text(
                  d.arti,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.6,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 12),
                const AppDivider(),
                const SizedBox(height: 8),
                Text(
                  d.referensi,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.grey400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
