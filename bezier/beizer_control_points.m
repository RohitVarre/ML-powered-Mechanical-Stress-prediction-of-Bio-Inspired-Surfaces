x=abs(sort(rand(2,1)));
x=[0; x ;1];
y=abs(rand(4,1))*2;
feval('cubic_bezier',x,y,500); 


