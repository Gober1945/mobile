import 'package:flutter/material.dart';

class ProfileData{
  String nama;
  String noHp;
  String email;
  int? avatar;

  ProfileData({
    required this.nama,
    required this.noHp,
    required this.email,
    this.avatar,
  });
}

ValueNotifier<ProfileData> profileNotifier = ValueNotifier(
  ProfileData(
    nama: "Kelompok SeaBank",
    noHp: "123456789",
    email: "contohemail@gmail.com",
    avatar: 0,
  ),
);

ValueNotifier<int> saldoNotifier = ValueNotifier<int>(1000000);