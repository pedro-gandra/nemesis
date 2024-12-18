import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'zopd5vif': {
      'en': 'Welcome to the\nAxium app',
      'pt': 'Bem vindo(a) ao app da Axium',
    },
    '0ml37149': {
      'en': 'Sign in to see the status of your application',
      'pt': 'Entre para conferir o status da sua aplicação',
    },
    'cqvw3isc': {
      'en': 'Use your phone number',
      'pt': 'Use seu número de telefone',
    },
    'mmh5gpon': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // phoneNumber
  {
    'ku23swmt': {
      'en': 'Confirm your phone number',
      'pt': 'Confirme seu número de telefone',
    },
    'jnkuzhcj': {
      'en': 'Phone number',
      'pt': 'Número de telefone',
    },
    'h3aji55u': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório',
    },
    'ui7bq7aq': {
      'en': 'Use a valid phone number',
      'pt': 'Use um número válido',
    },
    'piru5o1x': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção',
    },
    '43lgylr7': {
      'en': 'Phone number',
      'pt': 'Número de telefone',
    },
    '9qfwt9nq': {
      'en': '+',
      'pt': '+',
    },
    'ethjyvl2': {
      'en': 'Example: +49 30 901820',
      'pt': 'Exemplo: +55 11 99765-0132',
    },
    'uhaiibob': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório',
    },
    'xrcyc03a': {
      'en': 'Use a valid phone number',
      'pt': 'Use um número válido',
    },
    '3m3zs4mg': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção',
    },
    '3eye11g9': {
      'en': 'Confirm',
      'pt': 'Confirmar',
    },
    'j671lm5m': {
      'en': 'We need to confirm your phone number to proceed',
      'pt': 'Precisamos confirmar seu número de telefone para prosseguir',
    },
    '1ydw7ix6': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // reviewPage
  {
    'gpeebhta': {
      'en': 'Your application is being reviewed',
      'pt': 'Sua aplicação está em revisão',
    },
    'tjjyi4uq': {
      'en': 'Our app will notify you once this proccess is concluded',
      'pt':
          'Nosso aplicativo irá notificá-lo assim que esse processo for concluído',
    },
    '9kl00dol': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // Initial
  {
    'b1wqb7on': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // permissionDenied
  {
    'a6ewvbc2': {
      'en': 'Grant permissions',
      'pt': 'Conceder permissões',
    },
    'egef7mud': {
      'en':
          'Our app needs some permissions to function properly, click on the button below to grant them',
      'pt':
          'O aplicativo precisa de algumas permissões para funcionar corretamente, clique no botão para permitir',
    },
    'k2om6pju': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // Miscellaneous
  {
    'z8da2ehq': {
      'en': '',
      'pt': '',
    },
    'oiz9z29u': {
      'en': '',
      'pt': '',
    },
    'uwjfd4xj': {
      'en': '',
      'pt': '',
    },
    'e0hlhnsa': {
      'en': '',
      'pt': '',
    },
    'npx76gjr': {
      'en': '',
      'pt': '',
    },
    '5bjk47za': {
      'en': '',
      'pt': '',
    },
    'u2m8n39m': {
      'en': '',
      'pt': '',
    },
    'cz1fp8j2': {
      'en': '',
      'pt': '',
    },
    'v9w4hqlq': {
      'en': '',
      'pt': '',
    },
    'zirjesy1': {
      'en': '',
      'pt': '',
    },
    'b6oid375': {
      'en': '',
      'pt': '',
    },
    'm7d1dd5r': {
      'en': '',
      'pt': '',
    },
    'y1b9kl14': {
      'en': '',
      'pt': '',
    },
    'sb4kwkr3': {
      'en': '',
      'pt': '',
    },
    'jcmmio0e': {
      'en': '',
      'pt': '',
    },
    'hxstxebn': {
      'en': '',
      'pt': '',
    },
    'a2yinqxr': {
      'en': '',
      'pt': '',
    },
    '2gci5hbi': {
      'en': '',
      'pt': '',
    },
    '3gmornr3': {
      'en': '',
      'pt': '',
    },
    'ddhbawq8': {
      'en': '',
      'pt': '',
    },
    '23en3m4g': {
      'en': '',
      'pt': '',
    },
    '7w6fb85y': {
      'en': '',
      'pt': '',
    },
    'ri0tu8uf': {
      'en': '',
      'pt': '',
    },
    'k4l1h3v4': {
      'en': '',
      'pt': '',
    },
    'm58hyite': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
