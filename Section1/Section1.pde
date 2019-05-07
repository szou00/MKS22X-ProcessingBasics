import java.util.Random;

int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Random rand = new Random();
  int variable = rand.nextInt(40)+1;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[variable];
    speeds = new float[variable];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  
  void display() {
    float width = 400.0/values.length;
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    for (int i = 0; i<values.length; i++) {
      if (values[i] < 0 && values[i] > -50) {
        fill(255,255,153); //yellow
        rect(x+width*i, y+(100-values[i]*-1), width, values[i]*-1);
      }
      if (values[i] <= -50) {
        fill(0,255,51); //green
        rect(x+width*i, y+(100-values[i]*-1), width, values[i]*-1);
      }
      if (values[i] > 0 && values[i] <= 50) { 
        fill(255,255,153);
        fill(255,153,0); //orange
        rect(x+width*i, y+100, width, values[i]);
      }
      if (values[i] > 50) {
        fill(255,0,0); //red
        rect(x+width*i, y+100, width, values[i]);
      }
    }


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if (values[i] > MAX_VALUE) {
        values[i] = MAX_VALUE;
      }
      if (values[i] < MIN_VALUE) {
        values[i] = MIN_VALUE;
      }
      display();
      
      if (values[i] == MAX_VALUE || values[i] == MIN_VALUE) {
        speeds[i] = speeds[i] * -1;
      }
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
