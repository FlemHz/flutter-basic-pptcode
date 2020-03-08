import 'package:flutter/material.dart';
import './components/product_lists.dart';
import './components/dashboard.dart';
import './components/add_new_item.dart';
import './models/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping Bag",
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.purpleAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Cart> _carts = [
    //SEBAGAI PERMULAAN, KITA TAMBAHKAN DUA BUAH DATA DUMMY
    Cart(id: 'FL1', title: 'Sabun Mandi', harga: 15000, qty: 1),
    Cart(id: 'FL2', title: 'Shampoo', harga: 17000, qty: 2),
  ];
      //METHOD INI AKAN MENJALANKAN MODAL BOTTOM SHEET, DIMANA MODAL INI AKAN TAMPIL DARI BAWAH
  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNewItem(_addNewItem); //DAN ISI DARI MODAL TERSEBUT ADALAH COMPONENT AddNewItem. 
        });
  }

  //FUNGSI INI UNTUK MEMANIPULASI DENGAN MENAMBAHKAN DATA BARU KE DALAM CART
  void _addNewItem(String title, double harga, int qty) {
    //BUAT FORMAT DATANYA DENGAN REFERENSI MENGGUNAKAN MODAL Cart
    final newItem = Cart(id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
    setState(() {
      _carts.add(newItem); //SET STATE-NYA UNTUK MENAMBAHKAN DATA BARU TERSEBUT
    });
  }
  
  //FUNGSI INI UNTUK MENGHAPUS SEMUA DATA PADA VARIABLE CARTS
  void _resetCarts() {
    setState(() {
      _carts.clear(); //SET STATENYA KEMUDIAN CLEAR
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Belanjaan"),
        actions: <Widget>[
          //TAMBAHKAN CODE INI
          FlatButton(child: Icon(Icons.clear, color: Colors.white,), onPressed: () => _resetCarts(),)
  ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts), 
          ],
        ),
      ),
      //TAMBAHKAN CODE INI
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openModal(context), //KETIKA DITEKAN MENJALANKAN FUNGSI _openModal
      ),
    );
  }
}
