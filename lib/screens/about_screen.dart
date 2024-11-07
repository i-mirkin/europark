import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/helpers.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_navigation_bar.dart';
import '../widgets/my_drawer.dart';


class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  static const routeName = '/about-screen';

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBar: AppBar(), title: 'О компании'),

      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Helpers().marginLeft, vertical: Helpers().marginTop),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network('https://europark-tech.ru/imgs/islide-03.webp')),

                    SizedBox(height: Helpers().divider),

                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Скоро в этом разделе можно будет управлять своей техникой, отслеживать заявки и свои запросы к партнерам!",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: Helpers().fontSize),
                      ),
                    ),

                    SizedBox(height: Helpers().divider),



                    const Text(
                      'Многолетний опыт',
                      textAlign: TextAlign.left,
                      style: h1TextStyle,
                    ),

                    Text(
                      'ООО «ЕВРОпарк» эффективно и безупречно работает на рынке аренды спецтехники в Санкт-Петербурге и Ленинградской области c 2008 года.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: Helpers().fontSize),
                    ),

                    SizedBox(height: Helpers().divider),

                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Перечень спецтехники, представленной на нашем сайте, находится в собственности ООО «ЕВРОпарк», что позволяет компании предоставлять спецтехнику в аренду по конкурентоспособным ценам и гарантировать надежную беспрерывную работу на весь срок аренды.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: Helpers().fontSize),
                      ),
                    ),

                    SizedBox(height: Helpers().divider),

                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network('https://europark-tech.ru/upload/iblock/8bb/pysh3u3lpuqohjq4zyk3f6mp3gp16idn.jpg')),
                    SizedBox(height: Helpers().divider),
                    Text(
                      'Техническая служба ООО «ЕВРОпарк» обеспечивает своевременное техобслуживание и оперативный, качественный ремонт арендованной спецтехники.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: Helpers().fontSize),
                    ),
                    SizedBox(height: Helpers().divider),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Аренда спецтехники является оптимальным вариантом выполнения отдельных видов работ с использованием дорогостоящий техники.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: Helpers().fontSize),
                      ),
                    ),



                  ],
                ),
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: const MyBottomNavigationBar(),

    );
  }
}
