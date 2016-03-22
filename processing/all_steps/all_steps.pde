import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;
PImage src, bkg, thresh, dilated, eroded, diff, both;

final static int W = 960;
final static int H = 540;


void setup() 
{
  size(1440, 540);
  frameRate(30);

  opencv = new OpenCV(this, W, H);

  video = new Capture(this, W, H);
  video.start();
}

void update()
{
  if ( video.available() )
  {
    video.read();
    
    // pierwsza klatka traktowana jest jako tło
    if ( bkg == null )
      bkg = video.copy();
    
    opencv.loadImage(video);
    src = opencv.getSnapshot();
    
    opencv.diff(bkg);
    opencv.blur(10);
  
    diff = opencv.getSnapshot();
    opencv.threshold(50);
    
    thresh = opencv.getSnapshot();
  
    opencv.erode();
    eroded = opencv.getSnapshot();

    opencv.loadImage(thresh);
    opencv.dilate();
    dilated = opencv.getSnapshot();
    
    opencv.loadImage(thresh);
    
    //opening
    opencv.erode();
    opencv.dilate(); 
    
    opencv.dilate(); 
    opencv.dilate(); 
    
    //closing
    opencv.dilate();    
    opencv.erode();

    both = opencv.getSnapshot();
  }
}

void draw() 
{
  update();

  if (src == null)
    return;
    
  image(bkg,       0,   0, W/2, H/2);
  image(src,     W/2,   0, W/2, H/2);
  image(diff,      W,   0, W/2, H/2);
  image(eroded,    0, H/2, W/2, H/2);
  image(dilated, W/2, H/2, W/2, H/2);
  image(both,      W, H/2, W/2, H/2);

  fill(255, 0, 0);
  text("bkg",       0 + 10,   0 + 10);
  text("src",     W/2 + 10,   0 + 10);
  text("diff",      W + 10,   0 + 10);
  text("eroded",    0 + 10, H/2 + 10);
  text("dilated", W/2 + 10, H/2 + 10);
  text("both",      W + 10, H/2 + 10);
}