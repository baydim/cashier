import 'package:cashier/manage/formater.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContentHis extends StatefulWidget {
  final Map a;
  ContentHis({this.a});
  @override
  _ContentHisState createState() => _ContentHisState();
}

class _ContentHisState extends State<ContentHis> {
  final tg = new DateFormat('EEEE, MMMM yyyy & HH:mm', 'id_ID');
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'm',
      ).copyWith(
        dividerColor: Colors.transparent,
        accentColor: !x ? Colors.black : Colors.white,

        // focusColor: Colors.black,
        // primaryColor: Colors.black,
      ),
      child: ExpansionTile(
        // collapsedBackgroundColor: Colors.grey,
        backgroundColor: Colors.black,
        tilePadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Icon(Icons.swap_horiz_rounded,
                color: !x ? Colors.black : Colors.white),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tg.format(widget.a['data']['tgl'].toDate()).split('&')[0],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  tg.format(widget.a['data']['tgl'].toDate()).split('&')[1],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.a['id'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: !x ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              uang.format(widget.a['data']['bayar']),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        onExpansionChanged: (value) {
          setState(() {
            x = value;
          });
        },
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var b in widget.a['data']['data'])
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        b['nama'],
                        style: TextStyle(
                          color: !x ? Colors.black : Colors.white,
                        ),
                      ),
                      Text(
                        b['jumlahbeli'].toString(),
                        style: TextStyle(
                          color: !x ? Colors.black : Colors.white,
                        ),
                      ),
                      Text(
                        uang.format(
                          b['totharga'],
                        ),
                        style: TextStyle(
                          color: !x ? Colors.black : Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

// Column(
//       children: [
//         Text(widget.a['data']['tgl'].toDate().toString()),
//         Text(widget.a['id']),
//         for (var b in widget.a['data']['data'])
//           Text(
//             b.toString(),
//           ),
//         Divider(),
//       ],
//     );
