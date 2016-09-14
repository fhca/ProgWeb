[13 de sep]
Ya jaló el [vista.jsp](vista.jsp) del proyecto `sumadora.war`. El código fuente mejorado es el que se muestra directo (fuera del war). Era un poco mas sencillo de lo que pensabamos. El punto es hacer las operaciones antes de imprimir el HTML y nos evitamos varias cosas.

El programa funciona así:

1. Se piden los dos números (`valor` es un arreglo con los dos valores), como apenas se están pidiendo, el request no los conoce, así devuelve null y no hace nada del if y se imprime una historia vacía
2. Cuando se envía, el mismo jsp recibe los dos valores y ahora si entra al if.
3. Se obtienen operador y el acumulado de la historia (null la 1a vez, pero se reemplaza de nuevo por "" para que no se imprima la palabra `null`)
4. Se procesan como floats los dos valores y se operan, dependiendo de lo recibido por `operador`
5. Se incrementa la historia con el nuevo resultado
6. Todo lo anterior se hace antes de imprimir de nuevo el cuadro de la historia y los campos para los valores
7. Así la historia se imprime con la primera operación introducida y se incrementa con cada nueva operación.
8. Se puede hacer scroll para ver los valores anteriores. Decidí que lo nuevo se agregue hasta arriba, pues al menos en mi caso, al agregar lo nuevo al final se tiene que hacer scroll para verlo.
9. Todavía no está a prueba de cualquier error, por ejemplo, si no se teclea alguno de los valores.
10. ¿Cómo harías una calculadora más parecida a las físicas?, donde se construye el número con cada cifra y dá el resultado al presionar "="?