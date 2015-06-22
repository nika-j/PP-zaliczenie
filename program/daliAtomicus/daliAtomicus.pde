// Dali Atomicus - Praca zaliczeniowa
String[] imagesList = {"images/1.jpg", "images/2.jpg", "images/3.jpg",
"images/4.jpg", "images/5.jpg", "images/6.jpg", "images/7.jpg",
"images/8.jpg", "images/9.jpg", "images/10.jpg"};
PImage img;
PFont f;
int first = 0;

void setup() {
  size(460, 369);
  background(200);
  frameRate(30);
  f = createFont("Arial",20,true);
  fill(0);
  textFont(f);
  text("W pracy wykorzystano fotografię", 20, 100);
  text("Dali Atomicus Philipa Halsmana",20, 140);
  text("w różnych wersjach oraz wariacje na jej",20, 180);
  text("temat stworzone przez innych artystów", 20, 220);
  text("K. J.", 30, 300);
}

void draw() {

  if (mousePressed)
  {
     loadRandomImage(); 
     if ( first == 0 )
     {
       first = 1;
     }
  }
  
  if ( first > 2 )
  {
    torch();
    updatePixels();
  }
  
}

void loadRandomImage()
{
  int index = int(random(imagesList.length));  // Pobierz losowy obrazek
  img = loadImage(imagesList[index]);
  img.loadPixels();
  loadPixels(); 
}

void torch() {
 for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      float r,g,b;
      
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      
      float maxdist = 50;
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;

      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;

      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      color c = color(r, g, b);

      pixels[y*width + x] = c;
    }
  }  
}
