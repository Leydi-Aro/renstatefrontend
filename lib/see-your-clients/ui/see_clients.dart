import 'package:flutter/material.dart';

class Clients{
  int index;
  String name;
  int age;

  Clients(this.index,this.name, this.age);

  String getName(){
    return this.name;
  }

  String getAge(){
    return "${this.age} years old";
  }

  int getIndex(){
    return this.index;
  }

  String toString(){
    return "${this.name}   ${this.age}";
  }

}

List<Clients> clients = [
  Clients(1, "Johan Esteban Cordoba Merino", 25),
  Clients(2, "María Fernanda Ruiz García", 23),
  Clients(3, "Ana Isabel Vargas Torres", 21),
  Clients(4, "Juan Carlos López Soto", 20),
  Clients(5, "Luis Alejandro Mendoza Chávez", 19)
];

class ClientsView extends StatefulWidget {
  const ClientsView({super.key});
  static String id = 'Clients';

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {

  void deleteClient(int index){
    print("Client delete: ${clients[index].getIndex()} with name ${clients[index].getName()}");
    setState(() {
      clients.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginatedDataTable(
        header: Text("list of Clients"),
        rowsPerPage: 5,
        source: _ClientsDataSource(deleteClient),
        columns: [
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Age")),
          DataColumn(label: Text("Edit")),
          DataColumn(label: Text("Delete"))
        ],
      ),
    );
  }
}

class _ClientsDataSource extends DataTableSource {
  final Function(int) onDelete;

  _ClientsDataSource(this.onDelete);

  @override
  DataRow? getRow(int index) {
    if (index >= clients.length) return null;
    final cliente = clients[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(cliente.name)),
        DataCell(IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Lógica para editar el cliente
          },
        )),
        DataCell(IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            onDelete(index); // Lógica para eliminar el cliente
          },
        )),
      ],
    );
  }

  @override
  int get rowCount => clients.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class MyData extends DataTableSource{

  @override
  DataRow? getRow(int index) {
    // TODO: implement getRow
    throw UnimplementedError();
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => throw UnimplementedError();

  @override
  // TODO: implement rowCount
  int get rowCount => throw UnimplementedError();

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => throw UnimplementedError();

}