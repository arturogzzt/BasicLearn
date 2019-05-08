# BasicLearn 

## Manual de usuario

### Tipos 
BasicLearn tiene los siguientes tipos de dato
* Number
* Decimal
* Bool
* Sentence

### Operaciones
Las operaciones que se pueden realizar en BasicLearn son las siguientes
`+, -, *, /, >, <, >=, <=, equal, notEqual`

### Hello world
La estructura del programa inicia con `program` y el nombre del programa.
La función principal de BasicLearn es start. 
Las declaraciones globales se hacen afuera de todas las funciones.
Para asignarlas debe ser adentro de una función.
```
program myProgram;

sentence hello;

start {
    hello = "Hello World!";
    show(hello);
}
```

### Listas

### Funciones, condiciones y ciclos
Las funciones pueden ser void, o cualquier tipo de dato.
Existen dos tipos de ciclos `while` y `repeat`  
Para las condiciones utilizamos `if` y `else`  

```
program factorialRec;

number n, r, prev;

number function factorial(number n) {

    if (n equal 0) {
        return 1;
    }

    prev = factorial(n-1);

    return n * prev;
}

start {
    n = 5;
    r = factorial(n);
    show(r);
}
```

### Funciones especiales
BasicLearn además cuenta con algunas funciones útiles para personas que están aprendiendo a programar:
Área de un cuadrado: `areaSq`
Área de un tríangulo: `areaTri`
Permímetro de un triángulo: `perimTri`
Raíz cuadrada: `square_root`
Valor absoluto: `absolute`
Hipotenusa: `pythagorasHyp`
Entre otras...
