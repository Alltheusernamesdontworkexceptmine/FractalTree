private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
  frameRate(10);
	size(640,480);    
	//noLoop(); 
} 

public void mouseDragged(){
stroke((float)(Math.random()/255), (float)(Math.random()+(255)), (float)(Math.random()-255));
smallestBranch = (int)(Math.random()*10);
}

public void draw() 
{ 
	fill(0,10);
  rect(0,0,width*2,height*2);
  //noStroke(); 
	stroke((float)(Math.random()*255), (float)(Math.random()-(255)), (float)(Math.random()*255));   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle2) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle1) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  stroke((float)(Math.random()*255), (float)(Math.random()-(255)), (float)(Math.random()*255));
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    stroke((float)(Math.random()*255), (float)(Math.random()-(255)), (float)(Math.random()*255));
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
}