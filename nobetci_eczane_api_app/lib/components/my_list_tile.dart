import 'package:flutter/material.dart';
import 'package:nobetci_eczane_api_app/models/eczane.dart';
import 'package:nobetci_eczane_api_app/pages/details_page.dart';

class MyListTile extends StatelessWidget {
  final Eczane eczane;
  final String eczaneAdi;
  final String adres;
  const MyListTile({super.key, required this.eczaneAdi, required this.adres, required this.eczane});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade600,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12),
        child: ListTile(
          title: Text(
            eczaneAdi,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            adres,
            style: const TextStyle(color: Colors.white70),
          ),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                  eczane: eczane,
                ),
              ));
            },
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
