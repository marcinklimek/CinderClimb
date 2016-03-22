import gab.opencv.*;
import org.opencv.imgproc.Imgproc;

OpenCV opencv;

PImage src, bkg, diffed;

final static int W = 960;
final static int H = 540;

int threshold = 55;

PImage getGrayImage(String fileName)
{
  OpenCV cv = new OpenCV(this, loadImage(fileName));
  cv.gray();
      
  PImage img = cv.getSnapshot();
  img.resize(W/2, H/2);
  
  return img;
}

void setup() 
{
  size(960, 540);

  opencv = new OpenCV(this, W/2, H/2);
  opencv.gray();

  bkg = getGrayImage("frame-bkg.jpg");
  src = getGrayImage("frame-reka-na-tle.jpg");
 
  opencv.loadImage( src );
  opencv.diff(bkg);
  opencv.blur(5);
  opencv.contrast(1.8);
  
  diffed = opencv.getSnapshot();
  
  image(bkg, 0, 0);
  image(diffed, W/2, 0);
  
  opencv.threshold(threshold);
  
  image(opencv.getSnapshot(), 0, H/2);

  opencv.erode();
  opencv.dilate();

  
  opencv.dilate();
  opencv.dilate();
  opencv.dilate();
  opencv.dilate();

 
  opencv.dilate();
  opencv.erode();

  image(opencv.getSnapshot(), W/2, H/2);

  noLoop();
}