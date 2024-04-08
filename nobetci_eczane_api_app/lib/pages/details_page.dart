import 'package:flutter/material.dart';
import 'package:nobetci_eczane_api_app/models/eczane.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  Eczane eczane;
  DetailsPage({super.key, required this.eczane});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(eczane.name),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.grey.shade800, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red.shade600,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2)],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myContainer("ECZANENİN ADI : ", eczane.name),
                    myContainer(
                      "ECZANENİN BULUNDUĞU İLÇE : ",
                      eczane.dist,
                    ),
                    myContainer("ECZANENİN ADRESİ : ", eczane.address),
                    myContainer("ECZANENİN TELEFON NUMARASI : ", "+90 ${eczane.phone}"),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget myContainer(String baslik, String bilgi) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 0.5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                baslik,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
          Text(
            bilgi,
            style: TextStyle(color: Colors.grey.shade900, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
