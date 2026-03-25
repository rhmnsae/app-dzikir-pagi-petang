import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_bar_helpers.dart';

class AsmaUlHusnaScreen extends StatelessWidget {
  const AsmaUlHusnaScreen({super.key});

  static const List<Map<String, String>> _asmaList = [
    {'ar': 'الرَّحْمَنُ', 'latin': 'Ar-Rahman', 'arti': 'Yang Maha Pengasih'},
    {'ar': 'الرَّحِيمُ', 'latin': 'Ar-Rahim', 'arti': 'Yang Maha Penyayang'},
    {'ar': 'الْمَلِكُ', 'latin': 'Al-Malik', 'arti': 'Yang Maha Merajai'},
    {'ar': 'الْقُدُّوسُ', 'latin': 'Al-Quddus', 'arti': 'Yang Maha Suci'},
    {'ar': 'السَّلَامُ', 'latin': 'As-Salam', 'arti': 'Yang Maha Memberi Keselamatan'},
    {'ar': 'الْمُؤْمِنُ', 'latin': 'Al-Mu\'min', 'arti': 'Yang Maha Memberi Keamanan'},
    {'ar': 'الْمُهَيْمِنُ', 'latin': 'Al-Muhaimin', 'arti': 'Yang Maha Memelihara'},
    {'ar': 'الْعَزِيزُ', 'latin': 'Al-Aziz', 'arti': 'Yang Maha Perkasa'},
    {'ar': 'الْجَبَّارُ', 'latin': 'Al-Jabbar', 'arti': 'Yang Memiliki Kegagahan'},
    {'ar': 'الْمُتَكَبِّرُ', 'latin': 'Al-Mutakabbir', 'arti': 'Yang Maha Megah'},
    {'ar': 'الْخَالِقُ', 'latin': 'Al-Khaliq', 'arti': 'Yang Maha Pencipta'},
    {'ar': 'الْبَارِئُ', 'latin': 'Al-Bari\'', 'arti': 'Yang Maha Melepaskan'},
    {'ar': 'الْمُصَوِّرُ', 'latin': 'Al-Mushawwir', 'arti': 'Yang Maha Membentuk Rupa'},
    {'ar': 'الْغَفَّارُ', 'latin': 'Al-Ghaffar', 'arti': 'Yang Maha Pengampun'},
    {'ar': 'الْقَهَّارُ', 'latin': 'Al-Qahhar', 'arti': 'Yang Maha Memaksa'},
    {'ar': 'الْوَهَّابُ', 'latin': 'Al-Wahhab', 'arti': 'Yang Maha Pemberi'},
    {'ar': 'الرَّزَّاقُ', 'latin': 'Ar-Razzaq', 'arti': 'Yang Maha Pemberi Rizki'},
    {'ar': 'الْفَتَّاحُ', 'latin': 'Al-Fattah', 'arti': 'Yang Maha Pembuka'},
    {'ar': 'الْعَلِيمُ', 'latin': 'Al-\'Alim', 'arti': 'Yang Maha Mengetahui'},
    {'ar': 'الْقَابِضُ', 'latin': 'Al-Qabidh', 'arti': 'Yang Maha Menyempitkan'},
    {'ar': 'الْبَاسِطُ', 'latin': 'Al-Basith', 'arti': 'Yang Maha Melapangkan'},
    {'ar': 'الْخَافِضُ', 'latin': 'Al-Khafidh', 'arti': 'Yang Maha Merendahkan'},
    {'ar': 'الرَّافِعُ', 'latin': 'Ar-Rafi\'', 'arti': 'Yang Maha Meninggikan'},
    {'ar': 'الْمُعِزُّ', 'latin': 'Al-Mu\'izz', 'arti': 'Yang Maha Memuliakan'},
    {'ar': 'الْمُذِلُّ', 'latin': 'Al-Mudzill', 'arti': 'Yang Maha Menghinakan'},
    {'ar': 'السَّمِيعُ', 'latin': 'As-Sami\'', 'arti': 'Yang Maha Mendengar'},
    {'ar': 'الْبَصِيرُ', 'latin': 'Al-Bashir', 'arti': 'Yang Maha Melihat'},
    {'ar': 'الْحَكَمُ', 'latin': 'Al-Hakam', 'arti': 'Yang Maha Menetapkan Hukum'},
    {'ar': 'الْعَدْلُ', 'latin': 'Al-\'Adl', 'arti': 'Yang Maha Adil'},
    {'ar': 'اللَّطِيفُ', 'latin': 'Al-Lathif', 'arti': 'Yang Maha Lembut'},
    {'ar': 'الْخَبِيرُ', 'latin': 'Al-Khabir', 'arti': 'Yang Maha Mengenal'},
    {'ar': 'الْحَلِيمُ', 'latin': 'Al-Halim', 'arti': 'Yang Maha Penyantun'},
    {'ar': 'الْعَظِيمُ', 'latin': 'Al-\'Azhim', 'arti': 'Yang Maha Agung'},
    {'ar': 'الْغَفُورُ', 'latin': 'Al-Ghafur', 'arti': 'Yang Maha Pengampun'},
    {'ar': 'الشَّكُورُ', 'latin': 'Asy-Syakur', 'arti': 'Yang Maha Pembalas Budi'},
    {'ar': 'الْعَلِيُّ', 'latin': 'Al-\'Aliy', 'arti': 'Yang Maha Tinggi'},
    {'ar': 'الْكَبِيرُ', 'latin': 'Al-Kabir', 'arti': 'Yang Maha Besar'},
    {'ar': 'الْحَفِيظُ', 'latin': 'Al-Hafizh', 'arti': 'Yang Maha Memelihara'},
    {'ar': 'الْمُقِيتُ', 'latin': 'Al-Muqit', 'arti': 'Yang Maha Pemberi Kecukupan'},
    {'ar': 'الْحَسِيبُ', 'latin': 'Al-Hasib', 'arti': 'Yang Maha Membuat Perhitungan'},
    {'ar': 'الْجَلِيلُ', 'latin': 'Al-Jalil', 'arti': 'Yang Maha Luhur'},
    {'ar': 'الْكَرِيمُ', 'latin': 'Al-Karim', 'arti': 'Yang Maha Mulia'},
    {'ar': 'الرَّقِيبُ', 'latin': 'Ar-Raqib', 'arti': 'Yang Maha Mengawasi'},
    {'ar': 'الْمُجِيبُ', 'latin': 'Al-Mujib', 'arti': 'Yang Maha Mengabulkan'},
    {'ar': 'الْوَاسِعُ', 'latin': 'Al-Wasi\'', 'arti': 'Yang Maha Luas'},
    {'ar': 'الْحَكِيمُ', 'latin': 'Al-Hakim', 'arti': 'Yang Maha Bijaksana'},
    {'ar': 'الْوَدُودُ', 'latin': 'Al-Wadud', 'arti': 'Yang Maha Mengasihi'},
    {'ar': 'الْمَجِيدُ', 'latin': 'Al-Majid', 'arti': 'Yang Maha Mulia'},
    {'ar': 'الْبَاعِثُ', 'latin': 'Al-Ba\'its', 'arti': 'Yang Maha Membangkitkan'},
    {'ar': 'الشَّهِيدُ', 'latin': 'Asy-Syahid', 'arti': 'Yang Maha Menyaksikan'},
    {'ar': 'الْحَقُّ', 'latin': 'Al-Haqq', 'arti': 'Yang Maha Benar'},
    {'ar': 'الْوَكِيلُ', 'latin': 'Al-Wakil', 'arti': 'Yang Maha Memelihara'},
    {'ar': 'الْقَوِيُّ', 'latin': 'Al-Qawiy', 'arti': 'Yang Maha Kuat'},
    {'ar': 'الْمَتِينُ', 'latin': 'Al-Matin', 'arti': 'Yang Maha Kokoh'},
    {'ar': 'الْوَلِيُّ', 'latin': 'Al-Waliy', 'arti': 'Yang Maha Melindungi'},
    {'ar': 'الْحَمِيدُ', 'latin': 'Al-Hamid', 'arti': 'Yang Maha Terpuji'},
    {'ar': 'الْمُحْصِي', 'latin': 'Al-Muhshi', 'arti': 'Yang Maha Menghitung'},
    {'ar': 'الْمُبْدِئُ', 'latin': 'Al-Mubdi\'', 'arti': 'Yang Maha Memulai'},
    {'ar': 'الْمُعِيدُ', 'latin': 'Al-Mu\'id', 'arti': 'Yang Mengembalikan Kehidupan'},
    {'ar': 'الْمُحْيِي', 'latin': 'Al-Muhyi', 'arti': 'Yang Maha Menghidupkan'},
    {'ar': 'الْمُمِيتُ', 'latin': 'Al-Mumit', 'arti': 'Yang Maha Mematikan'},
    {'ar': 'الْحَيُّ', 'latin': 'Al-Hayy', 'arti': 'Yang Maha Hidup'},
    {'ar': 'الْقَيُّومُ', 'latin': 'Al-Qayyum', 'arti': 'Yang Maha Berdiri Sendiri'},
    {'ar': 'الْوَاجِدُ', 'latin': 'Al-Wajid', 'arti': 'Yang Maha Penemu'},
    {'ar': 'الْمَاجِدُ', 'latin': 'Al-Majid', 'arti': 'Yang Maha Mulia'},
    {'ar': 'الْوَاحِدُ', 'latin': 'Al-Wahid', 'arti': 'Yang Maha Tunggal'},
    {'ar': 'الْأَحَدُ', 'latin': 'Al-Ahad', 'arti': 'Yang Maha Esa'},
    {'ar': 'الصَّمَدُ', 'latin': 'Ash-Shamad', 'arti': 'Yang Maha Dibutuhkan'},
    {'ar': 'الْقَادِرُ', 'latin': 'Al-Qadir', 'arti': 'Yang Maha Menentukan'},
    {'ar': 'الْمُقْتَدِرُ', 'latin': 'Al-Muqtadir', 'arti': 'Yang Maha Berkuasa'},
    {'ar': 'الْمُقَدِّمُ', 'latin': 'Al-Muqaddim', 'arti': 'Yang Maha Mendahulukan'},
    {'ar': 'الْمُؤَخِّرُ', 'latin': 'Al-Mu\'akhkhir', 'arti': 'Yang Maha Mengakhirkan'},
    {'ar': 'الْأَوَّلُ', 'latin': 'Al-Awwal', 'arti': 'Yang Maha Awal'},
    {'ar': 'الْآخِرُ', 'latin': 'Al-Akhir', 'arti': 'Yang Maha Akhir'},
    {'ar': 'الظَّاهِرُ', 'latin': 'Azh-Zhahir', 'arti': 'Yang Maha Nyata'},
    {'ar': 'الْبَاطِنُ', 'latin': 'Al-Bathin', 'arti': 'Yang Maha Ghaib'},
    {'ar': 'الْوَالِي', 'latin': 'Al-Wali', 'arti': 'Yang Maha Memerintah'},
    {'ar': 'الْمُتَعَالِي', 'latin': 'Al-Muta\'ali', 'arti': 'Yang Maha Tinggi'},
    {'ar': 'الْبَرُّ', 'latin': 'Al-Barr', 'arti': 'Yang Maha Penderma'},
    {'ar': 'التَّوَّابُ', 'latin': 'At-Tawwab', 'arti': 'Yang Maha Penerima Taubat'},
    {'ar': 'الْمُنْتَقِمُ', 'latin': 'Al-Muntaqim', 'arti': 'Yang Maha Pemberi Balasan'},
    {'ar': 'الْعَفُوُّ', 'latin': 'Al-\'Afuww', 'arti': 'Yang Maha Pemaaf'},
    {'ar': 'الرَّؤُوفُ', 'latin': 'Ar-Ra\'uf', 'arti': 'Yang Maha Pengasuh'},
    {'ar': 'مَالِكُ الْمُلْكِ', 'latin': 'Malik Al-Mulk', 'arti': 'Yang Maha Menguasai Kerajaan'},
    {'ar': 'ذُو الْجَلَالِ وَالْإِكْرَامِ', 'latin': 'Dzul Jalali Wal Ikram', 'arti': 'Yang Maha Pemilik Kebesaran'},
    {'ar': 'الْمُقْسِطُ', 'latin': 'Al-Muqsith', 'arti': 'Yang Maha Pemberi Keadilan'},
    {'ar': 'الْجَامِعُ', 'latin': 'Al-Jami\'', 'arti': 'Yang Maha Mengumpulkan'},
    {'ar': 'الْغَنِيُّ', 'latin': 'Al-Ghaniy', 'arti': 'Yang Maha Kaya'},
    {'ar': 'الْمُغْنِي', 'latin': 'Al-Mughni', 'arti': 'Yang Maha Pemberi Kekayaan'},
    {'ar': 'الْمَانِعُ', 'latin': 'Al-Mani\'', 'arti': 'Yang Maha Mencegah'},
    {'ar': 'الضَّارُّ', 'latin': 'Adh-Dharr', 'arti': 'Yang Maha Pemberi Derita'},
    {'ar': 'النَّافِعُ', 'latin': 'An-Nafi\'', 'arti': 'Yang Maha Pemberi Manfaat'},
    {'ar': 'النُّورُ', 'latin': 'An-Nur', 'arti': 'Yang Maha Bercahaya'},
    {'ar': 'الْهَادِي', 'latin': 'Al-Hadi', 'arti': 'Yang Maha Pemberi Petunjuk'},
    {'ar': 'الْبَدِيعُ', 'latin': 'Al-Badi\'', 'arti': 'Yang Maha Pencipta'},
    {'ar': 'الْبَاقِي', 'latin': 'Al-Baqi', 'arti': 'Yang Maha Kekal'},
    {'ar': 'الْوَارِثُ', 'latin': 'Al-Warits', 'arti': 'Yang Maha Pewaris'},
    {'ar': 'الرَّشِيدُ', 'latin': 'Ar-Rasyid', 'arti': 'Yang Maha Pandai'},
    {'ar': 'الصَّبُورُ', 'latin': 'Ash-Shabur', 'arti': 'Yang Maha Sabar'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'ASMAUL HUSNA'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppSectionLabel('99 NAMA ALLAH'),
                Text(
                  '${_asmaList.length} nama',
                  style: const TextStyle(
                    fontSize: 10, color: AppColors.grey400,
                  ),
                ),
              ],
            ),
          ),
          const AppBlackLine(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _asmaList.length,
              itemBuilder: (context, index) {
                final asma = _asmaList[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 13),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.grey200, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: Text(
                          '${index + 1}.',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.grey400,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              asma['latin']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              asma['arti']!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.grey600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        asma['ar']!,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFamily: 'Scheherazade New',
                          fontSize: 20,
                          height: 1.6,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
