import 'package:flutter/material.dart';

import '../../core/assets.dart';
import 'home_page.dart';
import 'widgets/border_widget.dart';
import 'widgets/home_footer.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final _roomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 10000,
            height: 10000,
            child: Image.asset(
              'assets/time_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Image.asset(
                    Images.logo,
                    height: 180,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Otağın kodunu daxil edin!';
                        }
                        return null;
                      },
                      controller: _roomController,
                      decoration: InputDecoration(
                        hintText: 'Otağın kodunu daxil edin',
                        enabledBorder: borderAll,
                        focusedBorder: borderAll,
                        errorBorder: errorBorder,
                        focusedErrorBorder: errorBorder,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF98BF34),
                        side: const BorderSide(color: Colors.white, width: 5),
                      ),
                      child: const Text(
                        'Daxil ol',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
              const HomeFooter(),
            ],
          ),
        ],
      ),
    );
  }
}
