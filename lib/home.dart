import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController namaController = new TextEditingController();
  TextEditingController umurController = new TextEditingController();

  TextEditingController namaEditController = new TextEditingController();
  TextEditingController umurEditController = new TextEditingController();

  List<Map<String, dynamic>> karyawan = [
    {
      "nama": "Viko Aldi",
      "umur": "21 tahun",
    },
    {
      "nama": "Viko muhammad",
      "umur": "25 tahun",
    },
    {
      "nama": "Aldi saputra",
      "umur": "20 tahun",
    },
    {
      "nama": "yoga saputra",
      "umur": "20 tahun",
    },
  ];

  void _showDialogEdit(int index, Map<String, dynamic> karyawan) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("edit karyawan"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: karyawan["nama"],
                  controller: namaEditController,
                  decoration: InputDecoration(label: Text("nama")),
                ),
                SizedBox(
                  height: 3,
                ),
                TextFormField(
                  initialValue: karyawan["umur"],
                  controller: umurEditController,
                  decoration: InputDecoration(label: Text("umur")),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    String nama = namaEditController.text;
                    String umur = umurEditController.text;
                    setState(() {
                      karyawan[index]["nama"] = nama;
                      karyawan[index]["umur"] = umur;
                    });
                    namaEditController.text = "";
                    umurEditController.text = "";
                  },
                  child: Text("Edit")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("cancel"))
            ],
          );
        });
  }

  void showDialogAdd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("add karyawan"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(label: Text("nama")),
                ),
                SizedBox(
                  height: 3,
                ),
                TextFormField(
                  controller: umurController,
                  decoration: InputDecoration(label: Text("umur")),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    String nama = namaController.text;
                    String umur = umurController.text;
                    setState(() {
                      karyawan.add({"nama": nama, "umur": umur});
                    });
                    namaController.text = "";
                    umurController.text = "";
                  },
                  child: Text("add")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("cancel"))
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Text("List Karyawan"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showDialogAdd,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: karyawan.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: Container(
                  width: 60,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            karyawan.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          _showDialogEdit(index, karyawan[index]);
                        },
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  karyawan[index]["nama"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(karyawan[index]["umur"]),
              );
            }),
      ),
    );
  }
}