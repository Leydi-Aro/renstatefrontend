import 'package:flutter/material.dart';
class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Text("""Términos y Condiciones
1. Aceptación de los Términos y Condiciones
Al utilizar nuestra aplicación web de renta de inmuebles, aceptas cumplir con los siguientes términos y condiciones. Si no estás de acuerdo con alguno de ellos, por favor, no utilices la aplicación.

2. Uso de la Aplicación
Nuestra aplicación web de renta de inmuebles te permite buscar, explorar y alquilar propiedades. El uso de la aplicación está sujeto a las leyes y regulaciones aplicables.

3. Responsabilidad del Usuario
Eres responsable de la información que proporcionas en la aplicación. Debes asegurarte de que la información sea precisa y completa. No debes utilizar la aplicación para ningún propósito ilegal o fraudulento.

4. Propiedad Intelectual
Todos los derechos de propiedad intelectual de la aplicación y su contenido son propiedad de la empresa desarrolladora. No se permite la reproducción, distribución o modificación del contenido sin autorización previa.

5. Privacidad
Respetamos tu privacidad y protegemos tus datos personales de acuerdo con nuestra política de privacidad. Al utilizar la aplicación, aceptas nuestra política de privacidad.

6. Limitación de Responsabilidad
No nos hacemos responsables de ningún daño o pérdida que puedas sufrir como resultado del uso de la aplicación. La aplicación se proporciona "tal cual" y no ofrecemos garantías de ningún tipo.

7. Modificaciones de los Términos y Condiciones
Nos reservamos el derecho de modificar estos términos y condiciones en cualquier momento. Te notificaremos sobre cualquier cambio importante a través de la aplicación.

8. Contacto
Si tienes alguna pregunta o inquietud sobre estos términos y condiciones, puedes contactarnos a través de la sección de contacto de la aplicación.

Recuerda que estos términos y condiciones son solo un ejemplo y pueden variar dependiendo de la aplicación y la empresa desarrolladora. Es importante consultar los términos y condiciones específicos de la aplicación que deseas utilizar."""),
        ),
      ),
    );
  }
}
