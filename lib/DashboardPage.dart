import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Model.dart';
import 'Sidebar.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Data> list;

  getData() async {
    String link = "http://tes-mobile.landa.id/index.php";
    var res = await http
        .get(Uri.parse(link), headers: {"Accept": "application/json"});
    // print(res.body);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      // print(data['data'][0]['detail']);
      var rest = data['data'] as List;
      // print(rest);
      list = rest.map<Data>((e) => Data.fromJson(e)).toList();
      return list;
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final matchWidth = MediaQuery.of(context).size.width;
    // final matchHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: HexColor("#363563"),
        elevation: 0,
        title: Center(
            child: Text(
          "Materi Pembelajaran",
          style: TextStyle(
            fontSize: 14,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: AssetImage("image/top_home.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      color: HexColor("#363563"),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kelas",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "VII - A",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final hsl = list[index];
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    right: 10,
                                  ),
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: HexColor("#363563"),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      hsl.nama,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: hsl.detail.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    final x = hsl.detail[index];
                                    YoutubePlayerController _controller =
                                        YoutubePlayerController(
                                      initialVideoId: x.youtube_id,
                                      flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        disableDragSeek: false,
                                        mute: false,
                                        loop: false,
                                        isLive: false,
                                        forceHD: false,
                                      ),
                                    );
                                    // YoutubePlayer(
                                    //     controller: _controller,
                                    // showVideoProgressIndicator: true,);
                                    return InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return YoutubePlayer(
                                              controller: _controller,
                                              showVideoProgressIndicator: true,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.network(
                                              "https://img.youtube.com/vi/${x.youtube_id}/0.jpg"),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
