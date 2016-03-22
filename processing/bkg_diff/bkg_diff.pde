import gab.opencv.*;
import org.opencv.imgproc.Imgproc;

final static int W = 960;
final static int H = 540;
final static int W2 = W/2;
final static int H2 = H/2;

OpenCV opencv;

PImage imageWithHand; 
PImage background; 
PImage diffedImage;

PImage getGrayImage(String fileName)
{
  OpenCV cv = new OpenCV(this, loadImage(fileName));
  cv.gray();
      
  PImage img = cv.getSnapshot();
  img.resize(W2, H2);
  
  return img;
}

void setup() 
{
  size(960, 540);

  opencv = new OpenCV(this, W2, H2);
  opencv.gray();

  background = getGrayImage("frame-bkg.jpg");
  imageWithHand = getGrayImage("frame-reka-na-tle.jpg");
 
  opencv.loadImage( imageWithHand );
  opencv.diff(background);
  
  diffedImage = opencv.getSnapshot();

  image(background, 0, 0);
  image(diffedImage, W2, 0);
  
  opencv.threshold(50);
  image(opencv.getSnapshot(), 0, H2);
  
  opencv.loadImage( diffedImage );
  opencv.threshold(60);
  image(opencv.getSnapshot(), W2, H2);

  noLoop();
}