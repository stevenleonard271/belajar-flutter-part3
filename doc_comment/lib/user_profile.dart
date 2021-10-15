// Ini class buatan saya
import 'package:flutter/material.dart';

/// Class User Profile digunakan untuk menampilkan profile user ke layar dengan indah
class UserProfile extends StatelessWidget {
  /// field ini digunakan untuk menyimpan nama user
  final String name;
  final String role;
  final String photoUrl;

  ///* [Name] berisi *nama user*. Nilai defaultnya adalah `No Name`.
  ///
  ///* [Role] berisi peran/jabatan dari user. Nilai defaultnya adalah `No Role`.
  ///
  ///* [photoUrl] berisi link **foto user**. Nilai defaultnya adalah `null`.
  ///
  /// Contoh :
  ///
  ///```
  ///final UserProfile profile = UserProfile(
  ///name: "Nama User",
  ///role: "Peran User",
  ///photoUrl: "https://lalala.com/foto.png"
  ///);
  ///```
  UserProfile({this.name = "No Name", this.role = "No Role", this.photoUrl});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: NetworkImage((photoUrl != null)
              ? photoUrl
              : 'https://www.pngitem.com/pimgs/m/78-786293_1240-x-1240-0-avatar-profile-icon-png.png'),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          role,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
