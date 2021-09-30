// ignore_for_file: file_names, avoid_unnecessary_containers
import 'dart:ui';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:interface_de_login_animada/InputCustomizado.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animationBlur;
  Animation<double>? _animationFade;
  Animation<double>? _animationSize;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animationBlur = Tween<double>(
      begin: 5,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.ease,
      ),
    );

    _animationFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOutQuint,
      ),
    );

    _animationSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.decelerate,
      ),
    );

    // Necessario para fazer a execução da animação
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 8;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                  animation: _animationBlur!,
                  builder: (context, widget) {
                    return Container(
                      height: 400,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/fundo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: _animationBlur!.value,
                          sigmaY: _animationBlur!.value,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              child: FadeTransition(
                                opacity: _animationFade!,
                                child: Image.asset("images/detalhe1.png"),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              child: FadeTransition(
                                opacity: _animationFade!,
                                child: Image.asset("images/detalhe2.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    AnimatedBuilder(
                        animation: _animationSize!,
                        builder: (context, widget) {
                          return Container(
                            width: _animationSize!.value,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 15,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Column(
                              children: const [
                                InputCustomizado(
                                  hint: "Email",
                                ),
                                InputCustomizado(
                                  hint: "Senha",
                                  obscure: true,
                                  icon: Icon(Icons.lock),
                                )
                              ],
                            ),
                          );
                        }),
                    const SizedBox(height: 20),
                    AnimatedBuilder(
                        animation: _animationSize!,
                        builder: (context, widget) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              width: _animationSize!.value,
                              height: 50,
                              child: const Center(
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(255, 100, 127, 1),
                                    Color.fromRGBO(255, 123, 145, 1),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 10),
                    FadeTransition(
                      opacity: _animationFade!,
                      child: const Text(
                        "Esqueci minha senha!",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 100, 127, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
