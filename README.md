<img src="./banner.png" alt="logo speedy" style="width:50%;">

[![Licencia speedy](https://jungle-team.com/wp-content/uploads/2023/03/licence.png)](https://github.com/itorres2020/Speedy-OEA-MX-autoinstall/blob/main/LICENSE) 
[![Chat Telegram](https://jungle-team.com/wp-content/uploads/2023/03/telegram.png)](https://t.me/joinchat/GrupoMexicoOEA) 
[![Donar a Jungle](https://jungle-team.com/wp-content/uploads/2023/03/donate.png)](https://paypal.me/jungleteam)

`Speedy OEA Autoinstall` es un script en shell que te permite instalar de manera sencilla las utilidades más usadas en tu receptor Enigma2.

Si deseas obtener ayuda o colaborar con otros usuarios sobre este desarrollo, así como con Enigma2 en general, tenemos un [grupo de Telegram](https://t.me/joinchat/GrupoMexicoOEA). ¡Únete a nosotros!

Si deseas estar al tanto de las novedades desarrolladas por el equipo, visita nuestro [canal de Telegram de noticias](https://t.me/joinchat/GrupoMexicoOEA).

---

## Introducción

`Speedy OEA Autoinstall` se ejecuta en la consola terminal, proporcionando una interfaz para instalar diferentes paquetes necesarios para configurar tu receptor Enigma2 después de instalar una imagen. Por el tipo de paquetes que gestiona, su uso es compatible únicamente con versiones de Python **3.x+**.

---

### Requisitos Previos

`Speedy OEA Autoinstall` está desarrollado en `shell` y puede ser utilizado para la instalación de paquetes en imágenes que usen `Python 3.x`. Actualmente es compatible con las siguientes imágenes, y próximamente se añadirán más:

- OpenATV 7.3
- Egami 10.3
- Openspa 8.x
- Openpli Python 3

Para disfrutar de la interfaz gráfica completa (iconos y barras de progreso), se recomienda usar la nueva terminal de Windows:

- [Descargar Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=es-mx&gl=mx&rtc=1)

En caso de usar Mac OS, la terminal por defecto es completamente compatible con la interfaz gráfica.

---

## Ejecución

Para ejecutar `Speedy OEA Autoinstall`, simplemente utiliza este comando en la terminal después de acceder a tu receptor Enigma2:

```bash
wget -q '--no-check-certificate' https://raw.githubusercontent.com/itorres2020/Speedy-OEA-MX-autoinstall/refs/heads/main/speedy_OEA_autoinstall.sh; bash speedy_OEA_autoinstall.sh; rm -r speedy_OEA_autoinstall.sh
```

Una vez ejecutado, el script realizará un chequeo y, si la imagen es compatible, accederemos al menú de instalación de paquetes de una manera guiada.

[![speedy video](https://jungle-team.com/wp-content/uploads/2023/03/video.png)](https://videos.files.wordpress.com/bsboDDpD/speedy_oea_video.mp4)

---

## Inicio rápido

Tienes un manual completo de uso [Guia Speedy OEA Autoinstall](https://jungle-team.com/speedy-oea-autoinstall-andale-andale-andale-yiiija/) que explica más detalladamente las opciones disponibles, aunque como se ha mencionado, es simplemente seguir las instrucciones que va solicitando Speedy OEA Autoinstall.

---

## Obteniendo ayuda

Si los recursos mencionados anteriormente no responden a tus preguntas o dudas, o te ha resultado muy complicado, tienes varias formas de obtener ayuda.

1.  Tenemos una comunidad donde se intenta que se ayudan unos a otros en nuestro [grupo de Telegram](https://t.me/joinchat/GrupoMexicoOEA) . ¡Únete a nosotros! Hacer una pregunta aquí suele ser la forma más rápida de obtener respuesta y poder hablar directamente con los desarrolladores.
2.  También puedes leer con detenimiento la [Guia avanzada de Speedy OEA Autoinstall](https://jungle-team.com/speedy-oea-autoinstall-andale-andale-andale-yiiija/) .

---

## Contribuir

Speedy OEA Autoinstall está desarrollado bajo código abierto, por lo que las contribuciones de todos los tamaños son bienvenidas para mejorar o ampliar las posibilidades del mismo. También puedes ayudar [informando errores o solicitudes de funciones a través del grupo telegram](https://t.me/joinchat/GrupoMexicoOEA) .

---

## Donando

De vez en cuando nos preguntan si aceptamos donaciones para apoyar el desarrollo. Si bien, mantener `Speedy OEA Autoinstall`  es nuestro hobby y  pasatiempo, si tenemos un coste de mantenimiento de servidor de repositorios así como [del blog enigma2](https://jungle-team.com/), por lo que si deseas colaborar en su mantenimiento, siéntete libre de realizar una [Donación](https://paypal.me/jungleteam)

---

## Licencia

Puedes copiar, distribuir y modificar el software siempre que las modificaciones se describan y se licencien de forma gratuita bajo [LGPL-3](https://www.gnu.org/licenses/lgpl-3.0.html) . Los trabajos derivados (incluidas las modificaciones o cualquier cosa vinculada estáticamente a la biblioteca) solo se pueden redistribuir bajo LGPL-3.

**Nota:** Si realizas modificaciones al código y lo redistribuyes, asegúrate de describir claramente los cambios realizados, como lo requiere la licencia LGPL-3.

## Créditos
Este proyecto fue desarrollado y es mantenido por [itorres2020](https://github.com/itorres2020) y el equipo de Jungle Team.
