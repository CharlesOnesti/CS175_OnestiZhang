#version 150

uniform mat4 uProjMatrix;
uniform mat4 uModelViewMatrix;
uniform mat4 uNormalMatrix;

in vec3 aPosition;
in vec3 aNormal;
in vec2 aTexCoord;

out vec3 vNormal;
out vec3 vPosition;
out vec2 vTexCoord;

void main() {
    vTexCoord = aTexCoord;
    vNormal = vec3(uNormalMatrix * vec4(aNormal, 0.0));

    // send position (eye coordinates) to fragment shader
    vec4 tPosition = uModelViewMatrix * vec4(aPosition, 1.0);
    vPosition = vec3(tPosition);
    gl_Position = uProjMatrix * tPosition;
}
