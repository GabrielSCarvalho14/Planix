// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:planix/components/textStyle.dart';

class Metas extends StatefulWidget {
  final String title;
  final String time;

  const Metas({
    super.key,
    required this.title,
    required this.time,
  });

  @override
  State<Metas> createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Ícone de checkbox que muda de estado
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Icon(
              isChecked ? Icons.check_box_outlined : Icons.check_box_outline_blank,
              color: isChecked ? const Color(0xff5F6368) : const Color(0xff5F6368),
              size: 24,
            ),
          ),
          const SizedBox(width: 16.0),
          // Título e horário
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: txtPoppinsPreto(13),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Ícone de seta
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}

class TaskCardExample extends StatelessWidget {
  const TaskCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text('Task Card Example'),
        backgroundColor: const Color(0xff2D5186),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Metas(
            title: 'Reunião Diária',
            time: '12:00PM - 16:00PM',
          ),
          Metas(
            title: 'Planejamento Semanal',
            time: '09:00AM - 11:00AM',
          ),
          Metas(
            title: 'Apresentação do Projeto',
            time: '15:00PM - 17:00PM',
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: TaskCardExample()));
