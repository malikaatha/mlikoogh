import 'package:flutter/material.dart';
import 'package:mlikoogh/screens/list_productentry.dart';
import 'package:mlikoogh/screens/menu.dart';
import 'package:mlikoogh/screens/productentry_form.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
              Text(
                'Mlikoooogh NIh Bos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Belanja puas, harga pas!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],

            ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Tambah Produk'), // TADINYA GUA DAFTAR_PRODUCT
              // Bagian redirection ke ProductEntryFormPage
              onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductEntryFormPage(),
                  ));
              },
            ),
            // Kode ListTile Menu
            ListTile(
                leading: const Icon(Icons.add_reaction_rounded),
                title: const Text('Lihat Daftar Produk'),
                onTap: () {
                    // Route menu ke halaman produk
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductEntryPage()),
                    );
                },
            ),
                      
        ],
      ),
    );
  }
}