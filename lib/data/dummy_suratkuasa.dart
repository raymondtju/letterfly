import 'package:Letterfly/components/suratkuasaItem.dart';

List<SuratKuasaItem> dummySuratKuasa = [
  const SuratKuasaItem(
    id: '1',
    image: '',
    title: 'Surat Kuasa',
    durasi: '2 hari lalu',
  ),
  for (int i = 2; i <= 10; i++)
    SuratKuasaItem(
      id: '$i',
      image: '',
      title: 'Surat Kuasa $i',
      durasi: '${i + 1} hari lalu',
    ),
];
