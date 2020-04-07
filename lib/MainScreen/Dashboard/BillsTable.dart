import 'package:flutter/material.dart';

class BillsTable extends StatefulWidget {
  @override
  BillsTableState createState() {
    return new BillsTableState();
  }
}

class BillsTableState extends State<BillsTable> {
  int idFlag = 0,nameFlag = 0,amountFlag=0,patientFlag=0;
  TextEditingController controller = new TextEditingController();
  Widget bodyData() => DataTable(
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("ID"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              if(idFlag==0){
                names.sort((a, b) => a.id.compareTo(b.id));
                idFlag=1;
              }
              else{
                names.sort((b, a) => a.id.compareTo(b.id));
                idFlag=0;
              }
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Name"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              if(nameFlag==0){
                names.sort((a, b) => a.name.compareTo(b.name));
                nameFlag=1;
              }
              else{
                names.sort((b, a) => a.name.compareTo(b.name));
                nameFlag=0;
              }
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Amount"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              if(amountFlag==0){
                names.sort((a, b) => a.amount.compareTo(b.amount));
                amountFlag=1;
              }
              else{
                names.sort((b, a) => a.amount.compareTo(b.amount));
                amountFlag=0;
              }
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Patient"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              if(patientFlag==0){
                names.sort((a, b) => a.patient.compareTo(b.patient));
                patientFlag=1;
              }
              else{
                names.sort((b, a) => a.patient.compareTo(b.patient));
                patientFlag=0;
              }
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: names
          .map(
            (name) => DataRow(
              onSelectChanged: (bool selected) {
                if (selected) {
                  _showDialog(context);
                }
              },
          cells: [
            DataCell(
              Text(name.id.toString()),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Text(name.name),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Text(name.amount.toString()),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(
              Text(name.patient),
              showEditIcon: false,
              placeholder: false,
            )
          ],
        ),
      )
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Card(
                    child:  ListTile(
                      leading:  Icon(Icons.search),
                      title:  TextField(
                        controller: controller,
                        decoration:  InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                       // onChanged: onSearchTextChanged,
                      ),
                      trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                        controller.clear();
                       // onSearchTextChanged('');
                      },),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  child: bodyData(),
                ),
              ),
            ],
          )

        ),
      );
  }
  // user defined function
  void _showDialog(BuildContext context) {
// flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sign Out"),
          content: new Text("Do you wish to log out?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Logout"),
              onPressed: () {
              },
            ),
            new FlatButton(
              child: new Text("Stay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Name {
  int id;
  String name;
  double amount;
  String patient;


  Name({this.id,this.name,this.amount ,this.patient});
}

var names = <Name>[
  Name(id: 0 , name: "Jedi",amount: 5.00, patient: "Corona"),
  Name(id: 1 , name: "Sith",amount: 15.00, patient: "Corona"),
  Name(id: 2 , name: "Order",amount: 25.00, patient: "Corona"),
  Name(id: 3 , name: "Chaos",amount: 550.00, patient: "Corona"),
  Name(id: 4 , name: "Light",amount: 35.00, patient: "Corona"),
  Name(id: 5 , name: "Dark",amount: 95.00, patient: "Corona"),
];