class IslamicEvent {
  final String title;
  final String dateString;
  final int monthIndex;
  final int day;
  final String description;
  final String reference;

  const IslamicEvent({
    required this.title,
    required this.dateString,
    required this.monthIndex,
    required this.day,
    required this.description,
    required this.reference,
  });
}

const List<IslamicEvent> islamicEventsList = [
  IslamicEvent(
    title: 'Awal Muharram',
    dateString: '1 Muharram',
    monthIndex: 1,
    day: 1,
    description: 'Tahun Baru Hijriah dan tanda awalnya bulan-bulan Haram (Muharram, Rajab, Dzulqa\'dah, Dzulhijjah) di mana amal shalih sangat ditekankan.',
    reference: 'Firman Allah: "Sesungguhnya bilangan bulan pada sisi Allah adalah dua belas bulan... di antaranya empat bulan haram." (QS. At-Taubah: 36). Puasa terbaik setelah Ramadhan adalah di bulan Allah, Muharram (HR. Muslim).',
  ),
  IslamicEvent(
    title: 'Hari Asyura',
    dateString: '10 Muharram',
    monthIndex: 1,
    day: 10,
    description: 'Hari peringatan diselamatkannya Nabi Musa AS dari kejaran bala tentara Firaun. Disunnahkan memperbanyak amal dan berpuasa pada hari ke-9 (Tasu\'a) dan ke-10 (Asyura).',
    reference: 'Nabi SAW bersabda: "Puasa Asyura aku berharap kepada Allah akan menghapuskan dosa setahun yang lalu." (HR. Muslim No. 1162).',
  ),
  IslamicEvent(
    title: 'Maulid Nabi SAW',
    dateString: '12 Rabi\'ul Awwal',
    monthIndex: 3,
    day: 12,
    description: 'Hari yang secara luas diperingati sebagai kelahiran Rasulullah Muhammad SAW. Beliau dilahirkan di kota Makkah pada Tahun Gajah.',
    reference: 'Walaupun tidak ada nash ibadah khusus, kaum muslim mengingatnya sebagai pengingat kenabian: "Sungguh, telah ada pada (diri) Rasulullah itu suri teladan yang baik bagimu..." (QS. Al-Ahzab: 21).',
  ),
  IslamicEvent(
    title: 'Isra Mi\'raj',
    dateString: '27 Rajab',
    monthIndex: 7,
    day: 27,
    description: 'Perjalanan waktu malam Nabi Muhammad SAW dari Masjidil Haram ke Masjidil Aqsha (Isra), lalu dilanjutkan naik hingga Sidratul Muntaha (Mi\'raj), turunnya syariat shalat 5 waktu.',
    reference: 'Firman Allah (QS. Al-Isra\': 1 dan QS. An-Najm: 13-18). Serta hadits-hadits shahih tentang riwayat perjalanan Isra Mi\'raj (Muttafaq \'alaih, HR. Bukhari dan HR. Muslim).',
  ),
  IslamicEvent(
    title: 'Nisfu Sya\'ban',
    dateString: '15 Sya\'ban',
    monthIndex: 8,
    day: 15,
    description: 'Malam pertengahan bulan Sya\'ban, dikenal luas sebagai malam saat di mana Allah SWT mengampuni dosa makhluk-Nya yang memohon ampun.',
    reference: '"Allah mengawasi makhluk-Nya pada malam Nisfu Sya\'ban, lalu mengampuni semua makhluk-Nya kecuali orang musyrik atau orang yang bermusuhan." (Hasan, HR. Ibnu Majah dinilai shahih/hasan oleh Al-Albani).',
  ),
  IslamicEvent(
    title: 'Awal Ramadhan',
    dateString: '1 Ramadhan',
    monthIndex: 9,
    day: 1,
    description: 'Bulan suci di mana ibadah puasa (siyaam) diwajibkan bagi seluruh umat muslim yang mukalaf, dan merupakan bulan dilipatgandakannya berbagai amal pahala.',
    reference: '"Hai orang-orang yang beriman, diwajibkan atas kamu berpuasa sebagaimana diwajibkan atas orang-orang sebelum kamu, agar kamu bertakwa." (QS. Al-Baqarah: 183).',
  ),
  IslamicEvent(
    title: 'Nuzulul Qur\'an',
    dateString: '17 Ramadhan',
    monthIndex: 9,
    day: 17,
    description: 'Peringatan sejarah turunnya ayat-ayat suci Al-Qur\'an untuk pertama kalinya kepada Nabi Muhammad SAW di Gua Hira, melalui perantara sabda Malaikat Jibril.',
    reference: '"Bulan Ramadhan, bulan yang di dalamnya diturunkan (permulaan) Al-Quran sebagai petunjuk..." (QS. Al-Baqarah: 185). (Surah yang pertama turun: QS. Al-\'Alaq: 1-5).',
  ),
  IslamicEvent(
    title: 'Malam Lailatul Qadar',
    dateString: '21 Ramadhan (Mulai)',
    monthIndex: 9,
    day: 21,
    description: 'Kemuliaan yang lebih baik dari seribu bulan, umumnya dicari dan diharapkan pada malam-malam ganjil di 10 hari terakhir Ramadhan (malam 21, 23, 25, 27, 29).',
    reference: '"Malam kemuliaan itu lebih baik dari seribu bulan." (QS. Al-Qadr: 3). "Carilah Lailatul Qadar di malam ganjil dari sepuluh malam terakhir bulan Ramadhan" (Shahih, HR. Bukhari).',
  ),
  IslamicEvent(
    title: 'Idul Fitri',
    dateString: '1 Syawal',
    monthIndex: 10,
    day: 1,
    description: 'Hari Raya kembalinya ke fitrah umat Islam bagi mereka yang telah menyelesaikan ibadah puasa. Sangat diharamkan berpuasa pada hari raya kemenangan ini.',
    reference: '"Nabi melarang puasa pada dua hari: Idul Fitri dan Idul Adha." (Muttafaq \'alaih, HR. Bukhari & Muslim dari jalur Abu Hurairah dan Umar).',
  ),
  IslamicEvent(
    title: 'Wukuf Arafah',
    dateString: '9 Dzulhijjah',
    monthIndex: 12,
    day: 9,
    description: 'Puncak dari ibadah haji, dilaksanakan wukuf jemaah haji di padang Arafah. Bagi non-jemaah haji amat disunnahkan untuk berpuasa Arafah.',
    reference: '"Haji adalah Arafah" (HR. Tirmidzi). Puasa Arafah (bagi selain jemaah haji) diharap akan menghapuskan dosa dhuha tahun, yaitu setahun sebelum dan sesudah (HR. Muslim).',
  ),
  IslamicEvent(
    title: 'Idul Adha',
    dateString: '10 Dzulhijjah',
    monthIndex: 12,
    day: 10,
    description: 'Puncak Hari Raya Qurban (Yaumun Nahar) sekaligus identik dengan Manasik Haji di mana jemaah mulai melontar Jumrah Aqabah di Mina.',
    reference: '"Maka laksanakanlah shalat karena Tuhanmu, dan berkurbanlah!" (QS. Al-Kautsar: 2).',
  ),
];
