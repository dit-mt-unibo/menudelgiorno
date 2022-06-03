abstract class BaseConfig {
  String get apiHost;
  bool get useHttps;
  bool get trackEvents;
  bool get reportErrors;
}

class DevConfig implements BaseConfig {
  String get apiHost => "127.0.0.1:8000";

  bool get reportErrors => false;

  bool get trackEvents => false;

  bool get useHttps => false;
}

class StagingConfig implements BaseConfig {
  String get apiHost => "staging.example.com";

  bool get reportErrors => true;

  bool get trackEvents => false;

  bool get useHttps => true;
}

class ProdConfig implements BaseConfig {
  String get apiHost => "10.0.2.2:8000";

  bool get reportErrors => true;

  bool get trackEvents => true;

  bool get useHttps => true;
}
