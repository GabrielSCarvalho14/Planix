// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle txtDongle(double tamanho) {
  return GoogleFonts.dongle(
      fontSize: tamanho,
      color: const Color.fromRGBO(255, 250, 250, 1),
      shadows: <Shadow>[
        const Shadow(
          offset: Offset(3.0, 3.0),
          blurRadius: 4.0,
          color: Color.fromRGBO(0, 0, 0, 0.250),
        )
      ]);
}

TextStyle txtDonglePreto(double tamanho) {
  return GoogleFonts.dongle(
    fontSize: tamanho,
    color: const Color(0xff000000),
  );
}

TextStyle txtDongleAzul(double tamanho) {
  return GoogleFonts.dongle(
    fontSize: tamanho,
    color: const Color(0xff2D5287),
  );
}

TextStyle txtDongleBold(double tamanho) {
  return GoogleFonts.dongle(
    fontSize: tamanho,
    color: const Color(0xff000000),
    fontWeight: FontWeight.w600,
  );
}

TextStyle txtDongleBrancoBold(double tamanho) {
  return GoogleFonts.dongle(
    fontSize: tamanho,
    color: const Color(0xffFFFFFF),
    fontWeight: FontWeight.w600,
  );
}

TextStyle txtPoppinsWhite(double tamanho) {
  return GoogleFonts.poppins(
      fontSize: tamanho,
      color: const Color.fromRGBO(255, 255, 255, 1),
      shadows: <Shadow>[
        const Shadow(
          offset: Offset(5.0, 5.0),
          blurRadius: 6.0,
          color: Color.fromRGBO(0, 0, 0, 0.250),
        )
      ]);
}

TextStyle txtPoppinsWhiteBold(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, fontWeight: FontWeight.bold, color: const Color(0xffFFFFFF));
}

TextStyle txtPoppinsBold(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, fontWeight: FontWeight.bold);
}

TextStyle txtPoppinsSemiBold(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, fontWeight: FontWeight.w500);
}

TextStyle txtPoppins(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho);
}

TextStyle txtPoppinsGrey(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, color: const Color(0xff555555));
}

TextStyle txtPoppinsGreyEscuro(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, color: const Color(0xff333333));
}

TextStyle txtPoppinsAzulBold(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, color: const Color(0xff2D5287), fontWeight: FontWeight.w600);
}

TextStyle txtPoppinsAzul(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, color: const Color(0xff2D5287));
}

TextStyle txtPoppinsPreto(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, color: const Color(0xff000000));
}

TextStyle txtPoppinsBoldSublinhado(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, fontWeight: FontWeight.bold, decoration: TextDecoration.underline);
}

TextStyle txtPoppinsSublinhadoAzul(double tamanho) {
  return GoogleFonts.poppins(fontSize: tamanho, decoration: TextDecoration.underline, color: const Color(0xff2D5287));
}