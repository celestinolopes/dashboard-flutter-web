import 'package:flutter/material.dart';

import '../models/user.dart';

class UserTab extends StatefulWidget {
  const UserTab({Key key}) : super(key: key);

  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> with TickerProviderStateMixin {
  TabController _tabControllerUser;
  List<Usuario> _usuarios = [];
  int _rowsPerPage = 5;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabControllerUser = TabController(length: 3, vsync: this, initialIndex: 0);
    _scrollController = ScrollController();
    List.generate(
        100,
        (index) => _usuarios.add(Usuario(
            codigo: index,
            nome: "Name $index",
            endereco: "Endereço $index",
            email: "email $index",
            telefone: "telefone $index")));
  }

  @override
  void dispose() {
    super.dispose();
    _tabControllerUser.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              controller: _tabControllerUser,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.people_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Todos os Usuários"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.bar_chart),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Relatórios"),
                    ],
                  ),
                ),
                Tab(
                  text: "Tab 2",
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("CONTROLE DE USUÁRIOS")],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabControllerUser,
              children: [
                Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  showTrackOnHover: true,
                  child: ListView(controller: _scrollController, children: [
                    PaginatedDataTable(
                        rowsPerPage: _rowsPerPage,
                        onRowsPerPageChanged: (v) {
                          setState(() {
                            _rowsPerPage = v;
                          });
                        },
                        availableRowsPerPage: [5, 10, 15, 16],
                        header: Text("Usuarios"),
                        actions: [
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                          IconButton(icon: Icon(Icons.search), onPressed: () {})
                        ],
                        showCheckboxColumn: true,
                        sortAscending: true,
                        columns: <DataColumn>[
                          DataColumn(label: Text("Codigo")),
                          DataColumn(label: Text("Nome")),
                          DataColumn(label: Text("Email")),
                          DataColumn(label: Text("Telefone")),
                          DataColumn(label: Text("Endereco")),
                          DataColumn(label: Text("Acções")),
                        ],
                        source: MyDataTableSource(_usuarios, context)),
                  ]),
                ),
                Text("TAB 2"),
                Text("TAB 3"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[800],
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data, this.context);

  final List<Usuario> data;
  BuildContext context;
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].codigo}')),
        DataCell(Text('${data[index].nome}')),
        DataCell(Text('${data[index].email}')),
        DataCell(Text('${data[index].endereco}')),
        DataCell(Text('${data[index].telefone}')),
        DataCell(Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                          title: Text("Deseja Excluir ?"),
                          content: Container(
                            height: 70,
                            child: Column(
                              children: [
                                Text("Confirme para Excluir o usuario"),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton.icon(
                                    icon: Icon(Icons.delete),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () {},
                                    label: Text("Excluir Usuario"))
                              ],
                            ),
                          ));
                    });
              },
              label: Text("Deletar"),
            ),
            SizedBox(
              width: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              icon: Icon(Icons.edit),
              onPressed: () {},
              label: Text("Editar"),
            ),
            SizedBox(
              width: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              icon: Icon(Icons.visibility),
              onPressed: () {},
              label: Text("Visualizar"),
            ),
          ],
        )),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}
