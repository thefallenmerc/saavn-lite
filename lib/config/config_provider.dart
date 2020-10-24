import 'package:mobile/config/config.dart';
import 'package:mobile/helpers/constants.dart';

devConfig() => Config(
      appName: 'Saavn Pru [DEV]',
      apiBaseUrl: ApiEndpoints.developmentAPIBaseUrl,
      appToken: '',
      apiLogging: true,
      diagnostic: true,
    );

stableConfig() => Config(
    appName: 'Pensil [Stable]',
    apiBaseUrl: ApiEndpoints.developmentAPIBaseUrl,
    appToken: '',
    apiLogging: true,
    diagnostic: true);

releaseConfig() => Config(
      appName: 'Pensil [Release]',
      apiBaseUrl: ApiEndpoints.productionAPIBaseUrl,
      appToken: '',
      apiLogging: false,
      diagnostic: false,
    );
