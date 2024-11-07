import 'dart:convert';
import 'dart:math';

import 'package:europark/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility/helpers.dart';
import '../widgets/my_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final form = FormGroup({
    'phone': FormControl<String>(value: '',  validators: [Validators.required]),
    'code': FormControl<String>(value: ''),
  });
  var maskTextInputFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  String? _phone;
  String? _code;
  bool _codeSent = false;
  String _codeValue = ''; // отправленный код

  @override
  void initState() {
    super.initState();
    _getMyAuth();
  }

  Future _getMyAuth() async {
    var prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phone') ?? '';
    String code = prefs.getString('code') ?? '';
    _phone = phone;
    _code = code;
    setState(() => { });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(_code == '00'){
        Navigator.of(context).pushNamed(WelcomeScreen.routeName);
      }
    });
  }

  checkCode() async{
    String codeInput = form.control('code').value;
    if(codeInput.length == 4){
      // _codeInput ввел пользователь
      if(_codeValue == codeInput.toString()) {
        //код правильный
        var prefs = await SharedPreferences.getInstance();
        prefs.setString('code', '00'); // телефон подтвержден
        prefs.setString('phone', _phone.toString()); // _phone уже в формате 71234567890
        // создаем нового пользователя с логином _phone  и номером телефона _phone (без +)
        var response = await http.get(Uri.parse('https://europark-tech.ru/local/api/?action=newuser&phone=$_phone'));
        // dynamic result = json.decode(response.body);
        // если пользователь существует возвращается result=error & message=already_exists
        // но в любом случае заходим в систему
        // переходим на следующую страницу
        Navigator.of(context).pushNamed(WelcomeScreen.routeName);
      }
      else {
        // код неправильный
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text("Код неверный!"),
              );
            }
        );
      }
    }
    else {
      form.markAllAsTouched();
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Введите код из СМС"),
            );
          }
      );
    }
  }

  void sendCode() async{
    if(form.valid) {
      String? phone = form.control('phone').value.replaceAll(RegExp(r'[^0-9]+'), '');
      var code = (Random().nextInt(9000) + 1000).toString();

      // sms.ru send message
      // var response = await http.get(Uri.parse('https://sms.ru/sms/send?api_id=DC867098-2175-9B79-AC73-A949D13D9447&to=$phone&msg=$code'));

      // unibell.ru send sms
      var response = await http.get(Uri.parse('https://api.unibell.tech/sms_new?X-Authorization=AccessKey%20tRCoqlhlpDa8bYlpwN2MyeyUKKzTjAn3&destAddr=$phone&sourceAddr=Mirkin&shortMessage=Ваш код авторизации $code'));
      var responseDecode = json.decode(response.body);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Если код не пришел, перезапустите приложение!'),
      ));

      if(code.isNotEmpty) {
        _codeValue = code;
        _codeSent = true;
        _phone = phone;
        setState(() { });
      }
      else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(responseDecode['status_text'].toString()),
              );
            }
        );
      }
    }
    else {
      form.markAllAsTouched();
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Введите номер телефона"),
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color(0xffeeeeee),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: <Widget>[

                ReactiveTextField<String>(
                  formControlName: 'phone',
                  inputFormatters: [maskTextInputFormatter],
                  decoration: const InputDecoration(
                    labelText: 'Введите номер телефона',
                    helperText: '',
                    helperStyle: TextStyle(height: 0.7),
                    errorStyle: TextStyle(height: 0.7),
                  ),
                  validationMessages: {'required': (error) => 'Введите номер телефона'},
                ),

                _codeSent
                    ?
                Column(
                  children: [

                    ReactiveTextField<String>(
                      formControlName: 'code',
                      decoration: const InputDecoration(
                        labelText: 'Введите код из СМС',
                        helperText: 'Код приходит в течение 15 секунд',
                        helperStyle: TextStyle(height: 2),
                        errorStyle: TextStyle(height: 2),
                      ),
                      validationMessages: {'required': (error) => 'Введите код'},
                    ),

                    const SizedBox(height: 15),

                    MyButton(
                        onTap: checkCode,
                        child: const Text('Войти')
                    )




                  ],
                )
                    :
                Column(
                  children: [
                    MyButton(
                        onTap: sendCode,
                        child: const Text('Получить код')
                    ),
                    // ElevatedButton(onPressed: sendCode, child: const Text('Получить код')),
                    Text('В СМС придет код.')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
