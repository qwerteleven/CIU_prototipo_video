
import processing.video.*;
import cvimage.*;
import org.opencv.core.*;
import org.opencv.core.Core;
import org.opencv.dnn.*;

String[] models = {"Fire_Style.t7", "flame_style.t7", "gold_black.t7", "landscape.t7",  "pink_style.t7",
  "rain_style.t7", "triangle_style.t7", "la_muse.t7", "composition_vii.t7", "starry_night.t7", "the_wave.t7",
  "candy.t7", "feathers.t7", "mosaic.t7", "the_scream.t7", "udnie.t7"};

int n_model = 0;
final int W = 1024, H = 720;
Capture cap;
String model;
Net net;
Mat mean;

public void settings() {
  size(W, H);
}

void keyPressed() {
  if (key == ENTER) {
        n_model ++;
        n_model = n_model % models.length;
        makeModel();
      
    }
}
void makeModel() {
  model = models[n_model]; 
  
  /**
    Posible models
  
  "Fire_Style.t7" "flame_style.t7" "gold_black.t7" "landscape.t7"  "pink_style.t7" "rain_style.t7" "triangle_style.t7"
  "la_muse.t7" "composition_vii.t7" "starry_night.t7" "the_wave.t7" "candy.t7" "feathers.t7" "mosaic.t7" "the_scream.t7"
  "udnie.t7"
  */
  
  mean = new Mat(H, W, CvType.CV_8UC3, new Scalar(103.939, 116.779, 123.68));
  net = Dnn.readNetFromTorch(dataPath(model));
  net.setPreferableBackend(Dnn.DNN_BACKEND_CUDA);
  net.setPreferableTarget(Dnn.DNN_TARGET_CUDA);
  
}

public void setup() {
  frameRate(30);
  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  println(Core.VERSION);  
  while (this == null) {
    delay(5);
  }
  
  cap = new Capture(this, W, H);
  cap.start();
  makeModel();
  
}

public void draw() {
  if (!cap.available()) 
    return;
  background(0);
  cap.read();
  CVImage cv = new CVImage(cap.width, cap.height);
  cv.copyTo(cap);
  Mat im = Dnn.blobFromImage(cv.getBGR(), 1.0, 
    new Size(cap.width, cap.height), 
    new Scalar(103.939, 116.779, 123.68), 
    false, false);
  net.setInput(im);
  Mat out = net.forward();

  Mat b = out.col(0).reshape(1, 720);
  Mat g = out.col(1).reshape(1, 720);
  Mat r = out.col(2).reshape(1, 720);

  Mat tmp = new Mat(r.size(), CvType.CV_8UC3);
  b.convertTo(b, CvType.CV_8UC1);
  g.convertTo(g, CvType.CV_8UC1);
  r.convertTo(r, CvType.CV_8UC1);
  ArrayList<Mat> chan = new ArrayList<Mat>();
  chan.add(b);
  chan.add(g);
  chan.add(r);
  Core.merge(chan, tmp);
  Core.add(tmp, mean, tmp);
  cv.copyTo(tmp);
  image(cv, 0, 0);
  b.release();
  g.release();
  r.release();
  tmp.release();
  out.release();
  im.release();
}
