import 'package:BTechAppLatihan/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';




class CustomCardGps extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconLocation;
  final double? width;
  final double? height;
  final String? weather;
  final IconData iconWeather;



  const CustomCardGps({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconLocation,
    required this.iconWeather,
    this.width,
    this.height,
    this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          iconLocation,
          size: width != null && height != null ? (width! + height!) / 2 : null,
          color: BgaColor.bgaOrange,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(
          iconWeather,
          color: BgaColor.bgaOrange,
        ),
        onTap: () {
          // Aksi yang akan dilakukan ketika card ditekan
        },
      ),
    );
  }
}
class CustomCardRkh extends StatelessWidget {
  final String title;
  final List<String> subtitle;
  final double? width;
  final double? height;
  final List<int?> counter;

  const CustomCardRkh({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.counter,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  // aksi yang akan dilakukan ketika teks di klik
                },
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: BgaColor.bgaBlack90001,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 8),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: subtitle
                    .asMap()
                    .map((index, item) => MapEntry(
                    index,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '${counter[index]}',
                          style: TextStyle(
                            background: Paint()
                              ..color =
                                  BgaColor.bgaOrange
                              ..strokeWidth = 20
                              ..strokeJoin = StrokeJoin.round
                              ..strokeCap = StrokeCap.round
                              ..style = PaintingStyle.stroke,
                            color: BgaColor.bgaWhiteA700,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          item,
                          style: TextStyle(
                            background: Paint()
                              ..color = BgaColor.bgaOrangeBottomNavigation
                              ..strokeWidth = 20
                              ..strokeJoin = StrokeJoin.round
                              ..strokeCap = StrokeCap.round
                              ..style = PaintingStyle.stroke,
                            color: BgaColor.bgaBlack90001,
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                      ],
                    )))
                    .values
                    .toList(),
              ),
              const SizedBox(
                width: 100,
                height: 10,
              ),
            ],
          ),
        ),
        onTap: () {
          // Aksi yang akan dilakukan ketika card ditekan
        },
      ),
    );
  }
}

class CustomCardMenu extends StatelessWidget {


  final String title;
  final int counter;
  final double? width;
  final double? height;
  final String? route;


  const CustomCardMenu({
    Key? key,
    required this.title,
    required this.counter,
    this.width =156,
    this.height = 84,
    this.route,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(

          title: Text(title,  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: BgaColor.bgaBlackTitleBold ,)),

          subtitle: Padding(
            padding: const EdgeInsets.only(top:10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(counter.toString(), style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: BgaColor.bgaOrange , ),),
                Text('Orang', style: TextStyle(fontSize: 14, color: BgaColor.bgaOrangeCounterOrang , ),),
              ],
            ),
          ),

          onTap: () {
            Navigator.pushNamed(context,'$route');
          },
        ),
      ),
    );
  }
}

