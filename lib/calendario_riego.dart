import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarioRiego extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tituloApp = Container(
      padding: EdgeInsets.only(top: 120,bottom: 50,right: 0,left: 60),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'C r e c i e n d o   j u n t o s ',
                style: GoogleFonts.lato(
                  color: Colors.grey[600],
                  fontSize: 24,
                ),
              ),
              Image.asset('img/hoja.png',scale: 15),
            ],
          ),
        ],
      ),
    );

    final seccionApp = Container(
      padding: EdgeInsets.only(top: 20,bottom: 0,right: 0,left: 25),
      child: Column(
        children: <Widget>[
          Text(
            'Calendario',
            style: GoogleFonts.mukta(
              color: Colors.grey[600],
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    Widget wCalendario(BuildContext context)=>Container(
      width: 360,
      height: 400,
      padding: EdgeInsets.only(top: 50,bottom: 0,right: 0,left: 60),
      child: Column(
        children: [
          SfCalendar(
            view: CalendarView.month,
            showNavigationArrow: true,
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
            ],
            firstDayOfWeek: 7,
            backgroundColor: Colors.black38,
            cellBorderColor: Colors.black87,
            todayHighlightColor: Colors.black87,
            selectionDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.black, width: 2
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );

    final contenedorFinal = Container(
      child: Column(
        children: [
          tituloApp,
          seccionApp,
        ],
      ),
    );

    return MaterialApp(
        title: 'Calendario ',
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(199,218,196, 1)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Column(
                      children: [
                        contenedorFinal,wCalendario(context),
                      ],
                    )
                ),
              ],
            ),
          ),
        ));
  }
}