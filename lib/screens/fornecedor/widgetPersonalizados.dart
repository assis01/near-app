
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget TextFormFieldPersonalizado(
    String nomeLabel, int numeroLinhas, String textDica, bool tipoSenha, TextEditingController controller) {
  return Padding(
      padding: EdgeInsets.all(3.0),
      child: Card(
        color: Colors.white,
        child: TextFormField(
          validator: (String valor){
            if(valor == null || valor.isEmpty){
              return 'Campo obrigatório.';
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: nomeLabel,
            hintText: textDica,
          ),
          obscureText: tipoSenha,
          maxLines: numeroLinhas,
        ),
      )
  );
}

Widget TextFieldPersonalizadoC(
    String nomeLabel, int numeroLinhas, String textDica, bool tipoSenha, TextEditingController controller) {
  return Padding(
      padding: EdgeInsets.all(3.0),
      child: Card(
        color: Colors.white,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: nomeLabel,
            hintText: textDica,
          ),
          obscureText: tipoSenha,
          maxLines: numeroLinhas,
        ),
      ));
}


Widget FotoCirdular(String urlFoto, double widthFoto, double heightFoto) {
  return Container(
      width: widthFoto,
      height: heightFoto,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.fill, image: AssetImage(urlFoto))));
}

Widget FotoQuadrado(String urlFoto, double widthFoto, double heightFoto) {
  return Container(
      width: widthFoto,
      height: heightFoto,
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
              fit: BoxFit.fill, image: AssetImage(urlFoto))));
}

Widget PaddingPersonalizado(Widget widget) {
  return Padding(padding: EdgeInsets.all(10.0), child: widget);
}

