class DoaModel {
  final String title;
  final String arabic;
  final String transliteration;
  final String translation;
  final String reference;
  final String sanadLevel; // Shahih / Hasan / Hasan Shahih

  const DoaModel({
    required this.title,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.reference,
    this.sanadLevel = 'Hasan',
  });
}

// ============================================================
//  DOA HARIAN LENGKAP — referensi Shahih & Hasan
//  Total: 110+ doa
// ============================================================

final List<DoaModel> doaHarianList = [
  // ──────────────────────────────────────────────
  // 🌙 TIDUR & BANGUN
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Sebelum Tidur',
    arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
    transliteration: 'Bismika Allaahumma amuutu wa ahyaa.',
    translation: 'Dengan nama-Mu ya Allah, aku mati dan hidup.',
    reference: 'HR. Bukhari no. 6324',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Sebelum Tidur (Versi Lengkap)',
    arabic: 'اَللَّهُمَّ بِاسْمِكَ أَحْيَا وَأَمُوتُ',
    transliteration: 'Allaahumma bismika ahyaa wa amuut.',
    translation: 'Ya Allah, dengan nama-Mu aku hidup dan aku mati.',
    reference: 'HR. Bukhari no. 6325; Muslim no. 2711',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Bangun Tidur',
    arabic:
        'اَلْحَمْدُ لِلَّهِ الَّذِيْ أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُوْرُ',
    transliteration:
        'Alhamdulillaahilladzii ahyaanaa ba\'da maa amaatanaa wa ilayhin-nusyuur.',
    translation:
        'Segala puji bagi Allah yang telah menghidupkan kami setelah mematikan kami, dan kepada-Nya kami dibangkitkan.',
    reference: 'HR. Bukhari no. 6312',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Susah Tidur / Gelisah di Malam Hari',
    arabic:
        'لَا إِلَهَ إِلَّا اللهُ الْوَاحِدُ الْقَهَّارُ رَبُّ السَّمَاوَاتِ وَالْأَرْضِ وَمَا بَيْنَهُمَا الْعَزِيزُ الْغَفَّارُ',
    transliteration:
        'Laa ilaaha illallaahul waahidul qahhaaru, rabbus-samaawaati wal ardhi wa maa baynahumal \'aziizul ghaffaar.',
    translation:
        'Tidak ada ilah yang berhak disembah kecuali Allah, Yang Maha Esa lagi Maha Perkasa. Rabb langit dan bumi serta apa yang ada di antara keduanya, Yang Maha Perkasa lagi Maha Pengampun.',
    reference:
        'HR. Hakim no. 5453, dishahihkan Al-Albani dalam Ash-Shahihah no. 199',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Terbangun di Malam Hari (Tahajud)',
    arabic:
        'لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، سُبْحَانَ اللهِ وَالْحَمْدُ لِلَّهِ وَلَا إِلَهَ إِلَّا اللهُ وَاللهُ أَكْبَرُ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
    transliteration:
        'Laa ilaaha illallaahu wahdahu laa syariika lah, lahul mulku wa lahul hamdu wa huwa \'alaa kulli syay\'in qadiir. Subhaanallaahi walhamdulillaahi wa laa ilaaha illallaahu wallaahu akbar wa laa hawla wa laa quwwata illaa billaah.',
    translation:
        'Tidak ada ilah yang berhak disembah kecuali Allah semata, tiada sekutu bagi-Nya. Bagi-Nya kerajaan dan segala pujian, dan Dia Maha Kuasa atas segala sesuatu. Maha Suci Allah, segala puji bagi Allah, tidak ada ilah yang berhak disembah kecuali Allah, Allah Maha Besar, dan tidak ada daya serta kekuatan kecuali dengan Allah.',
    reference: 'HR. Bukhari no. 1154',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Setelah Mimpi Buruk',
    arabic:
        'أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّاتِ مِنْ غَضَبِهِ وَعِقَابِهِ وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَنْ يَحْضُرُونِ',
    transliteration:
        'A\'uudzu bikalimaatillaahit-taammati min ghadhabihii wa \'iqaabihii wa syarri \'ibaadihii wa min hamazaatisy-syayaathiini wa an yahdhuruun.',
    translation:
        'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari murka-Nya, siksa-Nya, kejahatan hamba-hamba-Nya, dari godaan setan, dan agar mereka tidak datang kepadaku.',
    reference:
        'HR. Abu Daud no. 3893; Tirmidzi no. 3528, dishahihkan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Melepas Pakaian',
    arabic: 'بِسْمِ اللهِ',
    transliteration: 'Bismillaah.',
    translation: 'Dengan nama Allah.',
    reference:
        'HR. Tirmidzi no. 606, dihasankan Al-Albani; sebagai penutup aurat dari jin',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🚿 KAMAR MANDI & BERSUCI
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Masuk Kamar Mandi',
    arabic: 'اَللَّهُمَّ إِنِّيْ أَعُوْذُبِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ',
    transliteration:
        'Allaahumma innii a\'uudzu bika minal khubutsi wal khabaa\'its.',
    translation:
        'Ya Allah, aku berlindung kepada-Mu dari setan laki-laki dan setan perempuan.',
    reference: 'HR. Bukhari no. 142; Muslim no. 375',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Keluar Kamar Mandi',
    arabic: 'غُفْرَانَكَ',
    transliteration: 'Ghufraanak.',
    translation: 'Aku memohon ampunan-Mu.',
    reference: 'HR. Abu Daud no. 30; Tirmidzi no. 7, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Sebelum Wudhu',
    arabic: 'بِسْمِ اللهِ',
    transliteration: 'Bismillaah.',
    translation: 'Dengan nama Allah.',
    reference: 'HR. Abu Daud no. 101; Tirmidzi no. 25, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Sesudah Wudhu',
    arabic:
        'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيْكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُوْلُهُ، اَللَّهُمَّ اجْعَلْنِيْ مِنَ التَّوَّابِيْنَ وَاجْعَلْنِيْ مِنَ الْمُتَطَهِّرِيْنَ',
    transliteration:
        'Asyhadu allaa ilaaha illallaahu wahdahu laa syariika lahu wa asyhadu anna muhammadan \'abduhu wa rasuuluh. Allaahummaj\'alnii minat-tawwaabiina waj\'alnii minal mutatahhiriin.',
    translation:
        'Aku bersaksi bahwa tidak ada ilah yang berhak disembah kecuali Allah semata, tidak ada sekutu bagi-Nya, dan aku bersaksi bahwa Muhammad adalah hamba dan utusan-Nya. Ya Allah, jadikanlah aku termasuk orang-orang yang banyak bertobat dan jadikanlah aku termasuk orang-orang yang bersuci.',
    reference: 'HR. Muslim no. 234; Tirmidzi no. 55',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Mandi Junub / Bersuci dari Hadats Besar',
    arabic:
        'بِسْمِ اللهِ، اَللَّهُمَّ اجْعَلْنِيْ مِنَ التَّوَّابِيْنَ وَاجْعَلْنِيْ مِنَ الْمُتَطَهِّرِيْنَ',
    transliteration:
        'Bismillaah, Allaahummaj\'alnii minat-tawwaabiina waj\'alnii minal mutatahhiriin.',
    translation:
        'Dengan nama Allah. Ya Allah, jadikanlah aku termasuk orang-orang yang banyak bertobat dan orang-orang yang bersuci.',
    reference: 'HR. Tirmidzi no. 55; Ibnu Majah no. 282, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🍽️ MAKAN & MINUM
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Sebelum Makan',
    arabic: 'بِسْمِ اللَّهِ',
    transliteration: 'Bismillaah.',
    translation: 'Dengan nama Allah.',
    reference: 'HR. Abu Daud no. 3767; Tirmidzi no. 1858, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Lupa Baca Bismillah Saat Makan',
    arabic: 'بِسْمِ اللهِ أَوَّلَهُ وَآخِرَهُ',
    transliteration: 'Bismillaahi awwalahu wa aakhirah.',
    translation: 'Dengan nama Allah di awal dan akhirnya.',
    reference:
        'HR. Abu Daud no. 3767; Tirmidzi no. 1858, dishahihkan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Sesudah Makan',
    arabic:
        'اَلْحَمْدُ لِلَّهِ الَّذِيْ أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِيْنَ',
    transliteration:
        'Alhamdulillaahilladzii ath\'amanaa wasaqaanaa wa ja\'alanaa muslimiin.',
    translation:
        'Segala puji bagi Allah yang telah memberi kami makan dan minum serta menjadikan kami muslim.',
    reference: 'HR. Abu Daud no. 3850, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Sesudah Makan (Versi Lain)',
    arabic:
        'اَلْحَمْدُ لِلَّهِ الَّذِيْ أَطْعَمَ وَسَقَى وَسَوَّغَهُ وَجَعَلَ لَهُ مَخْرَجًا',
    transliteration:
        'Alhamdulillaahil-ladzii ath\'ama wa saqaa wa sawwaghahumaa wa ja\'ala lahuu makhraja.',
    translation:
        'Segala puji bagi Allah yang telah memberi makan dan minum, membuatnya mudah ditelan, dan memberi jalan keluarnya.',
    reference: 'HR. Abu Daud no. 3851, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Sebelum Minum',
    arabic: 'بِسْمِ اللهِ',
    transliteration: 'Bismillaah.',
    translation: 'Dengan nama Allah.',
    reference: 'HR. Tirmidzi no. 1885; Abu Daud no. 3722',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Sesudah Minum',
    arabic:
        'اَلْحَمْدُ لِلَّهِ الَّذِيْ سَقَانَا عَذْبًا فُرَاتًا بِرَحْمَتِهِ وَلَمْ يَجْعَلْهُ مِلْحًا أُجَاجًا بِذُنُوبِنَا',
    transliteration:
        'Alhamdulillaahil-ladzii saqaanaa \'adzban furaatan birahmatihii wa lam yaj\'alhu milhan ujaajan bidzunuubinaa.',
    translation:
        'Segala puji bagi Allah yang memberi kami minum air yang segar lagi tawar dengan rahmat-Nya, dan tidak menjadikannya asin dan pahit karena dosa-dosa kami.',
    reference: 'HR. Abu Daud no. 3730, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Minum Air Zamzam',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ عِلْمًا نَافِعًا وَرِزْقًا وَاسِعًا وَشِفَاءً مِنْ كُلِّ دَاءٍ',
    transliteration:
        'Allaahumma innii as\'aluka \'ilman naafi\'an wa rizqan waasi\'an wa syifaa\'an min kulli daa\'.',
    translation:
        'Ya Allah, sesungguhnya aku memohon kepada-Mu ilmu yang bermanfaat, rezeki yang luas, dan kesembuhan dari setiap penyakit.',
    reference:
        'HR. Ad-Daraquthni, dihasankan Al-Albani dalam Shahih Al-Jami\' no. 1330',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Berbuka Puasa',
    arabic:
        'ذَهَبَ الظَّمَأُ وَابْتَلَّتِ الْعُرُوقُ وَثَبَتَ الْأَجْرُ إِنْ شَاءَ اللهُ',
    transliteration:
        'Dzahabaz-zhama\'u wabtallatil-\'uruuqu wa tsabatal-ajru in syaa\'allaah.',
    translation:
        'Telah hilang rasa haus, telah basah tenggorokan, dan telah tetap pahalanya, insya Allah.',
    reference: 'HR. Abu Daud no. 2357, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Ketika Makan di Tempat Orang yang Memberi Makan',
    arabic: 'اَللَّهُمَّ أَطْعِمْ مَنْ أَطْعَمَنِيْ وَاسْقِ مَنْ سَقَانِيْ',
    transliteration: 'Allaahumma ath\'im man ath\'amanaa wasqi man saqaanaa.',
    translation:
        'Ya Allah, berilah makan orang yang memberiku makan, dan berilah minum orang yang memberiku minum.',
    reference: 'HR. Muslim no. 2055',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Tamu untuk Tuan Rumah',
    arabic:
        'اَللَّهُمَّ بَارِكْ لَهُمْ فِيْمَا رَزَقْتَهُمْ وَاغْفِرْ لَهُمْ وَارْحَمْهُمْ',
    transliteration:
        'Allaahumma baarik lahum fiimaa razaqtahum waghfir lahum warhamhum.',
    translation:
        'Ya Allah, berkahilah bagi mereka apa yang Engkau karuniakan kepada mereka, ampunilah mereka, dan rahmatilah mereka.',
    reference: 'HR. Muslim no. 2042',
    sanadLevel: 'Shahih',
  ),

  // ──────────────────────────────────────────────
  // 🏠 RUMAH & AKTIVITAS HARIAN
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Keluar Rumah',
    arabic:
        'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ',
    transliteration:
        'Bismillaah, tawakkaltu \'alallaah, laa hawla wa laa quwwata illaa billaah.',
    translation:
        'Dengan nama Allah, aku bertawakal kepada Allah, tiada daya dan kekuatan kecuali dengan Allah.',
    reference: 'HR. Tirmidzi no. 3426; Abu Daud no. 5095, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Masuk Rumah',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ خَيْرَ الْمَوْلَجِ وَخَيْرَ الْمَخْرَجِ بِسْمِ اللهِ وَلَجْنَا وَبِسْمِ اللهِ خَرَجْنَا وَعَلَى اللهِ رَبِّنَا تَوَكَّلْنَا',
    transliteration:
        'Allaahumma innii as\'aluka khayral mawlaji wa khayral makhraji. Bismillaahi walajna, wa bismillaahi kharajna, wa \'alallaahi rabbinaa tawakkalnaa.',
    translation:
        'Ya Allah, aku mohon kepada-Mu kebaikan tempat masuk dan tempat keluar. Dengan nama Allah kami masuk, dengan nama Allah kami keluar, dan kepada Allah Rabb kami kami bertawakal.',
    reference: 'HR. Abu Daud no. 5096, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Berpakaian',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَا هُوَ لَهُ وَأَعُوْذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا هُوَ لَهُ',
    transliteration:
        'Allaahumma innii as\'aluka min khayrihi wa khayri maa huwa lahu wa a\'uudzu bika min syarrihi wa syarri maa huwa lah.',
    translation:
        'Ya Allah, aku memohon kepada-Mu kebaikan pakaian ini dan kebaikan yang ada padanya. Aku berlindung kepada-Mu dari kejahatan pakaian ini dan kejahatan yang ada padanya.',
    reference: 'HR. Abu Daud no. 4020, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Memakai Pakaian Baru',
    arabic:
        'اَللَّهُمَّ لَكَ الْحَمْدُ أَنْتَ كَسَوْتَنِيهِ، أَسْأَلُكَ مِنْ خَيْرِهِ وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ وَشَرِّ مَا صُنِعَ لَهُ',
    transliteration:
        'Allaahumma lakal hamdu anta kasawtaniihi, as\'aluka min khayrihi wa khayri maa shuni\'a lahu, wa a\'uudzu bika min syarrihi wa syarri maa shuni\'a lah.',
    translation:
        'Ya Allah, bagi-Mu segala pujian, Engkau telah memakaikan pakaian ini kepadaku. Aku memohon kepada-Mu kebaikannya dan kebaikan apa yang dibuat untuknya. Aku berlindung kepada-Mu dari keburukannya dan keburukan apa yang dibuat untuknya.',
    reference: 'HR. Abu Daud no. 4020; Tirmidzi no. 1767, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Bercermin',
    arabic: 'اَللَّهُمَّ أَنْتَ حَسَّنْتَ خَلْقِيْ فَحَسِّنْ خُلُقِيْ',
    transliteration: 'Allaahumma anta hassanta khalqii fahassin khuluqii.',
    translation:
        'Ya Allah, Engkau telah memperindah fisikku, maka perindahlah akhlakku.',
    reference:
        'HR. Ahmad no. 3748, dihasankan Al-Albani dalam Ash-Shahihah no. 1765',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🕌 SHALAT & MASJID
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Mendengar Adzan',
    arabic:
        'اَللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ وَالصَّلَاةِ الْقَائِمَةِ آتِ مُحَمَّدًا الْوَسِيْلَةَ وَالْفَضِيْلَةَ وَابْعَثْهُ مَقَامًا مَحْمُوْدًا الَّذِيْ وَعَدْتَهُ',
    transliteration:
        'Allaahumma Rabba haadzihid-da\'watit-taammati wash-shalaatil-qaa\'imah. Aati Muhammadanil wasiilata wal fadhiilata, wab\'atshu maqaaman mahmuudan-illadzii wa\'adtah.',
    translation:
        'Ya Allah, Rabb panggilan yang sempurna ini dan shalat yang didirikan, berilah Muhammad wasilah dan keutamaan, serta bangkitkanlah pada tempat yang terpuji yang telah Engkau janjikan.',
    reference: 'HR. Bukhari no. 614',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Jawaban Adzan (Ikut Mengulang)',
    arabic:
        'أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللهِ، رَضِيتُ بِاللهِ رَبًّا وَبِمُحَمَّدٍ رَسُولًا وَبِالْإِسْلَامِ دِينًا',
    transliteration:
        'Asyhadu allaa ilaaha illallaahu wahdahu laa syariika lah, wa asyhadu anna muhammadan rasuulullaaah. Radhiitu billaahi rabbaa wa bi-muhammadin rasuulaa wa bil-islaami diinaa.',
    translation:
        'Aku bersaksi bahwa tidak ada ilah yang berhak disembah kecuali Allah semata, tiada sekutu bagi-Nya, dan bahwa Muhammad adalah utusan Allah. Aku ridha Allah sebagai Rabb, Muhammad sebagai Rasul, dan Islam sebagai agama.',
    reference: 'HR. Muslim no. 386',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Masuk Masjid',
    arabic: 'اَللَّهُمَّ افْتَحْ لِيْ أَبْوَابَ رَحْمَتِكَ',
    transliteration: 'Allaahumma-ftah lii abwaaba rahmatik.',
    translation: 'Ya Allah, bukakanlah untukku pintu-pintu rahmat-Mu.',
    reference: 'HR. Muslim no. 713',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Keluar Masjid',
    arabic: 'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ مِنْ فَضْلِكَ',
    transliteration: 'Allaahumma innii as\'aluka min fadhlika.',
    translation: 'Ya Allah, sesungguhnya aku memohon karunia-Mu.',
    reference: 'HR. Muslim no. 713',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Iftitah Shalat (Setelah Takbiratul Ihram)',
    arabic:
        'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ وَتَبَارَكَ اسْمُكَ وَتَعَالَى جَدُّكَ وَلَا إِلَهَ غَيْرُكَ',
    transliteration:
        'Subhaanakallaahumma wa bihamdika wa tabaarakasmuka wa ta\'aalaa jadduka wa laa ilaaha ghayruk.',
    translation:
        'Maha Suci Engkau ya Allah dengan memuji-Mu. Maha Berkah nama-Mu, Maha Tinggi kebesaran-Mu, dan tidak ada ilah yang berhak disembah selain Engkau.',
    reference: 'HR. Abu Daud no. 775; Tirmidzi no. 243',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Iftitah Shalat Malam / Tahajud',
    arabic:
        'اَللَّهُمَّ لَكَ الْحَمْدُ أَنْتَ نُوْرُ السَّمَاوَاتِ وَالْأَرْضِ وَمَنْ فِيهِنَّ، وَلَكَ الْحَمْدُ أَنْتَ قَيِّمُ السَّمَاوَاتِ وَالْأَرْضِ وَمَنْ فِيهِنَّ',
    transliteration:
        'Allaahumma lakal hamdu anta nuurus-samaawaati wal-ardhi wa man fiihinna, wa lakal hamdu anta qayyimus-samaawaati wal-ardhi wa man fiihinna.',
    translation:
        'Ya Allah, bagi-Mu segala pujian, Engkau cahaya langit dan bumi serta semua yang ada di dalamnya. Bagi-Mu segala pujian, Engkau Penjaga langit dan bumi serta semua yang ada di dalamnya.',
    reference: 'HR. Bukhari no. 1120; Muslim no. 769',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ruku\'',
    arabic: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ',
    transliteration: 'Subhaana rabbiyal \'azhiim.',
    translation: 'Maha Suci Rabb-ku Yang Maha Agung.',
    reference: 'HR. Muslim no. 772; Abu Daud no. 869',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa I\'tidal (Setelah Ruku\')',
    arabic:
        'رَبَّنَا وَلَكَ الْحَمْدُ حَمْدًا كَثِيرًا طَيِّبًا مُبَارَكًا فِيهِ',
    transliteration:
        'Rabbanaa wa lakal hamdu hamdan katsiiran thayyiban mubaarakan fiih.',
    translation:
        'Ya Rabb kami, bagi-Mu segala pujian, pujian yang banyak, baik, dan penuh berkah.',
    reference: 'HR. Bukhari no. 799',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Sujud',
    arabic: 'سُبْحَانَ رَبِّيَ الْأَعْلَى',
    transliteration: 'Subhaana rabbiyal a\'laa.',
    translation: 'Maha Suci Rabb-ku Yang Maha Tinggi.',
    reference: 'HR. Muslim no. 772; Abu Daud no. 871',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Duduk antara Dua Sujud',
    arabic:
        'رَبِّ اغْفِرْ لِيْ وَارْحَمْنِيْ وَاجْبُرْنِيْ وَارْفَعْنِيْ وَارْزُقْنِيْ وَاهْدِنِيْ وَعَافِنِيْ وَاعْفُ عَنِّيْ',
    transliteration:
        'Rabbighfir lii warhamni wajburnii warfa\'nii warzuqnii wahdinii wa\'aafinii wa\'fu \'annii.',
    translation:
        'Ya Rabb-ku, ampunilah aku, rahmatilah aku, cukupilah kekuranganku, angkatlah derajatku, berilah aku rezeki, tunjukilah aku, sehatkanlah aku, dan maafkanlah aku.',
    reference: 'HR. Abu Daud no. 850; Tirmidzi no. 284, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Tasyahud Akhir',
    arabic:
        'اَلتَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ، اَلسَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللهِ وَبَرَكَاتُهُ، اَلسَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللهِ الصَّالِحِيْنَ، أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُوْلُهُ',
    transliteration:
        'At-tahiyyaatu lillaahi wash-shalawaatu wath-thayyibaat. As-salaamu \'alayka ayyuhan-nabiyyu wa rahmatullaahi wa barakaatuh. As-salaamu \'alaynaa wa \'alaa \'ibaadillaahish-shaalihiin. Asyhadu allaa ilaaha illallaahu wa asyhadu anna muhammadan \'abduhu wa rasuuluh.',
    translation:
        'Segala penghormatan, shalawat, dan kebaikan hanya milik Allah. Salam sejahtera atasmu wahai Nabi, beserta rahmat Allah dan keberkahan-Nya. Salam sejahtera atas kami dan atas hamba-hamba Allah yang shalih. Aku bersaksi bahwa tidak ada ilah yang berhak disembah kecuali Allah dan aku bersaksi bahwa Muhammad adalah hamba dan utusan-Nya.',
    reference: 'HR. Bukhari no. 831; Muslim no. 402',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Shalawat Ibrahim dalam Tasyahud',
    arabic:
        'اَللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ',
    transliteration:
        'Allaahumma shalli \'alaa muhammadin wa \'alaa aali muhammadin kamaa shallayta \'alaa ibraahiima wa \'alaa aali ibraahiima innaka hamiidun majiid.',
    translation:
        'Ya Allah, berikanlah shalawat kepada Muhammad dan keluarga Muhammad sebagaimana Engkau memberikan shalawat kepada Ibrahim dan keluarga Ibrahim. Sesungguhnya Engkau Maha Terpuji lagi Maha Mulia.',
    reference: 'HR. Bukhari no. 3370; Muslim no. 406',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Sebelum Salam dalam Shalat (Perlindungan dari 4 Hal)',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ وَمِنْ عَذَابِ جَهَنَّمَ وَمِنْ فِتْنَةِ الْمَحْيَا وَالْمَمَاتِ وَمِنْ شَرِّ فِتْنَةِ الْمَسِيحِ الدَّجَّالِ',
    transliteration:
        'Allaahumma innii a\'uudzu bika min \'adzaabil-qabri wa min \'adzaabi jahannama wa min fitnatil mahyaa wal-mamaati wa min syarri fitnatil masiihid-dajjaal.',
    translation:
        'Ya Allah, sesungguhnya aku berlindung kepada-Mu dari azab kubur, azab neraka Jahannam, fitnah kehidupan dan kematian, serta dari keburukan fitnah Al-Masih Ad-Dajjal.',
    reference: 'HR. Bukhari no. 1377; Muslim no. 588',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Qunut Subuh',
    arabic:
        'اَللَّهُمَّ اهْدِنِيْ فِيْمَنْ هَدَيْتَ، وَعَافِنِيْ فِيْمَنْ عَافَيْتَ، وَتَوَلَّنِيْ فِيْمَنْ تَوَلَّيْتَ، وَبَارِكْ لِيْ فِيْمَا أَعْطَيْتَ، وَقِنِيْ شَرَّ مَا قَضَيْتَ',
    transliteration:
        'Allaahummahdini fiiman hadayt, wa \'aafinii fiiman \'aafayt, wa tawallanii fiiman tawallayt, wa baarik lii fiimaa a\'thayt, wa qinii syarra maa qadhayt.',
    translation:
        'Ya Allah, tunjukilah aku bersama orang-orang yang telah Engkau tunjuki. Sehatkanlah aku bersama orang-orang yang telah Engkau sehatkan. Pimpinlah aku bersama orang-orang yang telah Engkau pimpin. Berkatilah aku pada apa yang telah Engkau berikan. Jauhkan aku dari kejelekan apa yang telah Engkau tetapkan.',
    reference: 'HR. Abu Daud no. 1425; Tirmidzi no. 464, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Qunut Witir',
    arabic:
        'اَللَّهُمَّ اهْدِنَا فِيْمَنْ هَدَيْتَ وَعَافِنَا فِيمَنْ عَافَيْتَ وَتَوَلَّنَا فِيمَنْ تَوَلَّيْتَ وَبَارِكْ لَنَا فِيمَا أَعْطَيْتَ وَقِنَا شَرَّ مَا قَضَيْتَ فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ',
    transliteration:
        'Allaahummahdinaa fiiman hadayt, wa \'aafinaa fiman \'aafayt, wa tawallanii fiman tawallayt, wa baarik lanaa fiimaa a\'thayt, wa qinaa syarra maa qadhayt. Fa innaka taqdhii wa laa yuqdhaa \'alayk, wa innahu laa yadzillu man waalayt. Tabaarakta rabbanaa wa ta\'aalayt.',
    translation:
        'Ya Allah, tunjukilah kami bersama orang-orang yang Engkau tunjuki, sehatkanlah kami bersama orang-orang yang Engkau sehatkan, pimpinlah kami bersama orang-orang yang Engkau pimpin, berkahilah kami pada apa yang Engkau berikan, dan jauhkanlah kami dari kejelekan apa yang Engkau tetapkan. Sesungguhnya Engkau yang menetapkan dan tidak ada yang menetapkan atas-Mu. Sesungguhnya tidak akan hina orang yang Engkau jadikan sebagai wali. Maha Berkah Engkau wahai Rabb kami dan Maha Tinggi.',
    reference:
        'HR. Abu Daud no. 1425; An-Nasai no. 1745, dishahihkan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Setelah Shalat Fardhu (Dzikir)',
    arabic:
        'أَسْتَغْفِرُ اللهَ (×٣) اَللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ',
    transliteration:
        'Astaghfirullaah (3x). Allaahumma antas-salaam wa minkas-salaam tabaarakta yaa dzal-jalaali wal-ikraam.',
    translation:
        'Aku mohon ampun kepada Allah (3x). Ya Allah, Engkau Maha Sejahtera, dan dari-Mu kesejahteraan. Maha Berkah Engkau, wahai Dzat Yang Maha Agung dan Maha Mulia.',
    reference: 'HR. Muslim no. 591',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Dzikir Setelah Shalat — Tasbih, Tahmid, Takbir',
    arabic:
        'سُبْحَانَ اللهِ (×٣٣)، اَلْحَمْدُ لِلَّهِ (×٣٣)، اللهُ أَكْبَرُ (×٣٣)، لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
    transliteration:
        'Subhaanallah (33x), Alhamdulillaah (33x), Allaahu akbar (33x). Laa ilaaha illallaahu wahdahu laa syariika lahu lahul-mulku wa lahul-hamdu wa huwa \'alaa kulli syay\'in qadiir.',
    translation:
        'Maha Suci Allah (33x), Segala Puji bagi Allah (33x), Allah Maha Besar (33x). Tidak ada ilah yang berhak disembah kecuali Allah semata, tiada sekutu bagi-Nya, bagi-Nya kerajaan dan segala pujian, dan Dia Maha Kuasa atas segala sesuatu.',
    reference: 'HR. Muslim no. 597',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Setelah Shalat Subuh — Perlindungan dari Neraka',
    arabic: 'اَللَّهُمَّ أَجِرْنِيْ مِنَ النَّارِ',
    transliteration: 'Allaahumma ajrinii minan-naar.',
    translation: 'Ya Allah, lindungilah aku dari api neraka.',
    reference:
        'HR. Abu Daud no. 5079, dihasankan Al-Albani — dibaca 7x setelah Subuh dan Maghrib',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Ketika Hendak Shalat (Iftitah Umum)',
    arabic:
        'اَللَّهُمَّ بَاعِدْ بَيْنِيْ وَبَيْنَ خَطَايَايَ كَمَا بَاعَدْتَ بَيْنَ الْمَشْرِقِ وَالْمَغْرِبِ',
    transliteration:
        'Allaahumma baa\'id baynii wa bayna khathaayaaya kamaa baa\'adta baynal-masyriqi wal-maghrib.',
    translation:
        'Ya Allah, jauhkanlah antara aku dan kesalahan-kesalahanku sebagaimana Engkau menjauhkan antara timur dan barat.',
    reference: 'HR. Bukhari no. 744; Muslim no. 598',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Shalat Dhuha',
    arabic:
        'اَللَّهُمَّ إِنَّ الضُّحَاءَ ضُحَاؤُكَ وَالْبَهَاءَ بَهَاؤُكَ وَالْجَمَالَ جَمَالُكَ وَالْقُوَّةَ قُوَّتُكَ وَالْقُدْرَةَ قُدْرَتُكَ وَالْعِصْمَةَ عِصْمَتُكَ اَللَّهُمَّ إِنْ كَانَ رِزْقِيْ فِي السَّمَاءِ فَأَنْزِلْهُ وَإِنْ كَانَ فِي الْأَرْضِ فَأَخْرِجْهُ وَإِنْ كَانَ بَعِيْدًا فَقَرِّبْهُ وَإِنْ كَانَ قَرِيبًا فَيَسِّرْهُ',
    transliteration:
        'Allaahumma innadh-dhuhaa\'a dhuhaa\'uka wal-bahaa\'a bahaa\'uka wal-jamaala jamaaluka wal-quwwata quwwatuka wal-qudrata qudratuka wal-\'ishmata \'ishmatuk. Allaahumma in kaana rizqii fis-samaa\'i fa anzilhu, wa in kaana fil-ardhi fa-akhrijhu, wa in kaana ba\'iidan fa-qarribhu, wa in kaana qariiban fa-yassirhu.',
    translation:
        'Ya Allah, sesungguhnya waktu Dhuha adalah milik-Mu, keindahan adalah milik-Mu, kecantikan adalah milik-Mu, kekuatan adalah milik-Mu, kekuasaan adalah milik-Mu, dan perlindungan adalah milik-Mu. Ya Allah, jika rezekiku ada di langit, turunkanlah; jika ada di bumi, keluarkanlah; jika jauh, dekatkanlah; dan jika dekat, mudahkanlah.',
    reference:
        'HR. Al-Baihaqi, dihasankan Al-Albani dalam Shahih Al-Jami\' no. 4404',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🚗 PERJALANAN & KENDARAAN
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Naik Kendaraan',
    arabic:
        'بِسْمِ اللهِ، اَلْحَمْدُ لِلَّهِ سُبْحَانَ الَّذِيْ سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِيْنَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُوْنَ',
    transliteration:
        'Bismillaah. Alhamdulillaah. Subhaanalladzii sakhkhara lanaa haadzaa wa maa kunnaa lahuu muqriniin. Wa innaa ilaa rabbinaa lamunqalibuun.',
    translation:
        'Dengan menyebut nama Allah, segala puji bagi Allah. Maha Suci Allah yang menundukkan semua ini bagi kami. Sesungguhnya kami akan kembali kepada Rabb kami.',
    reference: 'HR. Abu Daud no. 2602; Tirmidzi no. 3447, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Naik Kapal / Perahu',
    arabic:
        'بِسْمِ اللهِ مَجْرَاهَا وَمُرْسَاهَا إِنَّ رَبِّيْ لَغَفُوْرٌ رَحِيمٌ',
    transliteration:
        'Bismillaahi majreehaa wa mursaahaa inna rabbii laghafuurur rahiim.',
    translation:
        'Dengan menyebut nama Allah di waktu berlayar dan berlabuh. Sesungguhnya Rabb-ku benar-benar Maha Pengampun lagi Maha Penyayang.',
    reference: 'QS. Hud: 41 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Bepergian (Safar)',
    arabic:
        'اَللَّهُمَّ إِنَّا نَسْأَلُكَ فِيْ سَفَرِنَا هَذَا الْبِرَّ وَالتَّقْوَى وَمِنَ الْعَمَلِ مَا تَرْضَى',
    transliteration:
        'Allaahumma innaa nas\'aluka fii safarina haadzal birra wat-taqwaa, wa minal \'amali maa tardhaa.',
    translation:
        'Ya Allah, sesungguhnya kami memohon kepada-Mu dalam perjalanan kami ini kebaikan dan ketakwaan, dan dari amal apa yang Engkau ridhai.',
    reference: 'HR. Muslim no. 1342',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Singgah di Suatu Tempat Saat Safar',
    arabic: 'أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
    transliteration:
        'A\'uudzu bikalimaatillaahit-taammati min syarri maa khalaq.',
    translation:
        'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari kejahatan apa yang Dia ciptakan.',
    reference: 'HR. Muslim no. 2708',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Tiba dari Bepergian',
    arabic: 'آيِبُوْنَ تَائِبُوْنَ عَابِدُوْنَ لِرَبِّنَا حَامِدُوْنَ',
    transliteration: 'Aayibuuna taa\'ibuuna \'aabiduuna lirabbinaa haamiduun.',
    translation: 'Kami kembali, bertobat, beribadah, dan memuji Rabb kami.',
    reference: 'HR. Muslim no. 1345',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Safar di Malam Hari (Perlindungan dari Kegelapan)',
    arabic:
        'يَا أَرْضُ رَبِّي وَرَبُّكِ اللهُ، أَعُوذُ بِاللهِ مِنْ شَرِّكِ وَشَرِّ مَا خُلِقَ فِيكِ وَشَرِّ مَا يَدِبُّ عَلَيْكِ',
    transliteration:
        'Yaa ardhu rabbii wa rabbukillah, a\'uudzu billaahi min syarrika wa syarri maa khuliqa fiiki wa syarri maa yadibbu \'alayki.',
    translation:
        'Wahai bumi, Rabb-ku dan Rabb-mu adalah Allah. Aku berlindung kepada Allah dari keburukanmu, keburukan apa yang diciptakan padamu, dan keburukan apa yang merayap di atasmu.',
    reference:
        'HR. Abu Daud no. 2603; Ibnu Majah no. 3547, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🌦️ ALAM & CUACA
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Ketika Hujan',
    arabic: 'اَللَّهُمَّ صَيِّبًا نَافِعًا',
    transliteration: 'Allaahumma shayyiban naafi\'aa.',
    translation: 'Ya Allah, jadikanlah hujan ini membawa manfaat.',
    reference: 'HR. Bukhari no. 1032',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Setelah Hujan',
    arabic: 'مُطِرْنَا بِفَضْلِ اللهِ وَرَحْمَتِهِ',
    transliteration: 'Muthirnaa bifadhlillaahi wa rahmatin.',
    translation: 'Kami diberi hujan karena anugerah dan rahmat Allah.',
    reference: 'HR. Bukhari no. 846; Muslim no. 71',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Angin Bertiup Kencang',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ خَيْرَهَا وَخَيْرَ مَا فِيْهَا وَخَيْرَ مَا أُرْسِلَتْ بِهِ، وَأَعُوْذُ بِكَ مِنْ شَرِّهَا وَشَرِّ مَا فِيْهَا وَشَرِّ مَا أُرْسِلَتْ بِهِ',
    transliteration:
        'Allaahumma innii as\'aluka khayrahaa wa khayra maa fiihaa wa khayra maa ursilat bih, wa a\'uudzu bika min syarrihaa wa syarri maa fiihaa wa syarri maa ursilat bih.',
    translation:
        'Ya Allah, aku memohon kepada-Mu kebaikan angin ini, kebaikan yang ada di dalamnya, dan kebaikan yang dibawanya. Aku berlindung kepada-Mu dari kejahatan angin ini, kejahatan yang ada di dalamnya, dan kejahatan yang dibawanya.',
    reference: 'HR. Muslim no. 899',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Mendengar Petir',
    arabic:
        'سُبْحَانَ الَّذِيْ يُسَبِّحُ الرَّعْدُ بِحَمْدِهِ وَالْمَلَائِكَةُ مِنْ خِيْفَتِهِ',
    transliteration:
        'Subhaanal-ladzii yusabbihur-ra\'du bi hamdihii wal-malaa\'ikatu min khiifatih.',
    translation:
        'Maha Suci Allah yang petir bertasbih dengan memuji-Nya, begitu pula para malaikat karena takut kepada-Nya.',
    reference:
        'HR. Ahmad no. 6672, dihasankan Al-Albani dalam Ash-Shahihah no. 1908',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Melihat Bulan Sabit Baru',
    arabic:
        'اَللَّهُ أَكْبَرُ، اَللَّهُمَّ أَهِلَّهُ عَلَيْنَا بِالْأَمْنِ وَالْإِيْمَانِ وَالسَّلَامَةِ وَالْإِسْلَامِ وَالتَّوْفِيْقِ لِمَا تُحِبُّ وَتَرْضَى، رَبِّيْ وَرَبُّكَ اللهُ',
    transliteration:
        'Allaahu akbar. Allaahumma ahillahu \'alaynaa bil-amni wal-iimaani was-salaamati wal-islaami wat-tawfiiqi limaa tuhibbu wa tardhaa, rabbii wa rabbukallah.',
    translation:
        'Allah Maha Besar. Ya Allah, tampakkan bulan ini kepada kami dengan keamanan, keimanan, keselamatan, keislaman, dan petunjuk untuk melakukan apa yang Engkau cintai dan ridhai. Rabb-ku dan Rabb-mu adalah Allah.',
    reference: 'HR. Tirmidzi no. 3451, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Minta Hujan (Istisqa)',
    arabic:
        'اَللَّهُمَّ اسْقِنَا غَيْثًا مُغِيْثًا مَرِيْئًا مَرِيعًا نَافِعًا غَيْرَ ضَارٍّ عَاجِلًا غَيْرَ آجِلٍ',
    transliteration:
        'Allaahummaskina ghayisan mughyisan maree\'an maree\'an naafi\'an ghayra dhaarrin \'aajilan ghayra aajil.',
    translation:
        'Ya Allah, berilah kami hujan yang memberi manfaat, yang menyuburkan, yang menyenangkan, yang menyelamatkan, yang bermanfaat, tidak berbahaya, segera dan tidak ditunda.',
    reference: 'HR. Abu Daud no. 1169, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Ketika Gempa atau Bencana Alam',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ خَيْرَهَا وَأَعُوذُ بِكَ مِنْ شَرِّهَا',
    transliteration:
        'Allaahumma innii as\'aluka khayrahaa wa a\'uudzu bika min syarrihaa.',
    translation:
        'Ya Allah, sesungguhnya aku memohon kepada-Mu kebaikannya dan berlindung kepada-Mu dari keburukannya.',
    reference: 'HR. Abu Daud no. 5097, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🏥 SAKIT & KESEHATAN
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Ketika Sakit',
    arabic:
        'اَللَّهُمَّ رَبَّ النَّاسِ أَذْهِبِ الْبَأْسَ اشْفِ أَنْتَ الشَّافِيْ لَا شِفَاءَ إِلَّا شِفَاؤُكَ شِفَاءً لَا يُغَادِرُ سَقَمًا',
    transliteration:
        'Allaahumma rabban-naasi adzhibil ba\'sa asyfi anta asy-syaafii laa syifaa\'a illaa syifaa\'uka syifaa\'an laa yughaadiru saqamaa.',
    translation:
        'Ya Allah, Rabb manusia, hilangkanlah penyakit ini, sembuhkanlah, Engkau Maha Penyembuh, tidak ada kesembuhan kecuali kesembuhan dari-Mu, kesembuhan yang tidak meninggalkan penyakit.',
    reference: 'HR. Bukhari no. 5675; Muslim no. 2191',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Mengusap Anggota Tubuh yang Sakit',
    arabic:
        'بِسْمِ اللهِ (×٣) أَعُوذُ بِاللهِ وَقُدْرَتِهِ مِنْ شَرِّ مَا أَجِدُ وَأُحَاذِرُ',
    transliteration:
        'Bismillaah (3x). A\'uudzu billaahi wa qudratihii min syarri maa ajidu wa uhaadzir.',
    translation:
        'Dengan nama Allah (3x). Aku berlindung kepada Allah dan kekuasaan-Nya dari kejahatan apa yang aku rasakan dan aku khawatirkan.',
    reference: 'HR. Muslim no. 2202',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Menjenguk Orang Sakit',
    arabic: 'لَا بَأْسَ طَهُوْرٌ إِنْ شَاءَ اللهُ',
    transliteration: 'Laa ba\'sa thahuurun in syaa\'allaah.',
    translation:
        'Tidak apa-apa, semoga sakitmu ini menjadi penyuci dosamu, insya Allah.',
    reference: 'HR. Bukhari no. 3616',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ruqyah (Mendoakan Orang Sakit)',
    arabic:
        'اَللَّهُمَّ رَبَّ النَّاسِ مُذْهِبَ الْبَاسِ اشْفِ أَنْتَ الشَّافِيْ لَا شَافِيَ إِلَّا أَنْتَ شِفَاءً لَا يُغَادِرُ سَقَمًا',
    transliteration:
        'Allaahumma rabban-naasi mudz-hibal ba\'si, asyfi anta asy-syaafii, laa syaafiya illaa anta, syifaa\'an laa yughaadiru saqamaa.',
    translation:
        'Ya Allah, Rabb manusia, penghilang penyakit, sembuhkanlah, Engkau Maha Penyembuh, tidak ada penyembuh kecuali Engkau, dengan kesembuhan yang tidak meninggalkan penyakit.',
    reference: 'HR. Bukhari no. 5743; Muslim no. 2191',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Ada Wabah / Penyakit Menular',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَعُوذُ بِكَ مِنَ الْبَرَصِ وَالْجُنُونِ وَالْجُذَامِ وَمِنْ سَيِّئِ الْأَسْقَامِ',
    transliteration:
        'Allaahumma innii a\'uudzu bika minal-barashi wal-junuuni wal-judzaami wa min sayyi\'il-asqaam.',
    translation:
        'Ya Allah, sesungguhnya aku berlindung kepada-Mu dari penyakit supak, gila, kusta, dan penyakit-penyakit yang buruk.',
    reference: 'HR. Abu Daud no. 1554, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 😤 EMOSI & KONDISI JIWA
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Ketika Marah',
    arabic: 'أَعُوْذُ بِاللهِ مِنَ الشَّيْطَانِ الرَّجِيْمِ',
    transliteration: 'A\'uudzu billaahi minasy-syaithaanir rajiim.',
    translation: 'Aku berlindung kepada Allah dari setan yang terkutuk.',
    reference: 'HR. Bukhari no. 3282; Muslim no. 2610',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Bersedih / Galau',
    arabic: 'حَسْبُنَا اللهُ وَنِعْمَ الْوَكِيْلُ',
    transliteration: 'Hasbunallaahu wa ni\'mal wakiil.',
    translation:
        'Cukuplah Allah menjadi penolong kami dan Allah adalah sebaik-baik pelindung.',
    reference: 'HR. Bukhari no. 4563',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Ditimpa Kesusahan (Doa Nabi Yunus)',
    arabic:
        'لَا إِلَهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّيْ كُنْتُ مِنَ الظَّالِمِيْنَ',
    transliteration:
        'Laa ilaaha illaa anta subhaanaka innii kuntu minazh-zhaalimiin.',
    translation:
        'Tidak ada ilah yang berhak disembah kecuali Engkau, Maha Suci Engkau, sesungguhnya aku termasuk orang-orang yang zalim.',
    reference: 'QS. Al-Anbiya: 87; HR. Tirmidzi no. 3505, dihasankan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Tertimpa Kesulitan (Doa Nabi Musa)',
    arabic: 'رَبِّ إِنِّيْ لِمَا أَنزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ',
    transliteration: 'Rabbi innii limaa anzalta ilayya min khayrin faqiir.',
    translation:
        'Ya Rabb-ku, sesungguhnya aku sangat memerlukan sesuatu kebaikan yang Engkau turunkan kepadaku.',
    reference: 'QS. Al-Qashash: 24 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Galau / Gundah Hati',
    arabic: 'اللَّهُ اللَّهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا',
    transliteration: 'Allaahu allaahu rabbii laa usyriku bihii syay\'aa.',
    translation:
        'Allah, Allah, Rabb-ku. Aku tidak menyekutukan-Nya dengan sesuatu apapun.',
    reference: 'HR. Abu Daud no. 1525, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Minta Perlindungan dari Berbagai Kesulitan',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَعُوْذُبِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَأَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ وَأَعُوذُ بِكَ مِنَ الْجُبْنِ وَالْبُخْلِ وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ وَقَهْرِ الرِّجَالِ',
    transliteration:
        'Allaahumma innii a\'uudzu bika minal hammi wal hazan, wa a\'uudzu bika minal \'ajzi wal kasal, wa a\'uudzu bika minal jubni wal bukhl, wa a\'uudzu bika min ghalabatid-dayni wa qahrir-rijaal.',
    translation:
        'Ya Allah, aku berlindung kepada-Mu dari kesusahan dan kesedihan, dari kelemahan dan kemalasan, dari sifat pengecut dan kikir, serta dari tumpukan hutang dan penindasan orang.',
    reference: 'HR. Bukhari no. 6369',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Lapang Dada saat Stress / Beban Berat',
    arabic:
        'اَللَّهُمَّ لَا سَهْلَ إِلَّا مَا جَعَلْتَهُ سَهْلًا وَأَنْتَ تَجْعَلُ الْحَزْنَ إِذَا شِئْتَ سَهْلًا',
    transliteration:
        'Allaahumma laa sahla illaa maa ja\'altahu sahlaa wa anta taj\'alul hazna idzaa syi\'ta sahlaa.',
    translation:
        'Ya Allah, tidak ada kemudahan kecuali apa yang Engkau jadikan mudah. Dan Engkau menjadikan kesulitan itu mudah jika Engkau menghendakinya.',
    reference: 'HR. Ibnu Hibban no. 2427, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 📚 ILMU & PEKERJAAN
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Memulai Belajar / Menuntut Ilmu',
    arabic: 'رَبِّ زِدْنِيْ عِلْمًا',
    transliteration: 'Rabbi zidnii \'ilmaa.',
    translation: 'Ya Rabbku, tambahkanlah ilmu kepadaku.',
    reference: 'QS. Thaha: 114 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Sebelum Membaca Al-Qur\'an',
    arabic: 'أَعُوذُ بِاللهِ السَّمِيعِ الْعَلِيمِ مِنَ الشَّيطَانِ الرَّجِيمِ',
    transliteration:
        'A\'uudzu billaahis-samii\'il-\'aliimi minasy-syaithaanir rajiim.',
    translation:
        'Aku berlindung kepada Allah Yang Maha Mendengar lagi Maha Mengetahui dari setan yang terkutuk.',
    reference: 'QS. An-Nahl: 98; HR. Tirmidzi no. 2924',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Memohon Kemudahan Urusan',
    arabic:
        'رَبِّ اشْرَحْ لِيْ صَدْرِيْ وَيَسِّرْ لِيْ أَمْرِيْ وَاحْلُلْ عُقْدَةً مِنْ لِسَانِيْ يَفْقَهُوْا قَوْلِيْ',
    transliteration:
        'Rabbisyrah lii shadrii wa yassir lii amrii wahlul \'uqdatan min lisaanii yafqahuu qawlii.',
    translation:
        'Ya Rabbku, lapangkanlah dadaku, dan mudahkanlah urusanku, dan lepaskanlah kekakuan dari lidahku, agar mereka memahami perkataanku.',
    reference: 'QS. Thaha: 25-28 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Memulai Pekerjaan / Kegiatan',
    arabic: 'بِسْمِ اللهِ تَوَكَّلْتُ عَلَى اللهِ',
    transliteration: 'Bismillaahi tawakkaltu \'alallaah.',
    translation: 'Dengan nama Allah, aku bertawakal kepada Allah.',
    reference: 'HR. Abu Daud no. 5095; Tirmidzi no. 3426',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa agar Ilmu Bermanfaat',
    arabic:
        'اَللَّهُمَّ انْفَعْنِيْ بِمَا عَلَّمْتَنِيْ وَعَلِّمْنِيْ مَا يَنْفَعُنِيْ وَزِدْنِيْ عِلْمًا',
    transliteration:
        'Allaahummanfa\'nii bimaa \'allamtanii wa \'allimnii maa yanfa\'unii wa zidnii \'ilmaa.',
    translation:
        'Ya Allah, berilah aku manfaat dari apa yang telah Engkau ajarkan kepadaku, ajarkan kepadaku apa yang bermanfaat bagiku, dan tambahkanlah ilmuku.',
    reference:
        'HR. Tirmidzi no. 3599; Ibnu Majah no. 251, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 💰 REZEKI & EKONOMI
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Masuk Pasar',
    arabic:
        'لاَ إِلَهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْيِيْ وَيُمِيْتُ وَهُوَ حَيٌّ لَا يَمُوْتُ بِيَدِهِ الْخَيْرُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرٌ',
    transliteration:
        'Laa ilaaha illallaahu wahdahu laa syariika lahu, lahul mulku wa lahul hamdu yuhyii wa yumiitu wa huwa hayyun laa yamuutu biyadihil khairu wa huwa \'alaa kulli syay\'in qadiir.',
    translation:
        'Tidak ada ilah yang berhak disembah kecuali Allah semata, tiada sekutu bagi-Nya. Milik-Nya segala kerajaan dan segala pujian. Dia yang menghidupkan dan mematikan, Dia Maha Hidup tidak akan mati. Di tangan-Nya segala kebaikan dan Dia Maha Kuasa atas segala sesuatu.',
    reference: 'HR. Tirmidzi no. 3428, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Mohon Rezeki yang Baik',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ رِزْقًا طَيِّبًا وَعِلْمًا نَافِعًا وَعَمَلًا مُتَقَبَّلًا',
    transliteration:
        'Allaahumma innii as\'aluka rizqan thayyiban wa \'ilman naafi\'an wa \'amalan mutaqabbalaa.',
    translation:
        'Ya Allah, sesungguhnya aku memohon kepada-Mu rezeki yang baik, ilmu yang bermanfaat, dan amal yang diterima.',
    reference: 'HR. Ibnu Majah no. 925, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Bebas dari Hutang',
    arabic:
        'اَللَّهُمَّ اكْفِنِيْ بِحَلَالِكَ عَنْ حَرَامِكَ وَأَغْنِنِيْ بِفَضْلِكَ عَمَّنْ سِوَاكَ',
    transliteration:
        'Allaahummakfinii bihalaalika \'an haraamika wa aghnanii bifadhlika \'amman siwaak.',
    translation:
        'Ya Allah, cukupkanlah aku dengan yang halal dari-Mu dari yang haram-Mu, dan kayakanlah aku dengan karunia-Mu dari selain-Mu.',
    reference: 'HR. Tirmidzi no. 3563, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Saat Kesulitan Ekonomi / Kefakiran',
    arabic: 'اَللَّهُمَّ إِنِّيْ أَعُوْذُبِكَ مِنَ الْكُفْرِ وَالْفَقْرِ',
    transliteration: 'Allaahumma innii a\'uudzu bika minal kufri wal faqr.',
    translation:
        'Ya Allah, aku berlindung kepada-Mu dari kekufuran dan kefakiran.',
    reference: 'HR. Abu Daud no. 5090, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Memohon Barakah dalam Rezeki',
    arabic:
        'اَللَّهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ',
    transliteration:
        'Allaahumma baarik lanaa fiimaa razaqtanaa wa qinaa \'adzaaban-naar.',
    translation:
        'Ya Allah, berkahilah kami dalam rezeki yang Engkau berikan kepada kami, dan lindungi kami dari azab neraka.',
    reference: 'HR. Ibnu As-Sunni no. 458, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🤲 DOA-DOA MUSTAJAB & PILIHAN
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Memohon Kebaikan Dunia & Akhirat',
    arabic:
        'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    transliteration:
        'Rabbanaa aatinaa fid-dunyaa hasanatan wa fil-aakhirati hasanatan wa qinaa \'adzaaban-naar.',
    translation:
        'Ya Rabb kami, berilah kami kebaikan di dunia dan kebaikan di akhirat, serta jauhkanlah kami dari azab neraka.',
    reference: 'QS. Al-Baqarah: 201; HR. Bukhari no. 6389',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Istikharah',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْتَخِيرُكَ بِعِلْمِكَ وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ فَإِنَّكَ تَقْدِرُ وَلاَ أَقْدِرُ وَتَعْلَمُ وَلاَ أَعْلَمُ وَأَنْتَ عَلَّامُ الْغُيُوبِ',
    transliteration:
        'Allaahumma innii astakhiiruka bi\'ilmika wa astaqdiruka biqudratika wa as\'aluka min fadhlika al-\'azhiim, fa innaka taqdiru wa laa aqdiru wa ta\'lamu wa laa a\'lamu wa anta \'allaamul ghuyuub.',
    translation:
        'Ya Allah, aku memohon pilihan kepada-Mu dengan ilmu-Mu, aku memohon kemampuan kepada-Mu dengan kekuasaan-Mu, dan aku memohon kepada-Mu dari karunia-Mu yang agung. Sesungguhnya Engkau berkuasa dan aku tidak berkuasa, Engkau mengetahui dan aku tidak mengetahui, dan Engkau Maha Mengetahui perkara yang ghaib.',
    reference: 'HR. Bukhari no. 1162',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Memohon Ampunan (Sayyidul Istighfar)',
    arabic:
        'اَللَّهُمَّ أَنْتَ رَبِّيْ لاَ إِلَهَ إِلَّا أَنْتَ خَلَقْتَنِيْ وَأَنَا عَبْدُكَ وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ أَعُوْذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ بِذَنْبِيْ فَاغْفِرْ لِيْ فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ',
    transliteration:
        'Allaahumma anta rabbii laa ilaaha illaa anta khalaqtanii wa ana \'abduka wa ana \'alaa \'ahdika wa wa\'dika mastatha\'tu. A\'uudzu bika min syarri maa shana\'tu. Abuu\'u laka bini\'matika \'alayya wa abuu\'u bidzanbii faghfir lii fa\'innahu laa yaghfirudzdzunuuba illaa anta.',
    translation:
        'Ya Allah, Engkau adalah Rabb-ku, tidak ada ilah yang berhak disembah kecuali Engkau. Engkau telah menciptakanku dan aku adalah hamba-Mu. Aku berada di atas perjanjian dan janji-Mu semampuku. Aku berlindung kepada-Mu dari kejahatan apa yang aku perbuat. Aku mengakui nikmat-Mu atas diriku, dan aku mengakui dosaku, maka ampunilah aku, sesungguhnya tidak ada yang mengampuni dosa kecuali Engkau.',
    reference: 'HR. Bukhari no. 6306',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Minta Keteguhan Iman',
    arabic: 'يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِيْ عَلَى دِيْنِكَ',
    transliteration: 'Yaa muqallibal quluubi tsabbit qalbii \'alaa diinik.',
    translation:
        'Wahai Dzat yang membolak-balikkan hati, tetapkanlah hatiku di atas agama-Mu.',
    reference: 'HR. Tirmidzi no. 2140, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Minta Husnul Khatimah',
    arabic:
        'اَللَّهُمَّ اخْتِمْ لَنَا بِخَيْرٍ وَلَا تَخْتِمْ عَلَيْنَا بِشَرٍّ',
    transliteration:
        'Allaahummakhtim lanaa bikhayrin wa laa takhtim \'alaynaa bisyarr.',
    translation:
        'Ya Allah, tutuplah kehidupan kami dengan kebaikan dan jangan tutup kehidupan kami dengan keburukan.',
    reference: 'HR. Thabrani dalam Mu\'jam Awsath, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Memohon Surga & Berlindung dari Neraka',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ الْجَنَّةَ وَأَعُوْذُ بِكَ مِنَ النَّارِ',
    transliteration:
        'Allaahumma innii as\'alukal jannata wa a\'uudzu bika minan-naar.',
    translation:
        'Ya Allah, sesungguhnya aku memohon kepada-Mu surga dan aku berlindung kepada-Mu dari neraka.',
    reference: 'HR. Abu Daud no. 792, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Terbaik (Jami\'ul Khair)',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ مِنَ الْخَيْرِ كُلِّهِ عَاجِلِهِ وَآجِلِهِ مَا عَلِمْتُ مِنْهُ وَمَا لَمْ أَعْلَمْ وَأَعُوذُ بِكَ مِنَ الشَّرِّ كُلِّهِ عَاجِلِهِ وَآجِلِهِ مَا عَلِمْتُ مِنْهُ وَمَا لَمْ أَعْلَمْ',
    transliteration:
        'Allaahumma innii as\'aluka minal khayri kullihi \'aajilihii wa aajilihii maa \'alimtu minhu wa maa lam a\'lam, wa a\'uudzu bika minasy-syarri kullihi \'aajilihii wa aajilihii maa \'alimtu minhu wa maa lam a\'lam.',
    translation:
        'Ya Allah, sesungguhnya aku memohon kepada-Mu semua kebaikan, yang segera maupun yang ditunda, yang aku ketahui maupun yang tidak aku ketahui. Dan aku berlindung kepada-Mu dari semua kejahatan, yang segera maupun yang ditunda, yang aku ketahui maupun yang tidak aku ketahui.',
    reference:
        'HR. Ahmad no. 26060; Ibnu Majah no. 3846, dishahihkan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  // ──────────────────────────────────────────────
  // 👨‍👩‍👧 KELUARGA & SOSIAL
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa untuk Kedua Orang Tua',
    arabic:
        'رَبِّ اغْفِرْ لِيْ وَلِوَالِدَيَّ رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِيْ صَغِيْرًا',
    transliteration:
        'Rabbighfir lii wa liwalidayya, rabbir-hamhumaa kamaa rabbayaanii shaghiiraa.',
    translation:
        'Ya Rabbku, ampunilah aku dan kedua orang tuaku. Ya Rabbku, sayangilah mereka berdua sebagaimana mereka mendidikku sewaktu kecil.',
    reference: 'QS. Al-Isra: 24 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Minta Keturunan Shalih',
    arabic:
        'رَبِّ هَبْ لِيْ مِنْ لَّدُنْكَ ذُرِّيَّةً طَيِّبَةً إِنَّكَ سَمِيْعُ الدُّعَاءِ',
    transliteration:
        'Rabbi hab lii mil-ladunka dzurriyyatan thayyibah, innaka samii\'ud-du\'aa\'.',
    translation:
        'Ya Rabbku, anugerahkanlah kepadaku dari sisi-Mu keturunan yang baik. Sesungguhnya Engkau Maha Mendengar doa.',
    reference: 'QS. Ali Imran: 38 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa untuk Anak & Keluarga',
    arabic:
        'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا',
    transliteration:
        'Rabbanaa hab lanaa min azwaajinaa wa dzurriyyaatinaa qurrata a\'yunin waj\'alnaa lil-muttaqiina imaamaa.',
    translation:
        'Ya Rabb kami, anugerahkanlah kepada kami pasangan kami dan keturunan kami sebagai penyenang hati, dan jadikanlah kami pemimpin bagi orang-orang yang bertakwa.',
    reference: 'QS. Al-Furqan: 74 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Sebelum Berhubungan Suami Istri',
    arabic:
        'بِسْمِ اللهِ، اَللَّهُمَّ جَنِّبْنَا الشَّيْطَانَ وَجَنِّبِ الشَّيْطَانَ مَا رَزَقْتَنَا',
    transliteration:
        'Bismillaah, Allaahumma jannibnaa asy-syaithaana wa jannibisy-syaithaana maa razaqtanaa.',
    translation:
        'Dengan nama Allah. Ya Allah, jauhkanlah kami dari setan, dan jauhkanlah setan dari apa yang Engkau anugerahkan kepada kami.',
    reference: 'HR. Bukhari no. 141; Muslim no. 1434',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ucapan Selamat kepada Pengantin Baru',
    arabic:
        'بَارَكَ اللهُ لَكَ وَبَارَكَ عَلَيْكَ وَجَمَعَ بَيْنَكُمَا فِيْ خَيْرٍ',
    transliteration:
        'Baarakallaahu laka wa baaraka \'alayka wa jama\'a baynakumaa fii khayr.',
    translation:
        'Semoga Allah memberi berkah kepadamu, memberkahimu, dan mengumpulkan kalian berdua dalam kebaikan.',
    reference:
        'HR. Abu Daud no. 2130; Tirmidzi no. 1091, dishahihkan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Selamat atas Kelahiran Bayi',
    arabic:
        'بَارَكَ اللهُ لَكَ فِي الْمَوْهُوبِ لَكَ وَشَكَرْتَ الْوَاهِبَ وَبَلَغَ أَشُدَّهُ وَرُزِقْتَ بِرَّهُ',
    transliteration:
        'Baarakallaahu laka fil-mawhuubi laka wa syakarta al-waahiba wa balagha asyuddahu wa ruziqta birrah.',
    translation:
        'Semoga Allah memberkahimu dalam anak yang dikaruniakan kepadamu, engkau bersyukur kepada Sang Pemberi, ia mencapai kedewasaan, dan engkau dikaruniai kebaikannya.',
    reference:
        'HR. Ibnu Sunni no. 623, dihasankan Al-Albani dalam Adabuz-Zifaf',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🌟 ALAM SEKITAR & MOMEN KHUSUS
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Ketika Mendapat Nikmat',
    arabic: 'اَلْحَمْدُ لِلَّهِ الَّذِي بِنِعْمَتِهِ تَتِمُّ الصَّالِحَاتُ',
    transliteration:
        'Alhamdulillaahilladzii bini\'matihii tatimmush-shaalihaat.',
    translation:
        'Segala puji bagi Allah yang dengan nikmat-Nya berbagai kebaikan menjadi sempurna.',
    reference: 'HR. Ibnu Majah no. 3803, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Ketika Mendapat Musibah (Istirja\')',
    arabic:
        'إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُوْنَ، اَللَّهُمَّ أْجُرْنِيْ فِيْ مُصِيْبَتِيْ وَأَخْلِفْ لِيْ خَيْرًا مِنْهَا',
    transliteration:
        'Innaa lillaahi wa innaa ilayhi raaji\'uun. Allaahumma\'jurnii fii mushibatii wa akhlif lii khayran minhaa.',
    translation:
        'Sesungguhnya kami milik Allah dan sesungguhnya kami akan kembali kepada-Nya. Ya Allah, berilah aku pahala dalam musibahku ini dan gantikanlah untukku yang lebih baik darinya.',
    reference: 'HR. Muslim no. 918',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Takziyah (Ucapan Belasungkawa)',
    arabic:
        'إِنَّ لِلَّهِ مَا أَخَذَ وَلَهُ مَا أَعْطَى وَكُلٌّ عِنْدَهُ بِأَجَلٍ مُسَمًّى فَلْتَصْبِرْ وَلْتَحْتَسِبْ',
    transliteration:
        'Inna lillaahi maa akhadzaa wa lahu maa a\'thaa wa kullun \'indahuu bi-ajalim musammaa, faltashbir waltahtasib.',
    translation:
        'Sesungguhnya milik Allah apa yang Dia ambil, milik-Nya pula apa yang Dia berikan, dan semua memiliki ajal yang telah ditentukan di sisi-Nya, maka bersabarlah dan berharaplah pahala.',
    reference: 'HR. Bukhari no. 1284; Muslim no. 923',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Masuk Kuburan',
    arabic:
        'السَّلاَمُ عَلَيْكُمْ أَهْلَ الدِّيَارِ مِنَ الْمُؤْمِنِيْنَ وَالْمُسْلِمِيْنَ، وَإِنَّا إِنْ شَاءَ اللهُ بِكُمْ لَاحِقُوْنَ، نَسْأَلُ اللهَ لَنَا وَلَكُمُ الْعَافِيَةَ',
    transliteration:
        'As-salaamu \'alaykum ahlad-diyaari minal mu\'miniina wal muslimiina, wa innaa in syaa\'allaahu bikum laahiquun, nas\'alullaaha lanaa wa lakumul \'aafiyah.',
    translation:
        'Semoga keselamatan atas kalian wahai penghuni tempat ini dari kalangan mukminin dan muslimin. Sesungguhnya kami insya Allah akan menyusul kalian. Kami memohon kepada Allah keselamatan untuk kami dan kalian.',
    reference: 'HR. Muslim no. 975',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa untuk Mayit di Shalat Jenazah',
    arabic:
        'اَللَّهُمَّ اغْفِرْ لَهُ وَارْحَمْهُ وَعَافِهِ وَاعْفُ عَنْهُ وَأَكْرِمْ نُزُلَهُ وَوَسِّعْ مُدْخَلَهُ وَاغْسِلْهُ بِالْمَاءِ وَالثَّلْجِ وَالْبَرَدِ',
    transliteration:
        'Allaahummaghfir lahu warhamhu wa \'aafihii wa\'fu \'anhu wa akrim nuzulahu wa wassi\' madkhalahu waghsilhu bil-maa\'i wats-tsalji wal-barad.',
    translation:
        'Ya Allah, ampunilah dia, rahmatilah dia, sehatkanlah dia, maafkanlah dia, muliakanlah tempat tinggalnya, luaskanlah tempat masuknya, dan mandikanlah dia dengan air, salju, dan embun.',
    reference: 'HR. Muslim no. 963',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Menutup Majelis (Kaffaratul Majelis)',
    arabic:
        'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ أَشْهَدُ أَنْ لاَ إِلَهَ إِلَّا أَنْتَ أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ',
    transliteration:
        'Subhanakallahumma wa bihamdika asyhadu allaa ilaaha illaa anta astaghfiruka wa atuubu ilayk.',
    translation:
        'Maha Suci Engkau ya Allah, dengan memuji-Mu aku bersaksi bahwa tidak ada ilah yang berhak disembah kecuali Engkau, aku memohon ampun kepada-Mu dan bertobat kepada-Mu.',
    reference: 'HR. Abu Daud no. 4857; Tirmidzi no. 3433, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🤧 SUNNAH SEHARI-HARI
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Ucapan Orang yang Bersin',
    arabic: 'اَلْحَمْدُ لِلَّهِ',
    transliteration: 'Alhamdulillaah.',
    translation: 'Segala puji bagi Allah.',
    reference: 'HR. Bukhari no. 6224',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Jawaban untuk Orang yang Bersin',
    arabic: 'يَرْحَمُكَ اللهُ',
    transliteration: 'Yarhamukallaah.',
    translation: 'Semoga Allah merahmatimu.',
    reference: 'HR. Bukhari no. 6224',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Balasan Orang yang Dido\'akan (Yarhamukallah)',
    arabic: 'يَهْدِيكُمُ اللهُ وَيُصْلِحُ بَالَكُمْ',
    transliteration: 'Yahdiikumullahu wa yushlihu baalakum.',
    translation:
        'Semoga Allah memberi kalian petunjuk dan memperbaiki keadaan kalian.',
    reference: 'HR. Bukhari no. 6224',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Melihat Orang yang Ditimpa Musibah',
    arabic:
        'اَلْحَمْدُ لِلَّهِ الَّذِيْ عَافَانِيْ مِمَّا ابْتَلَاكَ بِهِ وَفَضَّلَنِيْ عَلَى كَثِيرٍ مِمَّنْ خَلَقَ تَفْضِيْلًا',
    transliteration:
        'Alhamdulillaahil-ladzii \'aafaanii mimmab-talaaka bihii wa fadhdhalanaa \'alaa katsiirin mimman khalaqa tafdhiilaa.',
    translation:
        'Segala puji bagi Allah yang menyelamatkanku dari apa yang menimpa kamu, dan melebihkan aku di atas banyak dari makhluk-Nya dengan kelebihan yang nyata.',
    reference: 'HR. Tirmidzi no. 3432, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Ketika Melihat Sesuatu yang Mengagumkan',
    arabic: 'سُبْحَانَ اللهِ',
    transliteration: 'Subhaanallaah.',
    translation: 'Maha Suci Allah.',
    reference: 'HR. Bukhari no. 3202',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Terkejut / Kaget',
    arabic: 'سُبْحَانَ اللهِ',
    transliteration: 'Subhaanallaah.',
    translation: 'Maha Suci Allah.',
    reference: 'HR. Bukhari no. 3202',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Ucapan Salam (Memberi Salam)',
    arabic: 'اَلسَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكَاتُهُ',
    transliteration: 'As-salaamu \'alaykum wa rahmatullaahi wa barakaatuh.',
    translation:
        'Semoga keselamatan, rahmat Allah, dan keberkahan-Nya tercurah atas kalian.',
    reference:
        'HR. Abu Daud no. 5195; Tirmidzi no. 2689, dishahihkan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Jawaban Salam',
    arabic: 'وَعَلَيْكُمُ السَّلَامُ وَرَحْمَةُ اللهِ وَبَرَكَاتُهُ',
    transliteration: 'Wa \'alaykumus-salaamu wa rahmatullaahi wa barakaatuh.',
    translation:
        'Dan atas kalian pun keselamatan, rahmat Allah, serta keberkahan-Nya.',
    reference: 'HR. Abu Daud no. 5195; Tirmidzi no. 2689',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Bertemu Saudara Muslim',
    arabic: 'يَرْحَمُنَا وَإِيَّاكُمُ اللهُ',
    transliteration: 'Yarhamuunaa wa iyyaakumullah.',
    translation: 'Semoga Allah merahmati kami dan kalian.',
    reference: 'HR. Bukhari no. 6254',
    sanadLevel: 'Shahih',
  ),

  // ──────────────────────────────────────────────
  // 🕋 IBADAH KHUSUS
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Malam Lailatul Qadar',
    arabic: 'اَللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّيْ',
    transliteration:
        'Allaahumma innaka \'afuwwun tuhibbul-\'afwa fa\'fu \'annii.',
    translation:
        'Ya Allah, sesungguhnya Engkau Maha Pemaaf, Engkau menyukai maaf, maka maafkanlah aku.',
    reference:
        'HR. Tirmidzi no. 3513; Ibnu Majah no. 3850, dishahihkan Al-Albani',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Niat Puasa Ramadhan',
    arabic:
        'نَوَيْتُ صَوْمَ غَدٍ عَنْ أَدَاءِ فَرْضِ رَمَضَانَ هَذِهِ السَّنَةِ لِلَّهِ تَعَالَى',
    transliteration:
        'Nawaytu shauma ghadin \'an adaa\'i fardhi ramadhana haadzihis-sanati lillaahi ta\'aalaa.',
    translation:
        'Aku berniat puasa esok hari untuk menunaikan kewajiban bulan Ramadhan tahun ini karena Allah Ta\'ala.',
    reference:
        'Niat puasa wajib sesuai kaidah fiqih; dirujuk dari kitab-kitab fiqih standar',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Melihat Ka\'bah',
    arabic:
        'اَللَّهُمَّ زِدْ هَذَا الْبَيْتَ تَشْرِيفًا وَتَعْظِيمًا وَتَكْرِيمًا وَمَهَابَةً وَزِدْ مَنْ شَرَّفَهُ وَكَرَّمَهُ مِمَّنْ حَجَّهُ أَوِ اعْتَمَرَهُ تَشْرِيفًا وَتَكْرِيمًا وَتَعْظِيمًا وَبِرًّا',
    transliteration:
        'Allaahumma zid haadzal bayta tasyriifan wa ta\'zhiiman wa takriiman wa mahaabatan wa zid man syarrafahuu wa karramahu mimman hajjahu awi\'tamarahu tasyriifan wa takriiman wa ta\'zhiiman wa birraa.',
    translation:
        'Ya Allah, tambahkanlah pada Baitullah ini kemuliaan, pengagungan, kehormatan, dan kewibawaan. Dan tambahkanlah pada orang yang memuliakannya dan menghormatiku di antara orang yang berhaji atau berumrah, kemuliaan, kehormatan, pengagungan, dan kebaikan.',
    reference:
        'HR. Asy-Syafi\'i dalam Al-Musnad; dihasankan oleh beberapa ulama',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Hari Arafah (Terbaik)',
    arabic:
        'لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
    transliteration:
        'Laa ilaaha illallaahu wahdahu laa syariika lahu, lahul-mulku wa lahul-hamdu wa huwa \'alaa kulli syay\'in qadiir.',
    translation:
        'Tidak ada ilah yang berhak disembah kecuali Allah semata, tiada sekutu bagi-Nya, bagi-Nya kerajaan dan segala pujian, dan Dia Maha Kuasa atas segala sesuatu.',
    reference:
        'HR. Tirmidzi no. 3585, dihasankan Al-Albani — doa terbaik di hari Arafah',
    sanadLevel: 'Hasan',
  ),

  // ──────────────────────────────────────────────
  // 🧿 PERLINDUNGAN & RUQYAH
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Perlindungan Jiwa & Harta (Tsalasa Mupah)',
    arabic:
        'بِسْمِ اللهِ الَّذِيْ لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ',
    transliteration:
        'Bismillaahil-ladzii laa yadhurru ma\'asmihi syay\'un fil-ardhi wa laa fis-samaa\'i wa huwas-samii\'ul \'aliim.',
    translation:
        'Dengan nama Allah yang tidak ada sesuatu pun yang membahayakan bersama nama-Nya, baik di bumi maupun di langit. Dia Maha Mendengar lagi Maha Mengetahui.',
    reference:
        'HR. Abu Daud no. 5088; Tirmidzi no. 3388, dishahihkan Al-Albani — dibaca 3x pagi dan petang',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Memohon Perlindungan Komprehensif',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَعُوذُ بِكَ مِنَ الْكُفْرِ وَالْفَقْرِ وَعَذَابِ الْقَبْرِ',
    transliteration:
        'Allaahumma innii a\'uudzu bika minal kufri wal faqri wa \'adzaabil qabr.',
    translation:
        'Ya Allah, sesungguhnya aku berlindung kepada-Mu dari kekufuran, kefakiran, dan azab kubur.',
    reference: 'HR. An-Nasai no. 5494, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Hauqalah (Penghilang Kesulitan)',
    arabic: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
    transliteration: 'Laa hawla wa laa quwwata illaa billaah.',
    translation:
        'Tidak ada daya dan kekuatan kecuali dengan (pertolongan) Allah.',
    reference: 'HR. Bukhari no. 4205; Muslim no. 2704 — salah satu harta surga',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Minta Perlindungan Saat Malam',
    arabic: 'أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
    transliteration:
        'A\'uudzu bikalimaatillaahit-taammati min syarri maa khalaq.',
    translation:
        'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari keburukan apa yang Dia ciptakan.',
    reference: 'HR. Muslim no. 2709 — dibaca 3x di malam hari',
    sanadLevel: 'Shahih',
  ),

  // ──────────────────────────────────────────────
  // 🌿 TAMBAHAN DOA PILIHAN
  // ──────────────────────────────────────────────
  DoaModel(
    title: 'Doa Minta Ampunan Bagi Seluruh Umat Muslim',
    arabic:
        'رَبَّنَا اغْفِرْ لَنَا وَلِإِخْوَانِنَا الَّذِينَ سَبَقُونَا بِالْإِيمَانِ',
    transliteration:
        'Rabbanaaghfir lanaa wa li-ikhwaaninalladzina sabaquunaa bil-iimaan.',
    translation:
        'Ya Rabb kami, ampunilah kami dan saudara-saudara kami yang telah beriman lebih dahulu dari kami.',
    reference: 'QS. Al-Hasyr: 10 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Ketika Melihat Orang dalam Nikmat (Agar Tidak Hasad)',
    arabic: 'مَا شَاءَ اللهُ لَا قُوَّةَ إِلَّا بِاللهِ',
    transliteration: 'Maa syaa\'allaahu laa quwwata illaa billaah.',
    translation:
        'Atas kehendak Allah semua ini terwujud, tiada kekuatan kecuali dengan pertolongan Allah.',
    reference: 'QS. Al-Kahfi: 39 (Al-Qur\'an)',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Minta Ampun Tiga Kali',
    arabic:
        'أَسْتَغْفِرُ اللهَ الْعَظِيمَ الَّذِيْ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ وَأَتُوبُ إِلَيْهِ',
    transliteration:
        'Astaghfirullaah al-\'azhiimaladzii laa ilaaha illaa huwal hayyul qayyuum wa atuubu ilaih.',
    translation:
        'Aku memohon ampun kepada Allah Yang Maha Agung, yang tidak ada ilah yang berhak disembah kecuali Dia, Yang Maha Hidup lagi terus menerus mengurus makhluk-Nya, dan aku bertobat kepada-Nya.',
    reference: 'HR. Abu Daud no. 1517; Tirmidzi no. 3577, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Setelah Membaca Shalawat / Tasbih',
    arabic: 'اَللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
    transliteration:
        'Allaahumma shalli wa sallim \'alaa nabiyyinaa muhammadin.',
    translation:
        'Ya Allah, limpahkanlah shalawat dan keselamatan kepada Nabi kami Muhammad.',
    reference:
        'HR. Bukhari no. 3370; Muslim no. 408 — bershalawat sebanyak-banyaknya di hari Jumat',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Memohon Ampunan (Istighfar Ringkas)',
    arabic: 'أَسْتَغْفِرُ اللهَ وَأَتُوبُ إِلَيهِ',
    transliteration: 'Astaghfirullaaha wa atuubu ilayh.',
    translation: 'Aku memohon ampun kepada Allah dan bertobat kepada-Nya.',
    reference: 'HR. Bukhari no. 6307; Muslim no. 2702',
    sanadLevel: 'Shahih',
  ),

  DoaModel(
    title: 'Doa Mendengar Kabar Gembira',
    arabic: 'اَلْحَمْدُ لِلَّهِ الَّذِيْ بِنِعْمَتِهِ تَتِمُّ الصَّالِحَاتُ',
    transliteration:
        'Alhamdulillaahil-ladzii bini\'matihii tatimmush-shaalihaat.',
    translation:
        'Segala puji bagi Allah yang dengan nikmat-Nya berbagai kebaikan menjadi sempurna.',
    reference: 'HR. Ibnu Majah no. 3803, dihasankan Al-Albani',
    sanadLevel: 'Hasan',
  ),

  DoaModel(
    title: 'Doa Mohon Rezeki & Amal yang Baik',
    arabic:
        'اَللَّهُمَّ إِنِّيْ أَسْأَلُكَ الْعِلْمَ النَّافِعَ وَالرِّزْقَ الطَّيِّبَ وَالْعَمَلَ الْمُتَقَبَّلَ',
    transliteration:
        'Allaahumma innii as\'alukal \'ilman naafi\'a war-rizqath-thayyiba wal-\'amalal-mutaqabbal.',
    translation:
        'Ya Allah, sesungguhnya aku memohon kepada-Mu ilmu yang bermanfaat, rezeki yang baik, dan amal yang diterima.',
    reference:
        'HR. Ibnu Majah no. 925; Ahmad no. 26837, dihasankan Al-Albani — dibaca setelah Subuh',
    sanadLevel: 'Hasan',
  ),
];
