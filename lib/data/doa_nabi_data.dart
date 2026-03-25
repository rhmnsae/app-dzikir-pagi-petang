class DoaNabiModel {
  final String id;
  final String namaNabi;
  final String konteks;
  final String arab;
  final String latin;
  final String arti;
  final String referensi;

  const DoaNabiModel({
    required this.id,
    required this.namaNabi,
    required this.konteks,
    required this.arab,
    required this.latin,
    required this.arti,
    required this.referensi,
  });
}

const List<DoaNabiModel> doaNabiList = [
  // ─────────────────────────────────────────
  // NABI ADAM AS & HAWA
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '1',
    namaNabi: 'Nabi Adam AS & Hawa',
    konteks: 'Doa memohon ampunan setelah memakan buah khuldi',
    arab:
        'رَبَّنَا ظَلَمْنَآ أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ ٱلْخَٰسِرِينَ',
    latin:
        'Rabbanaa zhalamnaa anfusanaa wa-in lam taghfirlanaa watarhamnaa lanakuunanna minal khaasiriin.',
    arti:
        '"Ya Tuhan kami, kami telah menzalimi diri kami sendiri. Jika Engkau tidak mengampuni kami dan memberi rahmat kepada kami, niscaya kami termasuk orang-orang yang rugi."',
    referensi: 'QS. Al-A\'raf: 23',
  ),

  // ─────────────────────────────────────────
  // NABI NUH AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '2',
    namaNabi: 'Nabi Nuh AS',
    konteks:
        'Doa memohon ampunan untuk diri sendiri, orang tua, dan orang-orang beriman',
    arab:
        'رَّبِّ ٱغْفِرْ لِى وَلِوَٰلِدَىَّ وَلِمَن دَخَلَ بَيْتِىَ مُؤْمِنًا وَلِلْمُؤْمِنِينَ وَٱلْمُؤْمِنَٰتِ وَلَا تَزِدِ ٱلظَّٰلِمِينَ إِلَّا تَبَارًۢا',
    latin:
        'Rabbighfir lii wa liwaalidayya wa liman dakhala baytiya mu\'minan wa lilmu\'miniina wal mu\'minaati, wa laa tazidizh-zhaalimiina illaa tabaaraa.',
    arti:
        '"Ya Tuhanku! Ampunilah aku, ibu bapakku, orang yang masuk ke rumahku dengan beriman dan semua orang yang beriman laki-laki dan perempuan. Dan janganlah Engkau tambahkan bagi orang-orang yang zalim itu selain kebinasaan."',
    referensi: 'QS. Nuh: 28',
  ),
  DoaNabiModel(
    id: '3',
    namaNabi: 'Nabi Nuh AS',
    konteks: 'Doa memohon pertolongan saat didustakan kaumnya',
    arab: 'رَّبِّ ٱنصُرْنِى بِمَا كَذَّبُونِ',
    latin: 'Rabbinsurnii bimaa kadzdzabuun.',
    arti: '"Ya Tuhanku, tolonglah aku karena mereka mendustakanku."',
    referensi: 'QS. Al-Mu\'minun: 26',
  ),
  DoaNabiModel(
    id: '4',
    namaNabi: 'Nabi Nuh AS',
    konteks:
        'Doa berlindung dari memohon sesuatu yang tidak diketahui hakikatnya',
    arab:
        'رَبِّ إِنِّىٓ أَعُوذُ بِكَ أَنْ أَسْـَٔلَكَ مَا لَيْسَ لِى بِهِۦ عِلْمٌ ۖ وَإِلَّا تَغْفِرْ لِى وَتَرْحَمْنِىٓ أَكُن مِّنَ ٱلْخَٰسِرِينَ',
    latin:
        'Rabbi innii a\'uudzubika an as-alaka maa laysa lii bihi \'ilm, wa illaa taghfir lii wa tarhamnii akun minal khaasiriin.',
    arti:
        '"Ya Tuhanku, sesungguhnya aku berlindung kepada-Mu untuk memohon sesuatu yang aku tidak mengetahui hakikatnya. Kalau Engkau tidak mengampuniku dan menaruh belas kasihan kepadaku, niscaya aku termasuk orang-orang yang merugi."',
    referensi: 'QS. Hud: 47',
  ),

  // ─────────────────────────────────────────
  // NABI HUD AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '5',
    namaNabi: 'Nabi Hud AS',
    konteks:
        'Doa berserah diri kepada Allah setelah berjuang di hadapan kaumnya',
    arab:
        'إِنِّى تَوَكَّلْتُ عَلَى ٱللَّهِ رَبِّى وَرَبِّكُم ۚ مَّا مِن دَآبَّةٍ إِلَّا هُوَ ءَاخِذٌۢ بِنَاصِيَتِهَآ ۚ إِنَّ رَبِّى عَلَىٰ صِرَٰطٍ مُّسْتَقِيمٍ',
    latin:
        'Innii tawakkaltu \'alallaahi rabbii wa rabbikum, maa min daabbatin illaa huwa aakhidzun binaashiyatihaa, inna rabbii \'alaa shiraathin mustaqiim.',
    arti:
        '"Sesungguhnya aku bertawakal kepada Allah, Tuhanku dan Tuhanmu. Tidak ada satu makhluk bergerak pun melainkan Dia-lah yang memegang ubun-ubunnya. Sesungguhnya Tuhanku di atas jalan yang lurus."',
    referensi: 'QS. Hud: 56',
  ),

  // ─────────────────────────────────────────
  // NABI IBRAHIM AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '6',
    namaNabi: 'Nabi Ibrahim AS & Nabi Ismail AS',
    konteks: 'Doa saat membangun Ka\'bah',
    arab:
        'رَبَّنَا تَقَبَّلْ مِنَّآ ۖ إِنَّكَ أَنتَ ٱلسَّمِيعُ ٱلْعَلِيمُ ۝ رَبَّنَا وَٱجْعَلْنَا مُسْلِمَيْنِ لَكَ وَمِن ذُرِّيَّتِنَآ أُمَّةً مُّسْلِمَةً لَّكَ وَأَرِنَا مَنَاسِكَنَا وَتُبْ عَلَيْنَآ ۖ إِنَّكَ أَنتَ ٱلتَّوَّابُ ٱلرَّحِيمُ',
    latin:
        'Rabbanaa taqabbal minnaa innaka antas-samii\'ul \'aliim. Rabbanaa waj\'alnaa muslimayni laka wa min dzurriyyatinaa ummatam muslimatal laka wa arinaa manaasikanaa wa tub \'alainaa innaka antat-tawwaabur-rahiim.',
    arti:
        '"Ya Tuhan kami, terimalah (amal) dari kami. Sungguh, Engkaulah Yang Maha Mendengar, Maha Mengetahui. Ya Tuhan kami, jadikanlah kami berdua orang yang berserah diri kepada-Mu dan (jadikanlah) dari keturunan kami umat yang berserah diri kepada-Mu, tunjukkanlah kepada kami cara-cara melakukan ibadah kami, dan terimalah tobat kami. Sungguh Engkaulah Yang Maha Penerima tobat, Maha Penyayang."',
    referensi: 'QS. Al-Baqarah: 127-128',
  ),
  DoaNabiModel(
    id: '7',
    namaNabi: 'Nabi Ibrahim AS',
    konteks:
        'Doa memohon keamanan kota Makkah dan dijauhkan dari penyembahan berhala',
    arab:
        'رَبِّ ٱجْعَلْ هَٰذَا ٱلْبَلَدَ ءَامِنًا وَٱجْنُبْنِى وَبَنِىَّ أَن نَّعْبُدَ ٱلْأَصْنَامَ',
    latin:
        'Rabbij\'al haadzal balada aaminan wajnubnii wa baniyya an na\'budal ashnaam.',
    arti:
        '"Ya Tuhanku, jadikanlah negeri ini (Makkah) negeri yang aman, dan jauhkanlah aku beserta anak cucuku dari menyembah berhala."',
    referensi: 'QS. Ibrahim: 35',
  ),
  DoaNabiModel(
    id: '8',
    namaNabi: 'Nabi Ibrahim AS',
    konteks:
        'Doa memohon agar dijadikan hamba yang mendirikan shalat dan keturunannya',
    arab:
        'رَبِّ ٱجْعَلْنِى مُقِيمَ ٱلصَّلَوٰةِ وَمِن ذُرِّيَّتِى ۚ رَبَّنَا وَتَقَبَّلْ دُعَآءِ',
    latin:
        'Rabbij\'alnii muqiimash-shalaati wa min dzurriyyatii rabbanaa wa taqabbal du\'aa.',
    arti:
        '"Ya Tuhanku, jadikanlah aku dan anak cucuku orang-orang yang tetap mendirikan shalat, ya Tuhan kami, perkenankanlah doaku."',
    referensi: 'QS. Ibrahim: 40',
  ),
  DoaNabiModel(
    id: '9',
    namaNabi: 'Nabi Ibrahim AS',
    konteks:
        'Doa memohon ampunan untuk diri sendiri, kedua orang tua, dan seluruh orang beriman',
    arab:
        'رَبَّنَا ٱغْفِرْ لِى وَلِوَٰلِدَىَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ ٱلْحِسَابُ',
    latin:
        'Rabbanaa ighfir lii wa liwaalidayya wa lil mu\'miniina yawma yaquumul hisaab.',
    arti:
        '"Ya Tuhan kami, ampunilah aku dan kedua orang tuaku dan orang-orang mukmin pada hari diadakannya perhitungan (amal)."',
    referensi: 'QS. Ibrahim: 41',
  ),
  DoaNabiModel(
    id: '10',
    namaNabi: 'Nabi Ibrahim AS',
    konteks:
        'Doa memohon hikmah, dipertemukan dengan orang saleh, dan dimasukkan ke surga',
    arab:
        'رَبِّ هَبْ لِى حُكْمًا وَأَلْحِقْنِى بِٱلصَّٰلِحِينَ ۝ وَٱجْعَل لِّى لِسَانَ صِدْقٍ فِى ٱلْءَاخِرِينَ ۝ وَٱجْعَلْنِى مِن وَرَثَةِ جَنَّةِ ٱلنَّعِيمِ',
    latin:
        'Rabbi hab lii hukman wa alhiqnii bish-shaalihiin. Waj\'al lii lisaana shidqin fil aakhiriin. Waj\'alnii min waratsati jannatinna\'iim.',
    arti:
        '"Ya Tuhanku, berikanlah kepadaku hikmah dan masukkanlah aku ke dalam golongan orang-orang saleh, dan jadikanlah aku buah tutur yang baik bagi orang-orang (yang datang) kemudian, dan jadikanlah aku termasuk orang-orang yang mewarisi surga yang penuh kenikmatan."',
    referensi: 'QS. Asy-Syu\'ara: 83-85',
  ),
  DoaNabiModel(
    id: '11',
    namaNabi: 'Nabi Ibrahim AS',
    konteks: 'Doa meminta keturunan yang saleh',
    arab: 'رَبِّ هَبْ لِى مِنَ ٱلصَّٰلِحِينَ',
    latin: 'Rabbi hab lii minash-shaalihiin.',
    arti:
        '"Ya Tuhanku, anugerahkanlah kepadaku (seorang anak) yang termasuk orang-orang yang saleh."',
    referensi: 'QS. As-Saffat: 100',
  ),

  // ─────────────────────────────────────────
  // NABI LUTH AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '12',
    namaNabi: 'Nabi Luth AS',
    konteks:
        'Doa memohon keselamatan diri dan keluarga dari perbuatan keji kaumnya',
    arab: 'رَبِّ نَجِّنِى وَأَهْلِى مِمَّا يَعْمَلُونَ',
    latin: 'Rabbi najjinii wa ahlii mimmaa ya\'maluun.',
    arti:
        '"Ya Tuhanku selamatkanlah aku beserta keluargaku dari (akibat) perbuatan yang mereka kerjakan."',
    referensi: 'QS. Asy-Syu\'ara: 169',
  ),
  DoaNabiModel(
    id: '13',
    namaNabi: 'Nabi Luth AS',
    konteks: 'Doa memohon pertolongan Allah dari kaum yang berbuat kerusakan',
    arab: 'رَبِّ ٱنصُرْنِى عَلَى ٱلْقَوْمِ ٱلْمُفْسِدِينَ',
    latin: 'Rabbinsurnii \'alal qawmil mufsidin.',
    arti: '"Ya Tuhanku, tolonglah aku atas kaum yang berbuat kerusakan."',
    referensi: 'QS. Al-\'Ankabut: 30',
  ),

  // ─────────────────────────────────────────
  // NABI SYU'AIB AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '14',
    namaNabi: 'Nabi Syu\'aib AS',
    konteks: 'Doa memohon keputusan Allah yang adil antara dirinya dan kaumnya',
    arab:
        'رَبَّنَا ٱفْتَحْ بَيْنَنَا وَبَيْنَ قَوْمِنَا بِٱلْحَقِّ وَأَنتَ خَيْرُ ٱلْفَٰتِحِينَ',
    latin:
        'Rabbanaf-tah bainana wa baina qaumina bil haqqi wa anta khairul faatihiin.',
    arti:
        '"Ya Tuhan kami, berilah keputusan antara kami dan kaum kami dengan hak (adil) dan Engkaulah Pemberi keputusan yang terbaik."',
    referensi: 'QS. Al-A\'raf: 89',
  ),

  // ─────────────────────────────────────────
  // NABI YUSUF AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '15',
    namaNabi: 'Nabi Yusuf AS',
    konteks: 'Doa memohon perlindungan dari godaan dan kebodohan',
    arab:
        'رَبِّ السِّجْنُ أَحَبُّ إِلَيَّ مِمَّا يَدْعُونَنِي إِلَيْهِ ۖ وَإِلَّا تَصْرِفْ عَنِّي كَيْدَهُنَّ أَصْبُ إِلَيْهِنَّ وَأَكُن مِّنَ الْجَاهِلِينَ',
    latin:
        'Rabbis-sijnu ahabb ilayya mimmaa yad\'uunaniii ilayh, wa illaa tashrif \'anni kaidahunna ashbu ilaihinna wa akun minal jaahiliin.',
    arti:
        '"Ya Tuhanku, penjara lebih aku sukai daripada memenuhi ajakan mereka. Dan jika Engkau tidak menghindarkan aku dari tipu daya mereka, tentu aku akan cenderung untuk memenuhi keinginan mereka dan tentulah aku termasuk orang-orang yang bodoh."',
    referensi: 'QS. Yusuf: 33',
  ),
  DoaNabiModel(
    id: '16',
    namaNabi: 'Nabi Yusuf AS',
    konteks:
        'Doa memohon wafat dalam keadaan Muslim dan bergabung dengan orang-orang saleh',
    arab:
        'رَبِّ قَدْ آتَيْتَنِي مِنَ الْمُلْكِ وَعَلَّمْتَنِي مِن تَأْوِيلِ الْأَحَادِيثِ ۚ فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ أَنتَ وَلِيِّي فِي الدُّنْيَا وَالْآخِرَةِ ۖ تَوَفَّنِي مُسْلِمًا وَأَلْحِقْنِي بِالصَّالِحِينَ',
    latin:
        'Rabbi qad aataytanii minal mulki wa \'allamtanii min ta\'wiilil ahaadits, faathiras-samaawaati wal ardhi anta waliyyii fid-dunyaa wal aakhirah, tawaffanii musliman wa alhiqnii bish-shaalihiin.',
    arti:
        '"Ya Tuhanku, sesungguhnya Engkau telah menganugerahkan kepadaku sebagian kekuasaan dan mengajarkan kepadaku sebagian takwil mimpi. (Ya Allah) Pencipta langit dan bumi, Engkaulah pelindungku di dunia dan di akhirat, wafatkanlah aku dalam keadaan Islam dan gabungkanlah aku dengan orang-orang yang saleh."',
    referensi: 'QS. Yusuf: 101',
  ),

  // ─────────────────────────────────────────
  // NABI MUSA AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '17',
    namaNabi: 'Nabi Musa AS',
    konteks:
        'Doa memohon kelapangan dada, kemudahan urusan, dan kelancaran bicara',
    arab:
        'رَبِّ ٱشْرَحْ لِى صَدْرِى ۝ وَيَسِّرْ لِىٓ أَمْرِى ۝ وَٱحْلُلْ عُقْدَةً مِّن لِّسَانِى ۝ يَفْقَهُوا۟ قَوْلِى',
    latin:
        'Rabbisyrah lii shadrii. Wa yassir lii amrii. Wahlul \'uqdatan min lisaanii. Yafqahuu qaulii.',
    arti:
        '"Ya Tuhanku, lapangkanlah untukku dadaku, dan mudahkanlah untukku urusanku, dan lepaskanlah kekakuan dari lidahku, supaya mereka mengerti perkataanku."',
    referensi: 'QS. Thaha: 25-28',
  ),
  DoaNabiModel(
    id: '18',
    namaNabi: 'Nabi Musa AS',
    konteks:
        'Doa memohon kebaikan setelah menolong kedua putri Nabi Syu\'aib AS',
    arab: 'رَبِّ إِنِّى لِمَآ أَنزَلْتَ إِلَىَّ مِنْ خَيْرٍ فَقِيرٌ',
    latin: 'Rabbi innii limaa anzalta ilayya min khairin faqiir.',
    arti:
        '"Ya Tuhanku sesungguhnya aku sangat memerlukan sesuatu kebaikan yang Engkau turunkan kepadaku."',
    referensi: 'QS. Al-Qasas: 24',
  ),
  DoaNabiModel(
    id: '19',
    namaNabi: 'Nabi Musa AS',
    konteks:
        'Doa taubat setelah secara tidak sengaja menghilangkan nyawa seseorang',
    arab: 'رَبِّ إِنِّى ظَلَمْتُ نَفْسِى فَٱغْفِرْ لِى',
    latin: 'Rabbi innii zhalamtu nafsii faghfir lii.',
    arti:
        '"Ya Tuhanku, sesungguhnya aku telah menganiaya diriku sendiri karena itu ampunilah aku."',
    referensi: 'QS. Al-Qasas: 16',
  ),
  DoaNabiModel(
    id: '20',
    namaNabi: 'Nabi Musa AS',
    konteks: 'Doa memohon pertolongan ketika dikejar Fir\'aun',
    arab: 'رَبِّ ٱنصُرْنِى عَلَى ٱلْقَوْمِ ٱلْمُفْسِدِينَ',
    latin: 'Rabbinsurnii \'alal qawmil mufsidin.',
    arti: '"Ya Tuhanku, tolonglah aku atas kaum yang berbuat kerusakan."',
    referensi: 'QS. Al-\'Ankabut: 30 (doa yang juga dipanjatkan Nabi Musa AS)',
  ),
  DoaNabiModel(
    id: '21',
    namaNabi: 'Nabi Musa AS & Nabi Harun AS',
    konteks:
        'Doa memohon perlindungan dari fitnah dan kesabaran menghadapi Fir\'aun',
    arab: 'رَبَّنَآ إِنَّنَا نَخَافُ أَن يَفْرُطَ عَلَيْنَآ أَوْ أَن يَطْغَىٰ',
    latin: 'Rabbanaa innanaa nakhafu ay yafratha \'alainaa aw ay yathghaa.',
    arti:
        '"Ya Tuhan kami, sesungguhnya kami khawatir bahwa dia akan segera menyiksa kami atau akan bertambah melampaui batas."',
    referensi: 'QS. Thaha: 45',
  ),

  // ─────────────────────────────────────────
  // NABI AYYUB AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '22',
    namaNabi: 'Nabi Ayyub AS',
    konteks: 'Doa memohon kesembuhan dari penyakit yang parah',
    arab: 'أَنِّى مَسَّنِىَ ٱلضُّرُّ وَأَنتَ أَرْحَمُ ٱلرَّٰحِمِينَ',
    latin: 'Annii massaniyadh-dhurru wa anta arhamur-raahimiin.',
    arti:
        '"(Ya Tuhanku), sesungguhnya aku telah ditimpa penyakit dan Engkau adalah Tuhan Yang Maha Penyayang di antara semua penyayang."',
    referensi: 'QS. Al-Anbiya\': 83',
  ),

  // ─────────────────────────────────────────
  // NABI YUNUS AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '23',
    namaNabi: 'Nabi Yunus AS',
    konteks: 'Doa pertobatan saat berada di dalam perut ikan paus',
    arab:
        'لَّآ إِلَٰهَ إِلَّآ أَنتَ سُبْحَٰنَكَ إِنِّى كُنتُ مِنَ ٱلظَّٰلِمِينَ',
    latin: 'Laa ilaaha illaa anta subhaanaka innii kuntu minadh-dhaalimiin.',
    arti:
        '"Tidak ada Tuhan selain Engkau. Maha Suci Engkau, sungguh aku adalah termasuk orang-orang yang zalim."',
    referensi:
        'QS. Al-Anbiya\': 87 (Keutamaannya disebutkan dalam HR. Tirmidzi no. 3505 & Ahmad no. 1462 – Shahih)',
  ),

  // ─────────────────────────────────────────
  // NABI SULAIMAN AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '24',
    namaNabi: 'Nabi Sulaiman AS',
    konteks:
        'Doa mensyukuri nikmat dan memohon dimasukkan ke golongan hamba yang saleh',
    arab:
        'رَبِّ أَوْزِعْنِىٓ أَنْ أَشْكُرَ نِعْمَتَكَ ٱلَّتِىٓ أَنْعَمْتَ عَلَىَّ وَعَلَىٰ وَٰلِدَىَّ وَأَنْ أَعْمَلَ صَٰلِحًا تَرْضَىٰهُ وَأَدْخِلْنِى بِرَحْمَتِكَ فِى عِبَادِكَ ٱلصَّٰلِحِينَ',
    latin:
        'Rabbi awzi\'nii an asykura ni\'matakallatii an\'amta \'alayya wa \'alaa waalidayya wa an a\'mala shaalihan tardhaahu wa adkhilnii birahmatika fii \'ibaadikash-shaalihiin.',
    arti:
        '"Ya Tuhanku, berilah aku ilham untuk tetap mensyukuri nikmat-Mu yang telah Engkau anugerahkan kepadaku dan kepada dua orang ibu bapakku dan untuk mengerjakan amal saleh yang Engkau ridhai; dan masukkanlah aku dengan rahmat-Mu ke dalam golongan hamba-hamba-Mu yang saleh."',
    referensi: 'QS. An-Naml: 19',
  ),
  DoaNabiModel(
    id: '25',
    namaNabi: 'Nabi Sulaiman AS',
    konteks: 'Doa memohon ampunan dan kerajaan yang mulia sebagai karunia',
    arab:
        'رَبِّ ٱغْفِرْ لِى وَهَبْ لِى مُلْكًا لَّا يَنۢبَغِى لِأَحَدٍ مِّنۢ بَعْدِىٓ ۖ إِنَّكَ أَنتَ ٱلْوَهَّابُ',
    latin:
        'Rabbighfir lii wa hab lii mulkan laa yanbaghii li-ahadin min ba\'dii innaka antal wahhaab.',
    arti:
        '"Ya Tuhanku, ampunilah aku dan anugerahkanlah kepadaku kerajaan yang tidak dimiliki oleh seorang pun sesudahku, sesungguhnya Engkaulah Yang Maha Pemberi."',
    referensi: 'QS. Sad: 35',
  ),

  // ─────────────────────────────────────────
  // NABI ZAKARIYA AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '26',
    namaNabi: 'Nabi Zakariya AS',
    konteks: 'Doa memohon keturunan yang baik dari sisi Allah',
    arab:
        'رَبِّ هَبْ لِى مِن لَّدُنكَ ذُرِّيَّةً طَيِّبَةً ۖ إِنَّكَ سَمِيعُ ٱلدُّعَآءِ',
    latin:
        'Rabbi hab lii min ladunka dzurriyyatan thayyibatan innaka samii\'ud-du\'aa.',
    arti:
        '"Ya Tuhanku, berilah aku dari sisi Engkau seorang anak yang baik. Sesungguhnya Engkau Maha Pendengar doa."',
    referensi: 'QS. Ali \'Imran: 38',
  ),
  DoaNabiModel(
    id: '27',
    namaNabi: 'Nabi Zakariya AS',
    konteks: 'Doa memohon agar tidak ditinggalkan tanpa keturunan',
    arab: 'رَبِّ لَا تَذَرْنِى فَرْدًا وَأَنتَ خَيْرُ ٱلْوَٰرِثِينَ',
    latin: 'Rabbi laa tadzarnii fardan wa anta khairul waaritsiin.',
    arti:
        '"Ya Tuhanku, janganlah Engkau membiarkan aku seorang diri (tanpa keturunan), dan Engkaulah ahli waris yang terbaik."',
    referensi: 'QS. Al-Anbiya\': 89',
  ),
  DoaNabiModel(
    id: '28',
    namaNabi: 'Nabi Zakariya AS',
    konteks: 'Doa dengan suara lembut memohon keturunan setelah usia tua',
    arab:
        'رَبِّ إِنِّى وَهَنَ ٱلْعَظْمُ مِنِّى وَٱشْتَعَلَ ٱلرَّأْسُ شَيْبًا وَلَمْ أَكُنۢ بِدُعَآئِكَ رَبِّ شَقِيًّا ۝ فَهَبْ لِى مِن لَّدُنكَ وَلِيًّا',
    latin:
        'Rabbi innii wahanalazmu minnii wasyta\'alar-ra\'su syaibaa wa lam akum bidu\'aa-ika rabbi syaqiyyaa. Fa hab lii min ladunka waliyyaa.',
    arti:
        '"Ya Tuhanku, sesungguhnya tulangku telah lemah dan kepalaku telah dipenuhi uban, dan aku belum pernah kecewa dalam berdoa kepada-Mu, ya Tuhanku. Dan sesungguhnya aku khawatir terhadap saudara-saudaraku sepeninggalku, sedang istriku adalah seorang yang mandul, maka anugerahkanlah aku dari sisi-Mu seorang putra."',
    referensi: 'QS. Maryam: 4-5',
  ),

  // ─────────────────────────────────────────
  // NABI ISA AS
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '29',
    namaNabi: 'Nabi Isa AS',
    konteks: 'Doa memohon hidangan dari langit sebagai tanda kekuasaan Allah',
    arab:
        'رَبَّنَآ أَنزِلْ عَلَيْنَا مَآئِدَةً مِّنَ ٱلسَّمَآءِ تَكُونُ لَنَا عِيدًا لِّأَوَّلِنَا وَءَاخِرِنَا وَءَايَةً مِّنكَ ۖ وَٱرْزُقْنَا وَأَنتَ خَيْرُ ٱلرَّٰزِقِينَ',
    latin:
        'Rabbanaa anzil \'alainaa maa-idatan minas-samaa-i takuunu lanaa \'iidan li-awwalinaa wa aakhirinaa wa aayatan minka warzuqnaa wa anta khairur-raaziqiin.',
    arti:
        '"Ya Tuhan kami, turunkanlah kiranya kepada kami suatu hidangan dari langit (yang hari turunnya) akan menjadi hari raya bagi kami yaitu bagi orang-orang yang bersama kami dan yang datang sesudah kami, dan menjadi tanda bagi kekuasaan Engkau; beri rezekilah kami, dan Engkaulah pemberi rezeki Yang Paling Utama."',
    referensi: 'QS. Al-Ma\'idah: 114',
  ),
  DoaNabiModel(
    id: '30',
    namaNabi: 'Nabi Isa AS',
    konteks: 'Doa menyerahkan urusan umatnya sepenuhnya kepada Allah',
    arab:
        'إِن تُعَذِّبْهُمْ فَإِنَّهُمْ عِبَادُكَ ۖ وَإِن تَغْفِرْ لَهُمْ فَإِنَّكَ أَنتَ ٱلْعَزِيزُ ٱلْحَكِيمُ',
    latin:
        'In tu\'adzdzibhum fa-innahum \'ibaaduk, wa in taghfir lahum fa-innaka antal \'aziizul hakiim.',
    arti:
        '"Jika Engkau menyiksa mereka, maka sesungguhnya mereka adalah hamba-hamba-Mu, dan jika Engkau mengampuni mereka, sesungguhnya Engkaulah Yang Maha Perkasa, Maha Bijaksana."',
    referensi: 'QS. Al-Ma\'idah: 118',
  ),

  // ─────────────────────────────────────────
  // NABI MUHAMMAD SAW
  // ─────────────────────────────────────────
  DoaNabiModel(
    id: '31',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa sapu jagat – kebaikan dunia dan akhirat (paling sering beliau baca)',
    arab:
        'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    latin:
        'Rabbanaa aatinaa fid-dunyaa hasanah, wa fil aakhirati hasanah, wa qinaa \'adzaaban-naar.',
    arti:
        '"Ya Tuhan kami, berilah kami kebaikan di dunia dan kebaikan di akhirat dan peliharalah kami dari siksa neraka."',
    referensi: 'HR. Bukhari no. 4522 & Muslim no. 2690 (Shahih)',
  ),
  DoaNabiModel(
    id: '32',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Sayyidul Istighfar – penghulu seluruh istighfar',
    arab:
        'اللَّهُمَّ أَنْتَ رَبِّي لاَ إِلَهَ إِلاَّ أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ بِذَنْبِي فَاغْفِرْ لِي، فَإِنَّهُ لاَ يَغْفِرُ الذُّنُوبَ إِلاَّ أَنْتَ',
    latin:
        'Allahumma anta rabbii laa ilaaha illaa anta, khalaqtanii wa anaa \'abduka, wa anaa \'alaa \'ahdika wawa\'dika mas-tatha\'tu, a\'uudzubika min syarri maa shana\'tu, abuu-u laka bini\'matika \'alayya, wa abuu-u bidzanbii faghfirlii, fa-innahu laa yaghfirudz-dzunuuba illaa anta.',
    arti:
        '"Ya Allah, Engkau adalah Tuhanku, tidak ada Tuhan yang berhak diibadahi selain Engkau. Engkau telah menciptakanku dan aku adalah hamba-Mu. Aku menepati perjanjian-Mu dan janji-Mu sesuai kemampuanku. Aku berlindung kepada-Mu dari keburukan perbuatanku, aku mengakui nikmat-Mu kepadaku dan aku mengakui dosaku, oleh karena itu ampunilah aku. Sebab tidak ada yang mengampuni dosa selain Engkau."',
    referensi: 'HR. Bukhari no. 6306 (Shahih)',
  ),
  DoaNabiModel(
    id: '33',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa memohon ketetapan hati di atas agama',
    arab: 'يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَى دِينِكَ',
    latin: 'Yaa muqallibal quluub, tsabbit qalbii \'alaa diinik.',
    arti:
        '"Wahai Dzat yang membolak-balikkan hati, tetapkanlah hatiku di atas agama-Mu."',
    referensi: 'HR. Tirmidzi no. 3522 & Ahmad no. 26868 (Shahih)',
  ),
  DoaNabiModel(
    id: '34',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa memohon petunjuk, ketakwaan, kesucian jiwa, dan kecukupan',
    arab:
        'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى وَالتُّقَى وَالْعَفَافَ وَالْغِنَى',
    latin: 'Allahumma innii as-alukal hudaa wat-tuqaa wal-\'afaafa wal-ghinaa.',
    arti:
        '"Ya Allah, sesungguhnya aku memohon kepada-Mu petunjuk, ketakwaan, kesucian jiwa, dan kecukupan."',
    referensi: 'HR. Muslim no. 2721 (Shahih)',
  ),
  DoaNabiModel(
    id: '35',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa berlindung dari gundah gulana, kelemahan, pengecut, kikir, lilitan hutang, dan penindasan',
    arab:
        'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنَ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ وَقَهْرِ الرِّجَالِ',
    latin:
        'Allahumma innii a\'uudzubika minal hammi wal hazan, wa a\'uudzubika minal \'ajzi wal kasal, wa a\'uudzubika minal jubni wal bukhl, wa a\'uudzubika min ghalabatid-daini wa qahrir-rijaal.',
    arti:
        '"Ya Allah, aku berlindung kepada-Mu dari gundah gulana dan kesedihan, aku berlindung kepada-Mu dari kelemahan dan kemalasan, aku berlindung kepada-Mu dari sifat pengecut dan kikir, dan aku berlindung kepada-Mu dari lilitan hutang dan penindasan orang."',
    referensi: 'HR. Bukhari no. 2893 (Shahih)',
  ),
  DoaNabiModel(
    id: '36',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa berlindung dari empat keburukan: ilmu tidak bermanfaat, hati tidak khusyu, jiwa rakus, dan doa tidak dikabulkan',
    arab:
        'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عِلْمٍ لَا يَنْفَعُ، وَمِنْ قَلْبٍ لَا يَخْشَعُ، وَمِنْ نَفْسٍ لَا تَشْبَعُ، وَمِنْ دَعْوَةٍ لَا يُسْتَجَابُ لَهَا',
    latin:
        'Allahumma innii a\'uudzubika min \'ilmin laa yanfa\', wa min qalbin laa yakhsya\', wa min nafsin laa tasyba\', wa min da\'watin laa yustajaabu lahaa.',
    arti:
        '"Ya Allah, aku berlindung kepada-Mu dari ilmu yang tidak bermanfaat, dari hati yang tidak khusyu, dari jiwa yang tidak pernah kenyang (rakus), dan dari doa yang tidak dikabulkan."',
    referensi: 'HR. Muslim no. 2722 (Shahih)',
  ),
  DoaNabiModel(
    id: '37',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa berlindung dari siksa neraka, siksa kubur, fitnah hidup-mati, dan fitnah Dajjal',
    arab:
        'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ جَهَنَّمَ، وَمِنْ عَذَابِ الْقَبْرِ، وَمِنْ فِتْنَةِ الْمَحْيَا وَالْمَمَاتِ، وَمِنْ شَرِّ فِتْنَةِ الْمَسِيحِ الدَّجَّالِ',
    latin:
        'Allahumma innii a\'uudzubika min \'adzaabi jahannam, wa min \'adzaabil qabr, wa min fitnatil mahyaa wal mamaat, wa min syarri fitnatil masiihid-dajjaal.',
    arti:
        '"Ya Allah, aku berlindung kepada-Mu dari siksa neraka Jahannam, dari siksa kubur, dari fitnah kehidupan dan kematian, dan dari keburukan fitnah Al-Masih Ad-Dajjal."',
    referensi: 'HR. Bukhari no. 1377 & Muslim no. 588 (Shahih)',
  ),
  DoaNabiModel(
    id: '38',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa memohon ilmu bermanfaat, rezeki baik, dan amal yang diterima – dibaca setelah Shalat Subuh',
    arab:
        'اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا',
    latin:
        'Allahumma innii as-aluka \'ilman naafi\'a, wa rizqan thayyibaa, wa \'amalan mutaqabbalaa.',
    arti:
        '"Ya Allah, sesungguhnya aku memohon kepada-Mu ilmu yang bermanfaat, rezeki yang baik, dan amal yang diterima."',
    referensi: 'HR. Ibnu Majah no. 925 (Shahih, dishahihkan Al-Albani)',
  ),
  DoaNabiModel(
    id: '39',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa qunut witir – dibaca setiap malam saat shalat witir',
    arab:
        'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ',
    latin:
        'Allahummah-dinii fiiman hadait, wa \'aafinii fiiman \'aafait, wa tawallanii fiiman tawallait, wa baarik lii fiimaa a\'thayt, wa qinii syarra maa qadhayt, fa-innaka taqdhi wa laa yuqdha \'alaik, wa innahuu laa yadzillu man waalait, tabaarakta rabbanaa wa ta\'aalait.',
    arti:
        '"Ya Allah, berikanlah aku petunjuk sebagaimana orang-orang yang telah Engkau beri petunjuk. Berikanlah aku kesehatan sebagaimana orang-orang yang telah Engkau sehatkan. Pimpinlah aku bersama orang-orang yang telah Engkau pimpin. Berkahilah aku pada apa yang telah Engkau berikan. Peliharalah aku dari kejahatan apa yang telah Engkau tetapkan. Sesungguhnya Engkaulah yang menetapkan dan tidak ada yang menghukum-Mu. Sesungguhnya tidak akan terhina orang yang Engkau pimpin. Maha Suci Engkau, Tuhan kami, dan Maha Tinggi Engkau."',
    referensi:
        'HR. Abu Dawud no. 1425, Tirmidzi no. 464 & An-Nasa\'i no. 1745 (Shahih)',
  ),
  DoaNabiModel(
    id: '40',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa memohon tolong untuk berdzikir, bersyukur, dan beribadah dengan baik',
    arab: 'اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ',
    latin:
        'Allahumma a\'innii \'alaa dzikrika wa syukrika wa husni \'ibaadatik.',
    arti:
        '"Ya Allah, tolonglah aku untuk mengingat-Mu, bersyukur kepada-Mu, dan beribadah dengan baik kepada-Mu."',
    referensi: 'HR. Abu Dawud no. 1522 & Ahmad no. 22119 (Shahih)',
  ),
  DoaNabiModel(
    id: '41',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa akhir majelis – kaffaratul majlis (penebus dosa dalam majelis)',
    arab:
        'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا أَنْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ',
    latin:
        'Subhaanakallaahumma wa bihamdik, asyhadu an laa ilaaha illaa anta, astaghfiruka wa atuubu ilaik.',
    arti:
        '"Maha Suci Engkau ya Allah dan segala puji bagi-Mu. Aku bersaksi bahwa tidak ada Tuhan selain Engkau. Aku memohon ampunan-Mu dan bertobat kepada-Mu."',
    referensi: 'HR. Tirmidzi no. 3433 & Abu Dawud no. 4857 (Shahih)',
  ),
  DoaNabiModel(
    id: '42',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa memohon cinta Allah, cinta orang yang dicintai Allah, dan cinta amal yang mendekatkan kepada-Nya',
    arab:
        'اللَّهُمَّ إِنِّي أَسْأَلُكَ حُبَّكَ، وَحُبَّ مَنْ يُحِبُّكَ، وَحُبَّ عَمَلٍ يُقَرِّبُنِي إِلَى حُبِّكَ',
    latin:
        'Allahumma innii as-aluka hubbak, wa hubba man yuhibbuk, wa hubba \'amalin yuqarribunii ilaa hubbik.',
    arti:
        '"Ya Allah, sesungguhnya aku memohon kepada-Mu cinta-Mu, cinta orang-orang yang mencintai-Mu, dan cinta amal yang mendekatkanku kepada cinta-Mu."',
    referensi: 'HR. Tirmidzi no. 3490 (Hasan, dishahihkan Al-Albani)',
  ),
  DoaNabiModel(
    id: '43',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa ketika mengalami kesulitan yang sangat berat (Doa Karb)',
    arab:
        'لَا إِلَهَ إِلَّا اللَّهُ الْعَظِيمُ الْحَلِيمُ، لَا إِلَهَ إِلَّا اللَّهُ رَبُّ الْعَرْشِ الْعَظِيمِ، لَا إِلَهَ إِلَّا اللَّهُ رَبُّ السَّمَاوَاتِ وَرَبُّ الْأَرْضِ وَرَبُّ الْعَرْشِ الْكَرِيمِ',
    latin:
        'Laa ilaaha illallaahul \'azhiimul haliim, laa ilaaha illallaahu rabbul \'arsyil \'azhiim, laa ilaaha illallaahu rabbus-samaawaati wa rabbul ardhi wa rabbul \'arsyil kariim.',
    arti:
        '"Tidak ada Tuhan selain Allah Yang Maha Agung dan Maha Penyantun. Tidak ada Tuhan selain Allah Rabb Arsy yang agung. Tidak ada Tuhan selain Allah Rabb langit, Rabb bumi, dan Rabb Arsy yang mulia."',
    referensi: 'HR. Bukhari no. 6346 & Muslim no. 2730 (Shahih)',
  ),
  DoaNabiModel(
    id: '44',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa istikharah – memohon petunjuk dalam memilih perkara',
    arab:
        'اللَّهُمَّ إِنِّي أَسْتَخِيرُكَ بِعِلْمِكَ، وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ، وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ، فَإِنَّكَ تَقْدِرُ وَلَا أَقْدِرُ، وَتَعْلَمُ وَلَا أَعْلَمُ، وَأَنْتَ عَلَّامُ الْغُيُوبِ. اللَّهُمَّ إِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الْأَمْرَ خَيْرٌ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي فَاقْدُرْهُ لِي وَيَسِّرْهُ لِي ثُمَّ بَارِكْ لِي فِيهِ، وَإِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الْأَمْرَ شَرٌّ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي فَاصْرِفْهُ عَنِّي وَاصْرِفْنِي عَنْهُ وَاقْدُرْ لِي الْخَيْرَ حَيْثُ كَانَ ثُمَّ أَرْضِنِي بِهِ',
    latin:
        'Allahumma innii astakhiiruka bi\'ilmika, wa astaqdiruka biqudratika, wa as-aluka min fadhlikalazdhiim, fa-innaka taqdiru wa laa aqdiru, wa ta\'lamu wa laa a\'lamu, wa anta \'allaamul ghuyuub. Allahumma in kunta ta\'lamu anna haadzal amra khairun lii fii diinii wa ma\'aasyii wa \'aaqibati amrii faqdurhu lii wa yassirhu lii tsumma baarik lii fiih, wa in kunta ta\'lamu anna haadzal amra syarrun lii fii diinii wa ma\'aasyii wa \'aaqibati amrii fashrif-hu \'annii washrif-nii \'anhu waqdur liyal khayra haitsu kaana tsumma ardhdinii bih.',
    arti:
        '"Ya Allah, sesungguhnya aku memohon pilihan yang tepat kepada-Mu dengan ilmu-Mu dan aku mohon kekuatan dengan kekuasaan-Mu serta aku mohon karunia-Mu yang agung. Sesungguhnya Engkau Maha Kuasa sedang aku tidak berkuasa, Engkau Maha Mengetahui sedang aku tidak mengetahui, dan Engkaulah Yang Maha Mengetahui perkara gaib. Ya Allah, jika Engkau mengetahui bahwa perkara ini baik bagiku dalam agamaku, penghidupanku, dan akibat urusanku maka tetapkanlah ia untukku, mudahkanlah ia bagiku, kemudian berkahilah aku di dalamnya. Dan jika Engkau mengetahui bahwa perkara ini buruk bagiku dalam agamaku, penghidupanku dan akibat urusanku maka jauhkanlah ia dariku dan jauhkanlah aku darinya serta tetapkanlah kebaikan untukku di mana pun ia berada, kemudian ridhoilah aku dengannya."',
    referensi: 'HR. Bukhari no. 6382 (Shahih)',
  ),
  DoaNabiModel(
    id: '45',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa memohon keselamatan (afiyah) di dunia dan akhirat – dibaca pagi dan petang',
    arab:
        'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ',
    latin: 'Allahumma innii as-alukal \'aafiyata fid-dunyaa wal aakhirah.',
    arti:
        '"Ya Allah, sesungguhnya aku memohon keselamatan kepada-Mu di dunia dan di akhirat."',
    referensi:
        'HR. Abu Dawud no. 5074 & Ibnu Majah no. 3871 (Shahih, dishahihkan Al-Albani)',
  ),
  DoaNabiModel(
    id: '46',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa pagi hari – dzikir pagi yang penuh tawakal',
    arab:
        'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ',
    latin:
        'Allahumma bika ashbahnaa, wa bika amsainaa, wa bika nahyaa, wa bika namuutu, wa ilainan-nusyuur.',
    arti:
        '"Ya Allah, dengan pertolongan-Mu kami memasuki waktu pagi, dengan pertolongan-Mu kami memasuki waktu petang, dengan pertolongan-Mu kami hidup, dengan pertolongan-Mu kami mati, dan kepada-Mu lah tempat kembali."',
    referensi: 'HR. Tirmidzi no. 3391 & Abu Dawud no. 5068 (Hasan)',
  ),
  DoaNabiModel(
    id: '47',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa sebelum tidur – memohon perlindungan dari azab Allah',
    arab: 'اللَّهُمَّ بِاسْمِكَ أَمُوتُ وَأَحْيَا',
    latin: 'Allahumma bismika amuutu wa ahyaa.',
    arti: '"Ya Allah, dengan nama-Mu aku mati dan aku hidup."',
    referensi: 'HR. Bukhari no. 6312 (Shahih)',
  ),
  DoaNabiModel(
    id: '48',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa setelah bangun tidur',
    arab:
        'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
    latin:
        'Alhamdulillaahil-ladzii ahyaanaa ba\'da maa amaatanaa wa ilaihin-nusyuur.',
    arti:
        '"Segala puji bagi Allah yang telah menghidupkan kami setelah mematikan kami, dan kepada-Nya lah tempat kembali."',
    referensi: 'HR. Bukhari no. 6312 (Shahih)',
  ),
  DoaNabiModel(
    id: '49',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa ketika turun hujan',
    arab: 'اللَّهُمَّ صَيِّبًا نَافِعًا',
    latin: 'Allahumma shayyiban naafi\'aa.',
    arti: '"Ya Allah, jadikanlah ini hujan yang deras dan bermanfaat."',
    referensi: 'HR. Bukhari no. 1032 (Shahih)',
  ),
  DoaNabiModel(
    id: '50',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa ketuar rumah – memohon perlindungan dan kemudahan',
    arab:
        'بِسْمِ اللَّهِ، تَوَكَّلْتُ عَلَى اللَّهِ، وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
    latin:
        'Bismillaah, tawakkaltu \'alallaah, wa laa hawla wa laa quwwata illaa billaah.',
    arti:
        '"Dengan nama Allah, aku bertawakal kepada Allah, dan tidak ada daya serta kekuatan kecuali dengan (pertolongan) Allah."',
    referensi: 'HR. Abu Dawud no. 5095 & Tirmidzi no. 3426 (Shahih)',
  ),
  DoaNabiModel(
    id: '51',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa masuk masjid – memohon dibukakan pintu-pintu rahmat',
    arab: 'اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ',
    latin: 'Allahummaf-tah lii abwaaba rahmatik.',
    arti: '"Ya Allah, bukakanlah untukku pintu-pintu rahmat-Mu."',
    referensi: 'HR. Muslim no. 713 (Shahih)',
  ),
  DoaNabiModel(
    id: '52',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa keluar masjid – memohon karunia Allah',
    arab: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ',
    latin: 'Allahumma innii as-aluka min fadhlika.',
    arti: '"Ya Allah, sesungguhnya aku memohon karunia-Mu."',
    referensi: 'HR. Muslim no. 713 (Shahih)',
  ),
  DoaNabiModel(
    id: '53',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa setelah makan – mensyukuri rezeki yang diberikan',
    arab:
        'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنِي هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ',
    latin:
        'Alhamdulillaahil-ladzii ath\'amaniy haadzaa wa razaqaniihi min ghairi hawlin minnii wa laa quwwah.',
    arti:
        '"Segala puji bagi Allah yang telah memberiku makan ini dan merezekikannya kepadaku tanpa daya dan kekuatan dariku."',
    referensi:
        'HR. Abu Dawud no. 4023 & Tirmidzi no. 3458 (Hasan, dishahihkan Al-Albani)',
  ),
  DoaNabiModel(
    id: '54',
    namaNabi: 'Nabi Muhammad SAW',
    konteks:
        'Doa memohon surga dan berlindung dari neraka – dibaca tiga kali setelah shalat Subuh dan Maghrib',
    arab:
        'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْجَنَّةَ وَأَعُوذُ بِكَ مِنَ النَّارِ',
    latin: 'Allahumma innii as-alukal jannata wa a\'uudzubika minan-naar.',
    arti:
        '"Ya Allah, sesungguhnya aku memohon kepada-Mu surga dan aku berlindung kepada-Mu dari neraka."',
    referensi:
        'HR. Abu Dawud no. 792 & Ibnu Majah no. 910 (Shahih, dishahihkan Al-Albani)',
  ),
  DoaNabiModel(
    id: '55',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa memohon kebaikan masuk dan keluar (safar, kematian, dll)',
    arab:
        'رَبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ وَأَخْرِجْنِي مُخْرَجَ صِدْقٍ وَاجْعَلْ لِي مِنْ لَدُنْكَ سُلْطَانًا نَصِيرًا',
    latin:
        'Rabbi adkhilnii mudkhala shidqin wa akhrijnii mukhraja shidqin waj\'al lii min ladunka sulthaanan nashiiraa.',
    arti:
        '"Ya Tuhanku, masukkanlah aku secara masuk yang benar dan keluarkanlah (pula) aku secara keluar yang benar dan berikanlah kepadaku dari sisi-Mu kekuasaan yang menolong."',
    referensi: 'QS. Al-Isra\': 80 (doa yang Allah wahyukan kepada Nabi SAW)',
  ),
  DoaNabiModel(
    id: '56',
    namaNabi: 'Nabi Muhammad SAW',
    konteks: 'Doa berlindung dari sifat pengecut, pikun, dan fitnah dunia',
    arab:
        'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْجُبْنِ وَأَعُوذُ بِكَ أَنْ أُرَدَّ إِلَى أَرْذَلِ الْعُمُرِ وَأَعُوذُ بِكَ مِنْ فِتْنَةِ الدُّنْيَا وَأَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ',
    latin:
        'Allahumma innii a\'uudzubika minal jubni, wa a\'uudzubika an uradda ilaa arzalil \'umur, wa a\'uudzubika min fitnatid-dunyaa, wa a\'uudzubika min \'adzaabil qabr.',
    arti:
        '"Ya Allah, aku berlindung kepada-Mu dari sifat pengecut, dari dikembalikan ke usia yang paling hina (pikun), dari fitnah dunia, dan dari siksa kubur."',
    referensi: 'HR. Bukhari no. 2822 (Shahih)',
  ),
];
