import gab.opencv.*;
import processing.video.*;

Capture video;

void setup() 
{
  size(960, 540);
  frameRate(30);
 
  video = new Capture(this, width, height);
  video.start();
}

void update()
{
  if ( video.available() )
  {
    video.read();
  }  
}

void draw() 
{
  update();
  
  set(0,0, video);
}