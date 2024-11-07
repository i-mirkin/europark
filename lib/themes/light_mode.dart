import 'package:flutter/material.dart';

// get color by color: Theme.of(context).colorScheme.inversePrimary

ThemeData lightMode = ThemeData(
    fontFamily: 'Rubik',
    useMaterial3: true,
    colorScheme: ColorScheme.light(
        surface: Colors.white,
        primary: Colors.black,
        secondary: Colors.grey.shade700,
        inversePrimary: Colors.grey.shade700,
        surfaceBright: Colors.lightBlue,
    )
);


// extension CustomColorSchemeX on ColorScheme {
//     Color get smallBoxColor1 =>
//         brightness == Brightness.light ? Colors.blue : Colors.grey[400];
// }
