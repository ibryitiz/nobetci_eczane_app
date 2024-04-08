import 'package:flutter/material.dart';
import 'package:nobetci_eczane_api_app/components/my_button.dart';
import 'package:nobetci_eczane_api_app/components/my_textfield.dart';
import 'package:nobetci_eczane_api_app/pages/home_page.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  TextEditingController ilController = TextEditingController();

  TextEditingController ilceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Nöbetçi Eczane Uygulaması",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          height: 270,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                MyTextField(
                  name: "İl giriniz",
                  controller: ilController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  name: "İlçe giriniz",
                  controller: ilceController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  onTap: () {
                    String il = ilController.text;
                    String ilce = ilceController.text;
                    if (il.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(il: il, ilce: ilce),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("İl alanı boş olamaz")));
                    }
                  },
                  text: "ARA",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
