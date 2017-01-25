#version 330

layout (location=0) in vec3 position;
layout (location=1) in vec2 texCoord;
layout (location=2) in vec3 vertexNormal;
layout (location=3) in mat4 modelViewInstancedMatrix;
layout (location=7) in vec2 texOffset;

out vec2 outTexCoord;

uniform mat4 projectionMatrix;

uniform int numCols;
uniform int numRows;


void main()
{
	gl_Position = projectionMatrix * modelViewInstancedMatrix * vec4(position, 1.0);

	// Support for texture atlas, update texture coordinates
	float x = (texCoord.x / numCols + texOffset.x);
	float y = (texCoord.y / numRows + texOffset.y);
	
	outTexCoord = vec2(x, y);
}
