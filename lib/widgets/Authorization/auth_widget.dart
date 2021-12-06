import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Виджет авторизации (экран авторизации приложения)
class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  _authWidgetState createState() => _authWidgetState();
}

class _authWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Войти в свою учётную запись',
          style: TextStyle(color: Color(0xFFf2b9cc)),
        ),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

//Класс для статического текста с информацией об авторизации
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  static const appTextStyle =
      TextStyle(fontSize: 16, color: Color(0xFF523637)); //Colors.black,);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          _FormWidget(),
          SizedBox(
            height: 25,
          ),
          Text(
              'Чтобы пользоваться галереей изображений, а также получать персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, нажмите кнопку "Зарегистрироваться", регистрация является бесплатной и простой.',
              style: appTextStyle),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFf2b9cc)),
                  foregroundColor: MaterialStateProperty.all(Color(0xFF523637))
              ),
              child: Text('Зарегистрироваться')),
          SizedBox(
            height: 15,
          ),
          Text(
              'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите кнопку "Отправить письмо повторно".',
              style: appTextStyle),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFf2b9cc)),
                foregroundColor: MaterialStateProperty.all(Color(0xFF523637))
              ),
              child: Text('Отправить письмо повторно')),
        ],
      ),
    );
  }
}

//Классы для формы заполнения авторизации
class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth (){
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password =='admin'){
      errorText = null;
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState (() {});
  }



  void _resetPassword (){

  }


  final appTextStyle =
      TextStyle(fontSize: 16, color: Color(0xFF523637)); //Colors.black,);

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[Text (
          errorText,
          style: TextStyle(
              fontSize: 17,
              color: Colors.red),
        ),
          SizedBox(
          height: 20,
        ),],
        Text('Имя пользователя'),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF523637), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF523637), width: 1.0),
            ),
            hintText: 'Введите логин',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            isCollapsed: true,
          ),
          cursorColor: Color(0xFF523637),
        ),
        SizedBox(
          height: 15,
        ),
        Text('Пароль'),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF523637), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF523637), width: 1.0),
            ),
            hintText: 'Введите пароль',
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            isCollapsed: true,
          ),
          cursorColor: Color(0xFF523637),
          obscureText: true,
        ),
        SizedBox(height: 25,),
        Row(
          children: [
            ElevatedButton(
                onPressed: _auth,
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF523637)),
                  foregroundColor: MaterialStateProperty.all(Color(0xFFf2b9cc)),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8, horizontal: 15)),
                ),
                child: Text('Войти',
                  style: TextStyle(fontSize: 16,
                  ),)),
            SizedBox(width: 10,),
            TextButton(
                onPressed: _resetPassword,
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  foregroundColor: MaterialStateProperty.all(Color(0xFF523637)),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 8, horizontal: 15)),
                ),
                child: Text('Сбросить пароль'),)],
        )
      ],
    );
  }
}
