import 'package:flutter/material.dart';
import 'package:tweddia/constans.dart';

class DetailprodukPage extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String jumlah;
  final String deskripsi;
  final String harga;
  final String nameVendor;
  const DetailprodukPage(this.imageUrl, this.name, this.jumlah, this.deskripsi,
      this.harga, this.nameVendor,
      {key})
      : super(key: key);

  @override
  _DetailprodukPageState createState() => _DetailprodukPageState();
}

class _DetailprodukPageState extends State<DetailprodukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('image/background2.JPG', fit: BoxFit.fill, width: 500),
          IconButton(
            icon: Image.asset('image/ic_back2.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // Icon(Icons.)
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 8),
                      child: Image.asset(
                        'image/profil.JPG',
                        width: 50,
                      ),
                    ),
                    Text(
                      widget.nameVendor,
                      style: TextStyle(
                          fontSize: 25,
                          color: kPrimaryColor,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: 380,
                  height: 380,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: kPrimaryColor,
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: AssetImage(widget.imageUrl),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: kPrimaryColor,
                    )
                  ],
                ),
                Text(
                  widget.jumlah,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  widget.deskripsi,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                Text(
                  widget.harga,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
