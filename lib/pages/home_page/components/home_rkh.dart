import 'package:BTechAppLatihan/widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';

class HomeRkh extends StatelessWidget {
  const HomeRkh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CustomCardRkh(
         title: 'Rencana Kerja Harian (RKH)',
         subtitle: ['PNN', 'TBM', 'TSM', 'OHA'],
         counter: [1,3,3,4],
         //icon: Icons.ac_unit,
       ),
    );
  }
}
