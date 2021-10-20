import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';


enum ColorEvent { to_amber, to_light_blue }

class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  @override
  //Mengecek apakah ada warna dari json atau tidak, jika kosong masukkan amber
  Color get initialState => super.initialState ?? Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
  }

  //Method untuk melakukan pengambilan data terakhir dari JSON
  @override
  Color fromJson(Map<String, dynamic> json) {
    try {
      return Color(json['color'] as int);
    } catch (_) {
      return null;
    }
  }

  // Method untuk menyimpan data ke JSON sehingga dapat dipanggil ketika aplikasi keluar
  @override
  Map<String, int> toJson(Color state) {
    try {
      return {'color': state.value};
    } catch (_) {
      return null;
    }
  }
}
