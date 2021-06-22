import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: HexColor("#363563"),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 10),
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage("image/man.png"),
                            ),
                          ),
                          width: 80,
                          height: 80,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Risqullah Fani FR",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "1234",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                "asdfg",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Beranda",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.monitor,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Ujian",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.assignment_turned_in_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Hasil Ujian",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Notifikasi",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.my_library_books_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Perpustakaan Digital",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                  ),
                  children: [
                    ListTile(
                      onTap: () => Navigator.of(context).pop(),
                      leading: Icon(
                        Icons.edit_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () => Navigator.of(context).pop(),
                      leading: Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Ganti Password",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
