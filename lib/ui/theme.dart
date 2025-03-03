import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    fontFamily: GoogleFonts.orbitron().fontFamily,
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green, brightness: Brightness.dark),
    fontFamily: GoogleFonts.orbitron().fontFamily,
  );
}

ButtonStyle coloredButtonStyle(Color color) {
  return ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(color),
    iconColor: WidgetStatePropertyAll(color),
  );
}

makeSystemNavigationTransparent() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: false,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );
}
