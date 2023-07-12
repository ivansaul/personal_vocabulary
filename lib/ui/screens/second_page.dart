import 'package:flutter/material.dart';
import '../../config/theme/app_theme.dart';
import '../widgets/customButton.dart';
import '../widgets/customCard.dart';

class SecondPage extends StatelessWidget {
  static const String name = 'home_screen';
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLightGrey,
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(icon: Icon(Icons.menu)),

                CustomButton(icon: Icon(Icons.notifications)),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     color: Colors.white24,
                //   ),
                //   child: const Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: Icon(Icons.menu),
                //   ),
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     color: Colors.white24,
                //   ),
                //   child: const Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: Icon(Icons.notifications),
                //   ),
                // ),
              ],
            ),
          ),

          progress(), //Barra de progreso

          practice(), //Tarjeta con la práctica de inglés

          category(), //Tarjeta con categorías
        ],
      ),
    );
  }

  Column progress() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                'Good evening, Mark!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: 'Your progress today 50'),
                          TextSpan(
                            text: '/200 ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(text: 'words'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const LinearProgressIndicator(
                value: 20.0,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding practice() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text(
              'Practice English',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('You have new words!'),
          ),
          Card(
            color: Colors.black,
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New word',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pleasure',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Listen',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 8,
                            ), // Espacio entre el ícono y el texto
                            Icon(Icons.volume_up_sharp, color: Colors.black),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'View more',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding category() {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Column(
            children: [
              ListTile(
                title: Text(
                  'Top themes',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('You have new words!'),
              ),
            ],
          ),
          SizedBox(height: 10), // Espacio vertical entre las dos columnas
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CustomCard(title: 'Titulo 1', content: 'Prueba 1'),
                  ],
                ),
              ),
              SizedBox(width: 10), // Espacio horizontal entre las dos columnas
              Expanded(
                child: Column(
                  children: [
                    CustomCard(title: 'Titulo 2', content: 'Prueba 2'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
