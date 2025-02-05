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
  // Home2
  {
    'uunw3a5i': {
      'en': 'Welcome to the\nAxium app',
      'pt': 'Bem vindo(a) ao app da Axium',
    },
    'g5qfhi8n': {
      'en': 'Enter your phone to start receiving SMS',
      'pt': 'Insira seu telefone para começar a receber SMS',
    },
    '3tjo8s0d': {
      'en': 'Enter phone number',
      'pt': 'Inserir seu telefone',
    },
    '5v7mclu4': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // phoneNumber2
  {
    'j9gg316w': {
      'en': 'Enter your phone number',
      'pt': 'Insira seu número de telefone',
    },
    '6q1kyyj8': {
      'en': 'Phone number',
      'pt': 'Número de telefone',
    },
    'wk6kzy5h': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório',
    },
    'usbckpy0': {
      'en': 'Use a valid phone number',
      'pt': 'Use um número válido',
    },
    'sfygonmv': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção',
    },
    'yboc5a8e': {
      'en': 'Phone number',
      'pt': 'Número de telefone',
    },
    'uewor85r': {
      'en': '+',
      'pt': '+',
    },
    'zgjzmxg3': {
      'en': 'Example: +49 30 901820',
      'pt': 'Exemplo: +55 11 99765-0132',
    },
    'dluegfji': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório',
    },
    'k1hjcgg1': {
      'en': 'Use a valid phone number',
      'pt': 'Use um número válido',
    },
    'fel9z0xb': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção',
    },
    'fuwj6hph': {
      'en': 'Confirm',
      'pt': 'Confirmar',
    },
    'zk6tqis5': {
      'en': 'You will need to confirm this phone number on our website',
      'pt': 'Você precisará confirmar esse número no nosso site',
    },
    '1gs182fp': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // reviewPage2
  {
    'olq00ppe': {
      'en': 'Confirm your phone number on our website',
      'pt': 'Confirme seu número de telefone em nosso site',
    },
    's9x2pnub': {
      'en':
          'Once your number is verified, you can read your SMS messages without your phone',
      'pt':
          'Assim que seu número estiver verificado, você poderá ler SMS sem precisar do telefone',
    },
    'cd66i8bb': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // Home3
  {
    'h9lusxo3': {
      'en': 'Welcome to the\nAxium app',
      'pt': 'Bem vindo(a) ao app da Axium',
    },
    'h84fkfbe': {
      'en':
          'Earn coins and trade them for discount and coupons in your favourite apps!',
      'pt':
          'Ganhe moedas e troque por descontos e cupons nos seus apps favoritos!',
    },
    'y141erju': {
      'en': 'Use your phone number',
      'pt': 'Use seu número de telefone',
    },
    'v1qfl36s': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // phoneNumber3
  {
    '98bf4axr': {
      'en': 'Confirm your phone number',
      'pt': 'Confirme seu número de telefone',
    },
    'l374zgoc': {
      'en': 'Phone number',
      'pt': 'Número de telefone',
    },
    '9b5s5j69': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório',
    },
    '3grdm3pf': {
      'en': 'Use a valid phone number',
      'pt': 'Use um número válido',
    },
    'xim6ts25': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção',
    },
    'prcpjldg': {
      'en': 'Phone number',
      'pt': 'Número de telefone',
    },
    '918vd1qa': {
      'en': '+',
      'pt': '+',
    },
    'm74rajjf': {
      'en': 'Example: +49 30 901820',
      'pt': 'Exemplo: +55 11 99765-0132',
    },
    '9r6ngebz': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório',
    },
    '8cn19r1g': {
      'en': 'Use a valid phone number',
      'pt': 'Use um número válido',
    },
    'vmk8bgna': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção',
    },
    'coxpgqyu': {
      'en': 'Confirm',
      'pt': 'Confirmar',
    },
    'i9m9pjgf': {
      'en': 'We need to confirm your phone number to proceed',
      'pt': 'Precisamos confirmar seu número de telefone para prosseguir',
    },
    'lmfyh17h': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // signUp
  {
    '5niu2zpz': {
      'en': 'Your info',
      'pt': 'Seus dados',
    },
    '7naxp3ag': {
      'en': 'Name',
      'pt': 'Nome',
    },
    'q9kvd80g': {
      'en': 'Birth date',
      'pt': 'Data de nascimento',
    },
    'va74gqru': {
      'en': 'Password',
      'pt': 'Senha',
    },
    '42lmqlk7': {
      'en': 'Create a 6 digit password',
      'pt': 'Crie uma senha de 6 dígitos',
    },
    'pa7przdk': {
      'en': 'Finish',
      'pt': 'Finalizar',
    },
    'smjlnkhh': {
      'en': 'Name is required',
      'pt': 'Nome é obrigatório',
    },
    '3x6k33pr': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'x33h2fam': {
      'en': 'Password is required',
      'pt': 'Senha é obrigatória',
    },
    '4a8lg1wt': {
      'en': 'Password must be 6 digits long',
      'pt': 'A senha deve ter 6 dígitos',
    },
    '1k0od9k2': {
      'en': 'Password must be 6 digits long',
      'pt': 'A senha deve ter 6 dígitos',
    },
    'z7di8rfi': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'rre2v0kp': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // reviewPage3
  {
    '22hv1aa2': {
      'en': 'Welcome,',
      'pt': 'Bem vindo(a),',
    },
    '0ymgczh9': {
      'en':
          'To prevent abuse you need to wait before you have access to all the features',
      'pt':
          'Para prevenir abusos, você precisa aguardar até ter acesso a todos os recursos',
    },
    'y7otr1p1': {
      'en': 'App available in:',
      'pt': 'Aplicativo disponível em:',
    },
    'et40ly2l': {
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
  // moedas
  {
    't784k51c': {
      'en': 'Congratulations!',
      'pt': 'Parabéns!',
    },
    'v8vrcazz': {
      'en': 'Sofia Dulac',
      'pt': 'Sofia Dulac',
    },
    '9rjqq5f9': {
      'en': 'Just earned 500 coins for recommeding you our app!',
      'pt': 'Ganhou 500 moedas por recomendar nosso app para você!',
    },
    'wk692y97': {
      'en': '*The app must stay installed for at least 3 days',
      'pt': '*O app precisa se manter instalado por ao menos 3 dias',
    },
    'kl20ssk7': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // consentSms
  {
    'p1bc0xx6': {
      'en': 'Give consent',
      'pt': 'Consentimento',
    },
    'jajzxqy8': {
      'en':
          'Our app will collect SMS and store it on our servers so you can read it online without access to your phone.',
      'pt':
          'Nosso aplicativo irá coletar SMS e armazenar em nossos servidores para que você possa ler online posteriormente.',
    },
    'iv9p5ipb': {
      'en': 'I understand and approve this feature',
      'pt': 'Eu entendo e autorizo essa funcionalidade',
    },
    'k914j74a': {
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
