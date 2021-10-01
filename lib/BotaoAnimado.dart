// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';

class BotaoAnimado extends StatelessWidget {
  AnimationController controller;
  Animation<double> largura;
  Animation<double> opacidade;
  Animation<double> altura;
  Animation<double> radius;

  BotaoAnimado({Key? key, required this.controller})
      : largura = Tween<double>(
          begin: 0,
          end: 500,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.5,
            1,
          ),
        )),
        altura = Tween<double>(
          begin: 0,
          end: 50,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.5,
            0.7,
          ),
        )),
        radius = Tween<double>(
          begin: 0,
          end: 20,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.6,
            1,
          ),
        )),
        opacidade = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.6,
            0.8,
          ),
        )),
        super(key: key);

  Widget _buildAnimation(BuildContext context, widget) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: largura.value,
        height: altura.value,
        child: Center(
          child: FadeTransition(
            opacity: opacidade,
            child: const Text(
              "Entrar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.value),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(255, 100, 127, 1),
              Color.fromRGBO(255, 123, 145, 1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}
