import 'package:flutter/material.dart';

class BillsTable extends StatefulWidget {
  @override
  _BillsTableState createState() => _BillsTableState();
}

class _BillsTableState extends State<BillsTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:20),
              child:Center(
                  child: Text(
                    'Bills',

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            DataTable(
              sortColumnIndex: 0,
              sortAscending: true,
              columns: [
                DataColumn(label: Text('#SL')),
                DataColumn(label: Text('Invoice')),
                DataColumn(label: Text('Amount'),numeric: true),
                DataColumn(label: Text('Patient')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('BILL-1001')),
                  DataCell(Text('\$ 6,000')),
                  DataCell(Text('Corona Virus')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('BILL-1002')),
                  DataCell(Text('\$ 3,000')),
                  DataCell(Text('CODIV-19')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('BILL-1003')),
                  DataCell(Text('\$ 5,000')),
                  DataCell(Text('Corona Virus Again')),
                ]),
              ],
            ),
          ])
    );
  }
}