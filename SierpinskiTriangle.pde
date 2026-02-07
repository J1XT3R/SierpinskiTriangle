int minLen = 20;

public void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

public void draw() {
  background(18, 12, 22);
  float hueShift = (frameCount * 0.4) % 360;
  sierpinski(0, height, width, 0, hueShift);
}

public void mouseDragged() {
  minLen = constrain(minLen + (mouseX - pmouseX), 4, 120);
}

public void sierpinski(int x, int y, int len, int depth, float hueShift) {
  if (len <= minLen) {
    float h = (hueShift + depth * 28) % 360;
    float s = 75 + depth * 2;
    float b = 85 - depth * 3;
    fill(h, constrain(s, 0, 100), constrain(b, 30, 100));
    triangle(x, y, x + len, y, x + len/2, y - len);
  } else {
    sierpinski(x, y, len/2, depth + 1, hueShift);
    sierpinski(x + len/2, y, len/2, depth + 1, hueShift);
    sierpinski(x + len/4, y - len/2, len/2, depth + 1, hueShift);
  }
}
