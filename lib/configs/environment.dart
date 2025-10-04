enum Environment {production}

extension EnvironmentExtension on Environment {
  String value() {
    switch (this) {
      case Environment.production:
        // return 'lib/configs/prod_config.json';
        return 'lib/configs/uat_config.json';
    }
  }
}
