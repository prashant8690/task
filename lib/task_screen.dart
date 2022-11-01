import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Map<String, dynamic>? map;

  Future<void> parseJsonFromAssets() async {
    final map = await rootBundle
        .loadString("assets/playlist.json")
        .then((jsonStr) => jsonDecode(jsonStr));
    this.map = map;
    setState(() {});
  }

  @override
  void initState() {
    parseJsonFromAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data Table"),
        ),
        body: map == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                      border: TableBorder.all(),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FixedColumnWidth(40),
                        1: FixedColumnWidth(120),
                        2: FixedColumnWidth(70),
                        3: FixedColumnWidth(80),
                        4: FixedColumnWidth(60),
                        5: FixedColumnWidth(50),
                        6: FixedColumnWidth(60),
                        7: FixedColumnWidth(70),
                        8: FixedColumnWidth(90),
                        9: FixedColumnWidth(70),
                        10: FixedColumnWidth(40),
                        11: FixedColumnWidth(40),
                        12: FixedColumnWidth(40),
                        13: FixedColumnWidth(60),
                        14: FixedColumnWidth(60),
                        15: FixedColumnWidth(60),
                        16: FixedColumnWidth(60),
                        17: FixedColumnWidth(60),
                        18: FixedColumnWidth(60),
                      },
                      children: [
                        TableRow(children: [
                          Center(
                            child: Text(
                              "index",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ...map!.keys
                              .map((e) => Center(
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))
                              .toList()
                        ]),

                        ...List.generate(
                            map!["id"].length,
                            (index) => TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: Center(
                                      child: Text(
                                        (index).toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ...map!.keys.map((e) {
                                    return Center(
                                      child: Text(
                                        map![e][index.toString()].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }).toList()
                                ]))

                        // TableRow(
                        //     children: List.generate(
                        //         model.id.length,
                        //         (index) => Center(
                        //               child: Text(
                        //                 model.id["$index"],
                        //                 style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //             )))
                        // TableRow(
                        //     children: tableHeader
                        //         .map((e) => Text(
                        //               e,
                        //               style: TextStyle(fontWeight: FontWeight.bold),
                        //             ))
                        //         .toList()),
                      ]),
                ),
              )
        // SingleChildScrollView(
        //         child: Column(children: [
        //           DataTable(
        //             columns: [
        //               DataColumn(label: Text("00")),
        //               DataColumn(label: Text("00")),
        //             ],
        //             rows: [],
        //           ),
        //           ...List.generate(
        //             model.id.length,
        //             (index) => SingleChildScrollView(
        //               physics: const AlwaysScrollableScrollPhysics(),
        //               scrollDirection: Axis.horizontal,
        //               child: DataTable(
        //                 columns: [
        //                   DataColumn(label: Text(model.id["$index"])),
        //                   DataColumn(label: Text(model.title["$index"])),
        //                   DataColumn(
        //                       label:
        //                           Text(model.danceability["$index"].toString())),
        //                   DataColumn(
        //                       label: Text(model.energy["$index"].toString())),
        //                   DataColumn(
        //                     label: Text(
        //                       model.mode["$index"].toString(),
        //                     ),
        //                   ),
        //                   DataColumn(
        //                     label: Text(
        //                       model.acousticness["$index"].toString(),
        //                     ),
        //                   ),
        //                   DataColumn(
        //                     label: Text(
        //                       model.duration_ms["$index"].toString(),
        //                     ),
        //                   ),
        //                   DataColumn(
        //                     label: Text(
        //                       model.num_sections["$index"].toString(),
        //                     ),
        //                   ),
        //                   DataColumn(
        //                     label: Text(
        //                       model.num_segments["$index"].toString(),
        //                     ),
        //                   ),
        //                   DataColumn(
        //                     label: Text(
        //                       model.num_bars["$index"].toString(),
        //                     ),
        //                   ),
        //                 ],
        //                 rows: [],
        //               ),
        //             ),
        //           )
        //         ]),
        //       ),
        );
  }
}
