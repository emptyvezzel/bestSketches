List<Polygon> polys = new ArrayList<Polygon>();

float angle = 0;
float delta = 10;
float speed = 1.0;
int changeVar = 1;
int inc = 100;

void setup() {
  size(800, 800);
  //angleMode(DEGREES);
  background(51);
  for (int x = 0; x < width; x += inc) {
    for (int y = 0; y < height; y += inc) {
      Polygon poly = new Polygon();
      poly.addVertex(x, y);
      poly.addVertex(x + inc, y);
      poly.addVertex(x + inc, y + inc);
      poly.addVertex(x, y + inc);
      poly.close();
      polys.add(poly);
    }
  }
}

void draw() {
  background(0);
  angle += speed*changeVar;
  if (angle > 220 || angle < -40) changeVar*=-1;
  delta = 5.0;
  //println(angle, delta);
  for (int i = 0; i < polys.size(); i++) {
    polys.get(i).hankin();
    polys.get(i).show();
  }
}

class Edge {
  PVector a;
  PVector b;
  Hankin h1 = null;
  Hankin h2 = null;

  Edge(PVector a_, PVector b_) {
    a = a_;
    b = b_;
  }

  void show() {
    stroke(255, 50);
    //line(a.x, a.y, b.x, b.y);
    h1.show();
    h2.show();
  }

  void hankin() {
    PVector mid = PVector.add(a, b);
    mid.mult(0.5);

    PVector v1 = PVector.sub(a, mid);
    PVector v2 = PVector.sub(b, mid);
    PVector offset1 = mid;
    PVector offset2 = mid;
    if (delta > 0) {
      v1.setMag(delta);
      v2.setMag(delta);
      offset1 = PVector.add(mid, v2);
      offset2 = PVector.add(mid, v1);
    }

    v1.normalize();
    v2.normalize();

    v1.rotate(radians(-angle));
    v2.rotate(radians(angle));

    h1 = new Hankin(offset1, v1);
    h2 = new Hankin(offset2, v2);
  }

  void findEnds(Edge edge) {
    h1.findEnd(edge.h1);
    h1.findEnd(edge.h2);
    h2.findEnd(edge.h1);
    h2.findEnd(edge.h2);
  }
};

class Hankin {
  PVector a;
  PVector v;
  PVector b;
  PVector end = null;
  float prevD;

  Hankin(PVector a_, PVector v_) {
    a = a_;
    v = v_;
    b = PVector.add(a, v);
  }

  void show() {
    stroke(255, 0, 255);
    line(a.x, a.y, end.x, end.y);
    // fill(255);
    // ellipse(this.a.x, this.a.y, 8);
    // if (this.end) {
    //   fill(255, 255, 0);
    //   ellipse(this.end.x, this.end.y, 8);
    // }
  }

  void findEnd(Hankin other) {
    // line line intersection???
    // this.a, this.v  (P1, P2-P1)
    // other.a, other.v (P3, P4-P3)

    // From: http://paulbourke.net/geometry/pointlineplane/
    float den = (other.v.y * v.x) - (other.v.x * v.y);
    //if (!den) {
    //  return;
    //}
    if (den == 0.0) {
      return;
    }
    float numa = (other.v.x * (this.a.y - other.a.y)) - (other.v.y * (this.a.x - other.a.x));
    float numb = (this.v.x * (this.a.y - other.a.y)) - (this.v.y * (this.a.x - other.a.x));
    float ua = numa / den;
    float ub = numb / den;
    float x = this.a.x + (ua * this.v.x);
    float y = this.a.y + (ua * this.v.y);

    if (ua > 0 && ub > 0) {
      PVector candidate = new PVector(x, y);
      float d1 = PVector.dist(candidate, this.a);
      float d2 = PVector.dist(candidate, other.a);
      float d = d1 + d2;
      float diff = abs(d1 - d2);
      if (diff < 0.001) {
        if (end == null) {
          end = candidate;
          prevD = d;
        } else if (d < this.prevD) {
          prevD = d;
          end = candidate;
        }
      }
    }
  }
};

import java.util.*;

class Polygon {
  List<PVector> vertices = new ArrayList<PVector>();
  List<Edge> edges = new ArrayList<Edge>();

  Polygon() {
  }

  void addVertex(float x, float y) {
    PVector a = new PVector(x, y);
    int total = vertices.size();
    if (total > 0) {
      PVector prev = vertices.get(total - 1);
      Edge edge = new Edge(prev, a);
      edges.add(edge);
    }
    vertices.add(a);
  }

  void close() {
    int total = vertices.size();
    PVector last = vertices.get(total - 1);
    PVector first = vertices.get(0);
    Edge edge = new Edge(last, first);
    edges.add(edge);
  }

  void hankin() {
    for (int i = 0; i < edges.size(); i++) {
      edges.get(i).hankin();
    }

    for (int i = 0; i < edges.size(); i++) {
      for (int j = 0; j < edges.size(); j++) {
        if (i != j) {
          edges.get(i).findEnds(edges.get(j));
        }
      }
    }
  }

  void show() {
    for (int i = 0; i < edges.size(); i++) {
      edges.get(i).show();
    }
  }
};
