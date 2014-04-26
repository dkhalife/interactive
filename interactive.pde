import java.awt.event.*;

PImage img;
int radius;

void setup(){
   size(262,192);
   img = loadImage("images.jpg");
   radius = 5;
   addMouseWheelListener(new MouseWheelListener() { 
    public void mouseWheelMoved(MouseWheelEvent mwe) { 
      mouseWheel(mwe.getWheelRotation());
  }});
}

void draw() {
  background(255);
  loadPixels();
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  
  for (int y = 0; y < 192; y++) {
    for (int x = 0; x < 262; x++) {
      int loc = x + y*262;
      
      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      float dist = dist(x,y,mouseX,mouseY);
      float bright = (radius-dist)/radius;          
      r *= bright;
      g *= bright;
      b *= bright;
      
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      
      int out = x + y * width;
      pixels[out] = color(r,g,b);
    }
  }
  updatePixels();
}

void mouseWheel(int delta){
  radius += -delta;
  
  radius = constrain(radius, 0, 200);
}
