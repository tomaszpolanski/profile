import 'package:profile/main.dart' as app;
import 'package:profile/shared/material_import.dart' as ui;

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}
