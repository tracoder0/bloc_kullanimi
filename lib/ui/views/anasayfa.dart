import 'package:bloc_pattern_kullanimi/ui/cubits/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var txfirstNumber = TextEditingController();
  var txsecondNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Kullanımı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit, int>(builder: (context, sonuc) {
                //Dinleme Yapısı
                return Text(sonuc.toString(),
                    style: const TextStyle(fontSize: 45));
              }),
              TextField(
                controller: txfirstNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Sayı -1",
                ),
              ),
              TextField(
                controller: txsecondNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Sayı -2"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        int sayi1 = int.parse(txfirstNumber.text);
                        int sayi2 = int.parse(txsecondNumber.text);
                        context.read<AnasayfaCubit>().toplamaYap(sayi1, sayi2);
                      },
                      child: const Text("Topla")),
                  ElevatedButton(
                      onPressed: () {
                        int sayi1 = int.parse(txfirstNumber.text);
                        int sayi2 = int.parse(txsecondNumber.text);
                        context.read<AnasayfaCubit>().carpmaYap(sayi1, sayi2);
                      },
                      child: const Text("Çarp")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
