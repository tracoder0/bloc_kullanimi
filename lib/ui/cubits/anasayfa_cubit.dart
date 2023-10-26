import 'package:bloc_pattern_kullanimi/data/repo/matematikRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit() : super(99);
  var mrepo = MatematikRepository();
  void toplamaYap(int sayi1, int sayi2) {
    int toplam = mrepo.toplamaYap(sayi1, sayi2);
    emit(toplam);
    //Tetikleme ve veri gönderme
  }

  void carpmaYap(int sayi1, int sayi2) {
    int carpma = mrepo.carpmaYap(sayi1, sayi2);
    emit(carpma);
  }
}
