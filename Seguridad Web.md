# Seguridad Web

## Introducción y naturaleza del problema

Los sistemas web, al igual que los sistemas de correo electrónico, son inherentemente inseguros.

La inseguridad radica en que en general, una petición de página web es una conexión con el servidor y su posterior respuesta en la forma de conexión al cliente, sin mediar medidas de control, como pueden ser:

1. una contraseña
2. limitaciones en el ancho de banda a utilizar, o
3. tipo de respuesta esperada

En general se espera que tanto las peticiones como las respuestas sean válidas, es decir, que cumplan con los protocolos.

Los protocolos son, sin embargo, lo suficientemente abiertos para permitir una variedad muy amplia de posibles peticiones y páginas entregadas como respuesta.

Y desafortunadamente no es dificil lograr envios que cumplan con el protocolo, pero que realicen además otras actividades que puedan lesionar los intereses de la información en cliente o en servidor.

Una analogía de la vida real sería ir por limones a la recaudería, y al llegar a casa descubrir que uno de ellos esta podrido. El protocolo de adquisición se cumplió, pero el resultado no fué el esperado para el cliente. Algo similar podría darse del lado del servidor, al inadvertidamente recibir un billete falso.

Por supuesto, el descuido de una persona, no necesariamente implica la acción de, por ello, atacar su cuenta. Sin afán de juzgar, son dos acciones diferentes y una no necesariamente conlleva a la otra, y el atacar proviene de una decisión, una intención de hacerlo y, algunos dirían, una ética.

## Tipos de problemas

### Contraseñas

Una contraseña es una medida, en muchos casos, adecuada, que premite el ingreso a un servicio web de manera personalizada, y que hasta cierto punto garantiza que el usuario que ingresa es quien dice ser, pero por supuesto, esto se viola cuando la contraseña la consigue otra persona.

Esto se puede dar por muy diversas causas:

* el dueño de la cuenta compartió voluntaria o involuntariamente la contraseña
* la contraseña fué robada, deducida o capturada por medios físicos o electrónicos
* el servidor y/o la base de datos fué atacada

### Ataques

La seguridad en un hardware servidor tiene varios aspectos, tanto físicos como lógicos.

Sobre los físicos, claro, implican el tener el servidor cerca. En ocasiones se puede detectar acciones en este a cierta distancia, mediante sensores especiales. Otra forma es teniendo acceso físico al cableado de red (ataque de *man-in-the-middle*).

Por supuesto, una red inalámbrica también es inherentemente insegura, debido a que es dificil controlar el alcance de las radio-frecuencias por las que se transmite. Y aunque se suele utilizar encriptación (con una multitud de protocolos), es sólo cuestión de tiempo para contar con los mecanismos de ataque a dicha encriptación).

Toda transmisión a través de una red sin encriptación, aunque la página utilizada si la utilice (con https u otros), implica la transmisión de datos fácilmente visibles, por lo menos al inicio de la comunicación, y por tanto, fácilmente atacables.

Un ataque muy utilizado todavía, por lo dificil que es de controlar, es el *DDOS* o ataque distribuido por negación de servicio. Este consiste en que desde equipos "zombies", previamente atacados, se instala software específico para conectarse simultáneamente, de manera repetida, rápida y en poco tiempo hacia un mismo equipo o equipos bajo una misma conexión de red, dando como resultado que esta se satura y no permite el ingreso de más conexiones válidas, efectivamente negándoles el servicio. El éxito de este ataque radica en realizarlo coordinadamente (distribuidamente), desde muy diversos puntos geográficamente distantes, a fin de que el ataque no se note en sus propias redes. Si además se hace desde zombies que se activan y desactivan de manera aparentemente aleatoria, y eviando peticiones válidas, se hace muy dificil su detección y control.

En ocasiones los ataques toman la forma del *defacing* o reemplazo del contenido web de sitios importantes, por otro con información que va desde "poner su banderita" de aquí estuvo el cracker, hasta referencias políticas, ideológicas o acusaciones y burlas a la organización dueña del sitio.

El crackear también puede implicar robo de información y limpieza al salir, con lo que es muy dificil detectar, cuando, como y desde donde ocurrió un ataque. Así como no hay sistema 100% seguro, también se puede hablar que no hay ataque 100% indetectable, por lo que existen muy diversas técnicas "forenses" de revisión y control de daños.

## Medidas usualmente consideradas y su nivel de eficacia

### Contraseñas y similares
Por supuesto, las contraseñas son un nivel de protección ante ataques, pero el simple hecho de que el servidor presente la carátula donde se puede ingresar el login y contraseña, ya implica una conexión y una respuesta de este sin mediar seguridad. Claro, esta página también se puede poner encriptada (bajo https, por ejemplo).

Esta página de ingreso al sistema, de no estar programada adecuadamente, puede conllevar a ataques del tipo *inyección de código*, así como cualquier otra parte del sistema que requiera entrada del usuario cliente.

Las contraseñas implican un cierto cuidado. Algunas recomendaciones para ello incluyen:

* contraseñas de al menos 8 caracteres
* inclusión de mayúsculas, minúsculas, otros caracteres encontrados en un teclado común, evitanto acentos, eñes, o caracteres especiales
* cambiarlas con cierta regularidad
* jamás escribirlas
* jamás utilizar palabras en el diccionario de cualquier idioma, al derecho o al revéz, uso de sustituciones de letras por números (términos *L337*), no utilizar sólo números y menos nombres de familiares o gente cercana o términos del trabajo realizado
* no utilizar la misma contraseña en diferentes sistemas
* etc.

También, un buen sistema de introducción de contraseñas debe incluir protección contra intentos sucesivos por ataques sistemáticos (en vez de desplegar la página de ingreso de contraseña tan pronto se requiere, darle un tiempo de retraso entre intentos), bloquear la conexión desde sitios/redes que hacen múltiples intentos (no menos de tres) de ingreso de contraseña, etc.

También hay otros esquemas para evitar acceso sistemático (desde programas atacantes) a sitios web sin requerir contraseña. Entre ellos están los protocolos *one time password* que requieren un dispositivo físico externo para dar un código dependiendo de la ocasión en que solicita o de un "challenge" (reto) que hay que superar con el código dado por un dispositivo físico externo). Esto es lo usual, con lo que los bancos complementan el sistema login/password. 

Otro esquema de ingreso es el de "dos pasos", con ingreso del código enviado a través de otro medio previamente proporcionado por el usuario (celular o correo electrónico, usualmente).

Otro esquema es el del "captcha" (una especie de "te atrapé") en el que se pide identifica caracteres escritos en una imagen o identificar imágenes con ciertas características de dentro de un conjunto presentado al usuario.

Para todos estos esquemas, desde el punto de vista del programador, aplican las recomendaciones dadas a las contraseñas.

### Encriptación
Una contraseña enviada por la red sin encriptar es suceptible de ser capturada.

Toda información enviada por la red es suceptible de ser capturada.

Edward Snowden, famoso por haber divulgado el como la NSA y en general, el gobierno de los Estados Unidos espía a sus ciudadanos, además de a los gobernantes de otros países, y que ahora vive refugiado en Rusia, en una entrevista con el astrofísico Neil DeGrasse-Tyson, mencionó una idea interesante: no podríamos detectar las comunicaciones de los extraterrestres, debido a que muy probablemente una civilización lo suficientemente avanzada sólo utilizaría comunicaciones encriptadas, y como cuando la encriptación es suficientemente buena, es prácticamente indistinguible de información aleatoria, esta "sonaría" igual que el ruido habitualmente encontrado en el espacio.

Por supuesto, la encriptación, a pesar de los modernos esquemas, donde se utiliza encriptación fuerte, únicamente en los primeros datagramas de la comunicación, y encriptación más débil, y por tanto rápida, pero dependiente de datagramas anteriores para el resto del contenido, de todos modos implican tiempo de procesamiento, lo cual puede ser tardado para equipos con poca potencia (algunos teléfonos o computadoras pequeñas o antiguas), además de que por lo general requiere de otros protocolos y esquemas tales como los "certificados", "encriptación de dos vías", los "handshakes", etc. Por ello todavía se utiliza sólo en ciertos sitios web, mientras que la mayoría de los sitios sigue transmitiendo información en texto plano ("plain text").

### Otros tipos de problemas de seguridad
El *sniffing* se caracteriza por echar a andar un programa que continuamente monitorea una red buscando información "interesante", incuyendo desde contraseñas hasta espionaje empresarial o personal.

El *phishing* es una técnica para el robo o captura de información, suplantando aparente o realmente los sitios web auténticos por programas de captura que se ven igual a los originales.

Un ejemplo burdo (inventado) sería poner en la dirección www.bancorner.com un sitio simulando ser www.bancomer.com.

Otra forma menos fácil de identificar, es la sustitución de servidores de nombres o el cambio de la tabla de búsqueda de los mismos (archivo `/etc/hosts`, en Windows `%SystemRoot%\System32\drivers\etc\hosts` y similares en otros sistemas) manualmente o mediante un virus o aplicación infectada. De esta manera, al intentar a los sitios habituales de información, se estaría "direccionando" a servidores espurios haciendo el phishing.

### Seguridad de sistemas
Muchos ataques son controlados construyendo la seguridad desde abajo.

Antes que nada, una máxima en temas de seguridad es que **no hay sistema 100% seguro**, sino sólo niveles de aseguramiento y facilidad de su implementación.

Hay sistemas como Windows, que por su naturaleza cerrada, en ocasiones hace muy dificil lograrles un buen nivel de aseguramiento, aún por expertos en el tema. Los sistemas de Apple, aunque también son cerrados, son basados en Unix, además de que solo se usan en plataformas propietarias.

En cierta ocasión se puso el reto en internet de *crackear* tres equipos puestos en ciertas direcciones ip intencionalmente, a fin de probar su nivel de seguridad. Un equipo con Windows, no recuerdo la versión, que ante su imposibilidad de responder las conexiones entrantes, se caía repetidamente. Cuando lo lograron reestablecer de manera que resistiera las conexiones, los ataques que no pudo contener eran abundantes y repetidos. El otro equipo con sistema Mac, no se cayó, pero luego de un tiempo, no resistió los ataques. El último sistema contenía Linux y, a pesar de proporcionarse la contraseña del super-usuario, no pudo ser penetrado.

Este ejemplo real, sólo muestra la facilidad con que los sistemas se pueden asegurar, y aunque las versiones han mejorado con el tiempo y hoy en día, es dificil aventurar un resultado en un reto similar, lo cierto es que la "apertura" en los sistemas ha demostrado ser una buena estrategia para mejorar su seguridad, por paradójico que esto suene.

La paradoja anterior se ilustra con otra máxima de estos temas que es **la seguridad por ocultamiento sólo dura mientras se pueda mantener el secreto**, y un secreto es dificil de mantener cuando muchas personas saben él. Ejemplo de esto son las llamadas "teorías de conspiración", practicamente todas falsas debido a la dificultad de mantener un secreto entre un grupo de gente grande, que supuestamente está ocupado en mantenerlo.

Por el contrario, en un sistema abierto, donde su funcionamiento es público, aún su técnica de encriptación, pero que todo ello dependa de una contraseña y de la seguridad de esta (esta si, oculta), hace que el sistema se revisable, auditable, corregible, mantenible, supervisable entre el equipo de desarrollo. Dándoles prácticamente todo su control, es fácil hacerle sentir a este equipo que el sistema es suyo, y por tanto, hacerlos precuparse por su seguridad.

## Estrategias y técnicas de desarrollo

Las medidas físicas de seguridad pasan por:

* asegurar un espacio exclusivo destinado a servidores, de preferencia con restricciones para su acceso
* procurar la autonomía de este espacio en cuanto a su temperatura, respaldo eléctrico y conexiones redundantes y de alta disponibilidad a la red destinada a su acceso
* separar los servidores con acceso únicamente interno de los que tienen acceso por internet
* separar los servidores en aquellos destinados a bases de datos, al almacenamiento, a páginas y servicios web, a aplicaciones específicas (científicas y de otro tipo), etc.
* Procurar el acceso a la administración restringido físicamente sólo desde ciertos equipos, y no desde el internet

En cuanto a las medidas lógicas, todo comienza con la elección y austera instalación del sistema operativo y software estrictamente requerido, de preferencia sin ambiente gráfico (el cual también es inherentemente inseguro) y con todas las medidas de seguridad conocidas, que sean posibles de implementar.

Hoy en día, un sistema es inseguro principalmente debido al desconocimiento de las medidas de seguridad existentes por parte de los administradores del sistema operativo, pero también mucha responsabilidad de esto recae en los desarrolladores o adaptadores de las aplicaciones locales, debido de nuevo, a la ignorancia de los posibles ataques a sus sistemas, y las medidas de seguridad existentes para prevenirlos.

Dr. Felipe Contreras - Nov. 2016