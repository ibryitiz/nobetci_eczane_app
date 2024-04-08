import 'package:flutter/material.dart';
import 'package:nobetci_eczane_api_app/components/my_list_tile.dart';
import 'package:nobetci_eczane_api_app/models/eczane.dart';
import 'package:nobetci_eczane_api_app/services/eczane_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String il;
  final String ilce;
  const HomePage({super.key, required this.il, required this.ilce});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late EczaneService _eczaneService;

  @override
  void initState() {
    super.initState();
    _eczaneService = Provider.of<EczaneService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text('Nöbetçi Eczaneler'),
    );
  }

  Widget _buildBody() {
    _eczaneService.getEczaneData(widget.il, widget.ilce);

    return Consumer<EczaneService>(
      builder: (context, eczaneService, child) {
        List<Eczane> eczaneler = eczaneService.eczaneler;

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: eczaneler.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final eczane = eczaneler[index];
            return MyListTile(eczane: eczane, eczaneAdi: eczane.name, adres: eczane.dist);
          },
        );
      },
    );
  }
}
