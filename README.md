# Analizador Léxico y Sintáctico en Java (JFlex & CUP)

Proyecto desarrollado para la materia **Teoría de la Computación**. Consiste en un compilador frontend capaz de realizar análisis léxico y sintáctico sobre un lenguaje imperativo personalizado, generando una tabla de símbolos y mostrando el proceso de parsing mediante una interfaz gráfica.

El sistema cuenta con una **Interfaz Gráfica de Usuario (GUI)** interactiva que facilita la carga de archivos fuente, el análisis en tiempo real y la exportación de resultados.

---

## 🚀 Características Principales

- **Análisis Léxico (Lexer)**:
  - Desarrollado con **JFlex**.
  - Reconoce palabras clave (`IF`, `ELSE`, `FOR`, `REPEAT`, `UNTIL`, `PROGRAM.SECTION`, `DECVAR`, `ENDDECVAR`, `show`).
  - Procesa tipos de datos (`INT`, `FLOAT`, `STRING`).
  - Reconoce constantes:
    - Enteras (`CONST_INT`).
    - Decimales (`CONST_FLOAT`), soportando formatos como `.99` y `99.`.
    - Hexadecimales (`CONST_HEX`), prefijadas con `0h` (ej. `0hFF`, `0hA3F`).
    - Cadenas de caracteres (`CONST_STR`) delimitadas por comillas dobles.
  - Soporte para **comentarios anidados** delimitados por `$*` y `*$`.

- **Análisis Sintáctico (Parser)**:
  - Desarrollado con **CUP** (LALR Parser Generator).
  - Valida la estructura gramatical del programa.
  - Implementa recuperación básica de errores e indica la línea y columna exactas donde ocurre cualquier fallo sintáctico.
  - Muestra la trazabilidad de las reglas de producción aplicadas durante el parsing de manera amigable en la GUI.

- **Tabla de Símbolos (Symbol Table)**:
  - Implementada mediante el patrón **Singleton**.
  - Recolecta todos los identificadores y constantes reconocidos.
  - Traduce valores hexadecimales a su equivalente decimal automáticamente en el reporte.
  - Exporta los resultados en un archivo con formato tabulado legible: [tabla_simbolos.txt](src/tabla_simbolos.txt).

- **Interfaz Gráfica (GUI)**:
  - Diseñada con **Java Swing**.
  - Panel para escribir o editar código directamente.
  - Botón para cargar archivos de prueba directamente desde el disco.
  - Visor en tiempo real del flujo de tokens léxicos.
  - Consola sintáctica dedicada para el seguimiento del árbol de derivación y reporte de errores.
  - Indicadores visuales de éxito/error de compilación mediante colores (Verde/Rojo).

---

## 🛠️ Stack Tecnológico

- **Lenguaje de Programación**: Java (JDK 8 o superior)
- **Generador de Analizador Léxico**: [JFlex](https://jflex.de/) (v1.9.1)
- **Generador de Analizador Sintáctico**: [CUP](http://www2.cs.tum.edu/projects/cup/) (v11b)
- **Biblioteca GUI**: Java Swing
- **Herramienta de Construcción / IDE**: Compatible con IntelliJ IDEA (incluye configuración de módulos `.iml`) y línea de comandos (CLI)

---

## 📥 Guía de Instalación y Ejecución "Paso a Paso"

### Requisitos Previos
Asegúrate de tener instalado el **Java Development Kit (JDK)** en tu sistema (versión 8 o superior, se recomienda JDK 11 o posterior) y de que la variable de entorno `JAVA_HOME` esté configurada, con la herramienta `java` e `javac` disponibles en tu terminal.

---

### Opción A: Ejecución Rápida desde la Terminal (CLI)

1. **Clonar el Repositorio**:
   ```bash
   git clone https://github.com/tu-usuario/AnalizadorLexicografico.git
   cd AnalizadorLexicografico
   ```

2. **Compilar el Proyecto**:
   Crea la carpeta de salida `out` y compila todos los archivos `.java` en el directorio `src/` incluyendo los JARs necesarios en el *classpath*:
   - **En Windows (PowerShell / CMD)**:
     ```powershell
     mkdir out
     javac -cp ".;java-cup-11b-runtime.jar;java-cup-11b.jar;jflex-full-1.9.1.jar" src/*.java -d out
     ```
   - **En Linux / macOS**:
     ```bash
     mkdir -p out
     javac -cp ".:java-cup-11b-runtime.jar:java-cup-11b.jar:jflex-full-1.9.1.jar" src/*.java -d out
     ```

3. **Ejecutar la Aplicación**:
   Lanza la clase principal `AnalizadorLexicografico` utilizando la carpeta compilada y las librerías:
   - **En Windows**:
     ```powershell
     java -cp "out;java-cup-11b-runtime.jar;java-cup-11b.jar;jflex-full-1.9.1.jar" AnalizadorLexicografico
     ```
   - **En Linux / macOS**:
     ```bash
     java -cp "out:java-cup-11b-runtime.jar:java-cup-11b.jar:jflex-full-1.9.1.jar" AnalizadorLexicografico
     ```

---

### Opción B: Configuración en IntelliJ IDEA (Recomendado)

1. Abre **IntelliJ IDEA**.
2. Selecciona **File -> Open...** y elige el directorio raíz del proyecto (`AnalizadorLexicografico`). El IDE detectará automáticamente el archivo de módulo `AnalizadorLexicografico.iml`.
3. Configura el SDK del proyecto (Java 8 o superior) en **File -> Project Structure -> Project**.
4. Agrega los JARs como librerías del proyecto:
   - Ve a **File -> Project Structure -> Libraries**.
   - Haz clic en el botón `+` (New Project Library) -> **Java**.
   - Selecciona los archivos `java-cup-11b.jar`, `java-cup-11b-runtime.jar` y `jflex-full-1.9.1.jar` de la raíz del proyecto.
   - Aplica los cambios.
5. Abre la clase `AnalizadorLexicografico.java` ubicada en `src/` y haz clic en el botón **Run (Play)** al lado del método `main`.

---

## 🔄 Cómo Regenerar el Léxico y Sintáctico (Opcional)

Si deseas realizar modificaciones en las reglas léxicas (`Lexico.flex`) o en la gramática sintáctica (`Sintactico.cup`), puedes regenerar las clases de Java correspondientes ejecutando los siguientes comandos desde la raíz del proyecto:

1. **Regenerar el Analizador Sintáctico (CUP)**:
   ```bash
   java -jar java-cup-11b.jar -destdir src/ -parser Sintactico -symbols sym src/Sintactico.cup
   ```
   *Esto generará `Sintactico.java` y `sym.java` directamente dentro de la carpeta `src/`.*

2. **Regenerar el Analizador Léxico (JFlex)**:
   ```bash
   java -jar jflex-full-1.9.1.jar -d src/ src/Lexico.flex
   ```
   *Esto generará `Lexico.java` dentro de la carpeta `src/`.*

---

## 📝 Ejemplo de Código Soportado

Puedes probar el analizador utilizando el archivo de pruebas completo [pruebacompleta.txt](src/pruebacompleta.txt) que se encuentra en el proyecto:

```pascal
$* SECCIÓN DE DECLARACIONES *$
DECVAR
    numero : INT
    a1 : FLOAT
    texto : STRING
    hexVar : INT
ENDDECVAR

$* SECCIÓN PRINCIPAL DEL PROGRAMA *$
PROGRAM.SECTION
    numero = 2
    a1 = 25.75
    texto = "Hola Mundo"
    hexVar = 0hFF  $* Representa 255 en decimal *$

    $* Estructura iterativa FOR *$
    FOR al IS RANGE [numero * 2] {STEP 2}
        numero = numero + 1
    NEXT al

    $* Estructura condicional IF-ELSE *$
    IF (numero > 5)
        show "Mayor a 5"
    ELSE
        show "Menor o igual a 5"
    ENDIF

    $* Estructura REPEAT-UNTIL *$
    REPEAT
        numero = numero - 1
    UNTIL (numero <= 0)
ENDPROGRAM.SECTION
```
