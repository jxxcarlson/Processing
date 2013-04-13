
class JCFrame {

  // Geometry of frame
  float x, y;
  float w, h;
  
  float speed;
  
  // Color of frame
  float r, g, b, a;
  float dr, dg, db, da;// change in color
  
  Particle [] particles;
  
  int phase;  // numbrer of frames before staring
  float spacingFactor;


  // Constructor: parameters define frame, number of particles,
  // and drawing scale.  default values are set for other fields.
  JCFrame(float xx, float yy, float ww, float hh, int n, float scale, float spacingFactor_) {

    // Geometry of frame
    x = xx; 
    y = yy;
    w = ww; 
    h = hh;

    // Default color of frame
    r = random(100,200);
    g = random(100,200);
    b = random(100,200);                                                                                                                                                                                        

    // Change of color of frame
    dr = random(-1,1);
    dg = random(-1,1);
    db = random(-1,1);
    da = random(-1,1);

    speed = 0.1; // 0.01;
    
    particles = new Particle[n];
    spacingFactor = spacingFactor_;

    
    for (int i = 0; i < particles.length; i++) {
      
      // Create new paricle with motion constrained to 
      // the frame (x, y, x + w, y + h)
      particles[i] = new Particle(x, y, x + w, y + h);
      
      // Put particle at center of frame
      particles[i].x = x + w/2;
      particles[i].y = y + h/2;
      
      // Adjust particle parameters for the drawing scale;
      particles[i].radius = scale*particles[i].radius;
      particles[i].xspeed = scale*particles[i].xspeed;
      particles[i].yspeed = scale*particles[i].yspeed;
      particles[i].cspeed = scale*particles[i].cspeed;
      particles[i].rspeed = scale*0.5; // scale*particles[i].rspeed;
      particles[i].spacingFactor = spacingFactor;
      
    }
  }

  void changeColor(float A) {

    r = r + speed*dr;
    g = g + speed*dg;
    b = b + speed*db;
    a = a + speed*da;
    
    if (r < 0) { 
      r = 255;
    }
    if (r > 255) { 
      r = 0;
    } 

    if (g < 0) { 
      g = 255;
    }
    if (g > 255) { 
      g = 0;
    }

    if (b < 0) { 
      b = 255;
    }
    if (b > 255) { 
      b = 0;
    }

    if (a > A) { 
      a = 0;
    }
    
  }
  
  void setColor(float rr, float gg, float bb, float aa) {
    r = rr; g = gg; b = bb; g = gg; a = aa;
  }
  
  void randomSetColor() {
    setColor(random(255), random(255), random(255), random(255));
  }
  
  void setDColor(float rr, float gg, float bb, float aa) {
    dr = rr; dg = gg; db = bb; dg = gg; da = aa;
  }

  void change(float A) {
    
    changeColor(A);
    
  }

  void display(float M) {

  
      fill(r,g,b,a);
      // noStroke();
      stroke(0);
      rectMode(NORMAL);
      rect(x, y, x + w, y + h);
      
   if (frameCount > phase) {
      for(int i = 0; i < particles.length; i++) {
        particles[i].change(M);  // M = maximum particle radius
        particles[i].display();
    
      }
    }
   
  }
}
