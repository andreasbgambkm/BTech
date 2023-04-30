
import 'package:BTechAppLatihan/core/utils/color_pallete.dart';
import 'package:BTechAppLatihan/widgets/custom_appbar.dart';
import 'package:BTechAppLatihan/widgets/custom_button.dart';
import 'package:BTechAppLatihan/widgets/custom_searchbarlistcard.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class CheckInPage extends StatefulWidget {
  static String routeName = "/checkin";
  final String? title;
  final List<String>? items;


  const CheckInPage({Key? key,  this.title,  this.items}) : super(key: key);

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final _searchController = TextEditingController();
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items!;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    List<String> filtered = [];
    widget.items?.forEach((item) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        filtered.add(item);
      }
    });
    setState(() {
      _filteredItems = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Daftar Pekerja'),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            BgaButton(text: 'Scan CheckIn',
                icon: FlutterIcons.scanner_mco,
                backgroundColor: BgaColor.bgaWhiteA700,
                textColor: BgaColor.bgaOrange,
              onPressed: (){

              },
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search for items',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (query) => _filterItems(query),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_filteredItems[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
