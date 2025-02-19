int numRows = 8;  // Number of rows of faces
int numCols = 8;  // Number of columns of faces
int faceSize = 50; // Size of each face
int total;        // Total value of all expressions
PImage f1, f2, f3, f4, f5;
String[] vibe = {"Excellent", "Good", "Fine", "Bit rough", "Terrible"};
String vibeReport;

void setup() {
    size(600, 600);  // Set window size
    noLoop();        // Ensures draw() only runs once

    f1 = loadImage("1.png");
    f2 = loadImage("2.png");
    f3 = loadImage("3.png");
    f4 = loadImage("4.png");
    f5 = loadImage("5.png");

    // Debugging: Check if images loaded
    if (f1 == null) println("Error loading 1.png");
    if (f2 == null) println("Error loading 2.png");
    if (f3 == null) println("Error loading 3.png");
    if (f4 == null) println("Error loading 4.png");
    if (f5 == null) println("Error loading 5.png");
}

void draw() {
    background(0);  // Black background
    total = 0;      // Reset total for each draw
    vibeReport = "";

    // Generate and display faces directly
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j < numCols; j++) {
            Face face = new Face(j * faceSize + 100, i * faceSize + 100);
            face.roll();
            face.show();
            total += face.getValue();
        }
    }

    fill(255);
    textSize(24);

    // Assign correct vibe level
    if (total < 180) {
        vibeReport = vibe[0]; // Excellent
    } else if (total <= 195) {
        vibeReport = vibe[1]; // Good
    } else if (total <= 205) {
        vibeReport = vibe[2]; // Fine
    } else if (total <= 210) {
        vibeReport = vibe[3]; // Bit rough
    } else {
        vibeReport = vibe[4]; // Terrible
    }

    text("The average class vibe is: " + vibeReport, 100, 60);
}

void mousePressed() {
    redraw(); // Reset face expression when the mouse is pressed
}

class Face {
    int x, y, value;

    Face(int x, int y) {
        // The "this" keyword distinguishes instance variables from parameters with the same name
        this.x = x;
        this.y = y;
    }

    void roll() {
        value = (int) (Math.random() * 5) + 1; // Generate random value from 1 to 5
    }

    void show() {
        PImage img = null;
        if (value == 1) img = f1;
        else if (value == 2) img = f2;
        else if (value == 3) img = f3;
        else if (value == 4) img = f4;
        else if (value == 5) img = f5;
        
        if (img != null) {
            image(img, x, y, faceSize, faceSize);
        }
    }

    int getValue() {
        return value;
    }
}
