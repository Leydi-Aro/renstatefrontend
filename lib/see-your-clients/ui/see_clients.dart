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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarApp(context),
      body: Column(
        children: [
          Center(
            child: Text('My Clients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listClients.length,
              itemBuilder: (context, index) {
                final clientData = listClients[index].keys.first;
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text("ID: ${clientData.index}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Client: ${clientData.getName()}"),
                        Text("Age: ${clientData.age}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditClientScreen(client: clientData),
                              ),
                            );
                            if (result == true) {
                              setState(() {});
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              listClients.removeWhere((element) => element.keys.first == clientData);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationApp(),
    );
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
              final clientIndex = listClients.indexWhere((element) => element.keys.first == widget.client);
              if (clientIndex != -1) {
                listClients[clientIndex][widget.client] = "Updated data";
                widget.client.editClient(newName, newAge);
              }


              Navigator.pop(context, true);
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}


