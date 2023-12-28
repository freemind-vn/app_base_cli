import 'package:app_base_cli/app_base_cli.dart';
import 'package:args/command_runner.dart';

void main(List<String> args) {
  CommandRunner('app_base', "A Freemind's simple app template")
    ..addCommand(CreateCommand())
    ..addCommand(UpdateCommand())
    ..run(args);
}
