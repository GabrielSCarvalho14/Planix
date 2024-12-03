// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/screens/dashboard.dart';
import 'package:planix/screens/plannerPessoal.dart';

// ignore: must_be_immutable
class SwitchButton extends StatefulWidget {
  SwitchButton({super.key, required this.isSwitched});
  bool isSwitched;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = widget.isSwitched;
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSwitched = !isSwitched;
          });

          // Navegação para uma nova página ao clicar no botão
          if (isSwitched) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlannerPessoal()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          }
        },
        child: Container(
          width: 220,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSwitched ? const Color(0xff2D5287) : const Color(0xff2D5287),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: isSwitched ? Colors.white : Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Icon(
                    Icons.savings,
                    size: 30,
                    color: isSwitched ? Colors.white : Colors.white,
                  ),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment:
                    isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 110,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      isSwitched ? Icons.savings : Icons.calendar_today,
                      size: 30,
                      color:
                          isSwitched ? const Color(0xff2D5287) : const Color(0xff2D5287),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}