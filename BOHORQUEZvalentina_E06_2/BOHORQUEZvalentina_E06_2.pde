// Valentina Bohorquez
// Ejercicio E06. - Secuencia de escenas: Toy Story

PImage escena1, escena2, escena3, escena4; //almacena las imagenes de las distintas escenas
int momentoActual = 1; //controla en qeu escena esta el usuario
Escena escena;//crea un objeto de la clase escena (que define cmoo mostrar una escena)

PImage sombrero;
float sombreroX = 390; //controlan la posicion y rotacion del sombrero
float sombreroY = 130; //indica si el sombrero uan esta cayendo
float sombreroRotacion = 235;
boolean sombreroCayendo = true;

color fondoActual = color(255); // Fondo blanco inicial 

// Ahota, se define el tamaño de la ventana
// Se cargan las imagenes
// Se crea el objeto escena
// Se ajusta la posicion horizontal inicial del sombrero sobre la cabeza de Woody

void setup() {
  size(800, 600);

  escena1 = loadImage("escena1.jpg");
  escena2 = loadImage("escena2.jpg");
  escena3 = loadImage("escena3.jpg");
  escena4 = loadImage("escena4.jpg");
  sombrero = loadImage("escena1sombrero.png");

  escena = new Escena();

  // Posicion inicial centrada sobre la cabeza de Woody
  sombreroX = width / 2 - 110;
}



void draw() {
  background(fondoActual); // Usamos la variable para el fondo

  // Recalcula la posicion X solo si se esta reiniciando
  if (momentoActual == 1 && sombreroY == 0) {
    sombreroX = width / 2 - 110;
  }

  if (momentoActual == 1) {
    imageMode(CENTER);
    image(escena1, width / 2, height / 2 - 50, 600, 350);

    // Animación del sombrero
    pushMatrix();
    translate(sombreroX, sombreroY);
    rotate(radians(sombreroRotacion));
    imageMode(CENTER);
    image(sombrero, 100, 20, 550, 450);
    popMatrix();

    fill(0);
    textAlign(CENTER);
    textSize(18);
    text("Andy está jugando con Woody", width / 2, 500);
    textSize(14);
    text("Presiona la tecla 2 para continuar", width / 2, 530);
  }

// Usa la clase escena para mostrar la imagen correspondiente y sus textos
  else if (momentoActual == 2) {
    escena.mostrar(escena2, "Buzz llega y Woody se pone celoso", "Presiona la tecla 3 para continuar");
  } else if (momentoActual == 3) {
    escena.mostrar(escena3, "Buzz y Woody se pierden", "Presiona la tecla 4 para continuar");
  } else if (momentoActual == 4) {
    escena.mostrar(escena4, "Woody y Buzz se reconcilian", "Presiona la tecla 1 para volver al inicio");
  }

  // Hace que el sombrero "caiga" con rotacion hasta llegar a la cabeza de Woody
  if (momentoActual == 1 && sombreroCayendo) {
    sombreroY += 4;
    sombreroRotacion += 5;

    if (sombreroY >= 235) {
      sombreroY = 235;
      sombreroCayendo = false;
    }
  }
}

void keyPressed() {
  if (key == '2' && momentoActual == 1) {
    momentoActual = 2;
  } else if (key == '3' && momentoActual == 2) {
    momentoActual = 3;
  } else if (key == '4' && momentoActual == 3) {
    momentoActual = 4;
  } else if (key == '1' && momentoActual == 4) {
    momentoActual = 1;
    sombreroY = 130;
    sombreroRotacion = 235;
    sombreroCayendo = true;
  }
}

// Si se hace clic, vuelve a la escena 1 y reinicia la animacion del sombrero
void mousePressed() {
  momentoActual = 1;
  sombreroY = 130;
  sombreroRotacion = 235;
  sombreroCayendo = true;
}

// Cada vez que se mueve el mouse, el fondo cambia a un color aleatorio
void mouseMoved() {
  fondoActual = color(random(255), random(255), random(255));
  cursor(HAND);

// Dibuja un circulo semitransparente rosa donde pasa el cursor
  // Dibuja un cicrulo donde pasa el mouse
  fill(255, 100, 100, 150); 
  noStroke();
  ellipse(mouseX, mouseY, 20, 20);
  
// Muestra un texto que sigue al cursor
  // Muestra el texto que sigue al cursor
  fill(0);
  textSize(14);
  text("te seguimos", mouseX + 10, mouseY - 10);

  // Cambiar el cursor
  cursor(HAND);
}

// Define como mostrar cada escena con su imagen, descripcion y texto de instruccion
class Escena {
  void mostrar(PImage img, String descripcion, String instruccion) {
    imageMode(CENTER);
    image(img, width / 2, height / 2 - 50, 600, 350);
    fill(0);
    textAlign(CENTER);
    textSize(18);
    text(descripcion, width / 2, 500);
    textSize(14);
    text(instruccion, width / 2, 530);
  }
}
