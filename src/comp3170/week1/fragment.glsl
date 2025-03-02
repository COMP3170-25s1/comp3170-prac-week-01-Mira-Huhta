#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() {
   vec2 p = gl_FragCoord.xy / u_screenSize;   // scale p into range (0,0) to (1,1)
   
   //circle
   //float d = distance(p, vec2(0.3, 0.3));     // calculate distance to midpoint (was midpoint is now offset slightly)
	
	//square
	vec2 v = abs(p - vec2(0.5, 0.5));	//removing abs causes the square to be off-centered, 
	
	float m = max(v.x, v.y);   //max = square, min = plus, returns greater/lesser value (answer is x + y)
	float d = distance(v, vec2(0.5, 0.5));
	
  
   if (d < 0.5) {	// if d < 0.3 then circle diameter is 0.6
      o_colour = vec4(u_colour, 1);
   }
   else {
      o_colour = vec4(1,1,1,1); // was BLACK, now WHITE
   }
}