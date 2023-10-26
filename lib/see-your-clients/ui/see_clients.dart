import 'package:flutter/material.dart';

import '../entities/models/Clients.dart';
import '../../shared/appBarApp.dart';
import '../../shared/bottomNavigationApp.dart';

List<Map<Clients, dynamic>> listClients = [
  {Clients(1, "Johan Esteban Córdoba Merino", 25): "Some data 1"},
  {Clients(2, "María Fernanda Ruiz García", 23): "Some data 2"},
  {Clients(3, "Ana Isabel Vargas Torres", 21): "Some data 3"},
  {Clients(4, "Juan Carlos López Soto", 20): "Some data 4"},
  {Clients(5, "Luis Alejandro Mendoza Chávez", 19): "Some data 5"},
  {Clients(6, "Carlos Alberto Pérez Rodríguez", 28): "Some data 6"},
  {Clients(7, "Ana María González López", 30): "Some data 7"},
  {Clients(8, "Marta Elena Sánchez Pérez", 32): "Some data 8"},
  {Clients(9, "Pedro José Torres González", 27): "Some data 9"},
  {Clients(10, "Laura Isabel Martínez Vargas", 24): "Some data 10"},
  {Clients(11, "Diego Antonio Córdoba Fernández", 29): "Some data 11"},
  {Clients(12, "Sofía Carmen López Soto", 26): "Some data 12"},
  {Clients(13, "Andrés Manuel Ruiz García", 34): "Some data 13"},
  {Clients(14, "Liliana María Sánchez Vargas", 31): "Some data 14"},
  {Clients(15, "Juan Pablo Mendoza Torres", 33): "Some data 15"},
];

class ClientsView extends StatefulWidget {
  const ClientsView({super.key});
  static String id = 'Clients';

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  late DataTableSource _data;

  @override
  void initState(){
    super.initState();
    _data = MyData(context, (Clients client) {
      setState(() {
        listClients.removeWhere((element) => element.keys.first == client);
      });
    });
  }
  /*void deleteClient(int index){
    print("Client delete: ${clients[index].getIndex()} with name ${clients[index].getName()}");
    setState(() {
      clients.removeAt(index);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarApp(context),
      body: Column(
        children: [
          PaginatedDataTable(
            header: const Center(child: Text('My Clients')),
            source: _data,
            columns: [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("CLient")),
              DataColumn(label: Text("Age"))
            ],
            columnSpacing: 50,
            horizontalMargin: 25,
            rowsPerPage: 8,
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationApp(),
    );
  }
}

class MyData extends DataTableSource{
  final BuildContext context;
  final Function(Clients) onClientDeleted;

  MyData(this.context, this.onClientDeleted);

  @override
  DataRow? getRow(int index) {
    final clientData = listClients[index].keys.first;
    final data = listClients[index][clientData];
    bool selected = false;

    return DataRow.byIndex(
      index: index,
        selected: selected,
        onSelectChanged: (isSelected){
          if(isSelected != null && isSelected){
            showEditDeleteMenu(clientData);
          }
        },
        cells: [
          DataCell(Text(clientData.index.toString())),
          DataCell(Text(clientData.getName())),
          DataCell(Text(clientData.age.toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => listClients.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

  void showEditDeleteMenu(Clients client) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Options of Client"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Edit"),
                  onTap: () {
                    Navigator.pop(context); // Cerrar el diálogo
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditClientScreen(client: client),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text("Eliminar"),
                  onTap: () {
                    Navigator.pop(context);
                    onClientDeleted(client);
                  },
                ),
              ],
            ),
          );
        });
  }
}

class EditClientScreen extends StatefulWidget {
  final Clients client;

  EditClientScreen({required this.client});

  @override
  State<EditClientScreen> createState() => _EditClientScreenState();
}

class _EditClientScreenState extends State<EditClientScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.client.name;
    ageController.text = widget.client.age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Client')),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(labelText: 'Age'),
          ),
          ElevatedButton(
            onPressed: () {
              String newName = nameController.text;
              int newAge = int.tryParse(ageController.text) ?? 0;
              widget.client.editClient(newName, newAge);
              Navigator.pop(context);
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}


