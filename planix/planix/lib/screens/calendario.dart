// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; 
import 'package:planix/components/tarefas.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/screens/ListaTarefas.dart';
import 'package:planix/screens/criarTarefa.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'), // Suporte ao português do Brasil
      ],
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2D5186),
          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xffFFFFFF)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          color: const Color(0xff2D5186),
          child: Column(
            children: [
              // Calendário em uma caixa menor
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TableCalendar(
                      locale: 'pt_BR', // Define o idioma do calendário
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: DateTime.now(),
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Color(0xff191970),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xff2D5186),
                          shape: BoxShape.circle,
                        ),
                        markersMaxCount: 3,
                        markersAlignment: Alignment.bottomCenter,
                        markerDecoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: const TextStyle(
                          color: Color(0xff2D5186),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        leftChevronIcon:
                            const Icon(Icons.chevron_left, color: Color(0xff2D5186)),
                        rightChevronIcon:
                            const Icon(Icons.chevron_right, color: Color(0xff2D5186)),
                        titleTextFormatter: (date, locale) {
                          // Aqui formatamos mês + ano
                          String monthName = date.month.toString();
                          final months = [
                            'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
                            'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
                          ];
                          String formattedMonth = months[date.month - 1];
                          return "$formattedMonth ${date.year}";
                        },
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Color(0xff2D5186)),
                        weekendStyle: TextStyle(color: Color(0xff2D5186)),
                      ),
                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (context, day) {
                          final text = [
                            'D',
                            'S',
                            'T',
                            'Q',
                            'Q',
                            'S',
                            'S'
                          ][day.weekday - 1];
                          return Center(
                            child: Text(
                              text,
                              style: const TextStyle(
                                  color: Color(0xff708090),
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Seção de tarefas
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Color(0xffFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tarefas',
                              style: txtPoppinsPreto(23),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ListaTarefas()));
                              },
                              child: Text(
                                'Ver Tudo',
                                style: txtPoppinsSublinhadoAzul(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          children: const [
                            Tarefa(
                                icon: Icons.check_circle_outline_sharp,
                                title: "Reunião diária",
                                time: "12:00AM - 04:00PM"),
                            Tarefa(
                                icon: Icons.circle_outlined,
                                title: "CG IOS App Promo",
                                time: "06:00PM - 08:00PM"),
                            Tarefa(
                                icon: Icons.calendar_month_outlined,
                                title: "Reunião diária",
                                time: "Amanhã - 12:00AM - 04:00PM"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CriarTarefa()),
                              );
                            },
                            child: Text(
                              'Adicionar Tarefa',
                              style: txtPoppinsSublinhadoAzul(16),
                            ),
                          ),
                        ),
                      ),
                    ],
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
