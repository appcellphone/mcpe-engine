#include "ShaderConstants.fxh"

struct VS_Input
{
    float4 position : POSITION;
    float4 color : COLOR;
};


struct PS_Input
{
    float4 position : SV_Position;
    float4 color : COLOR;
};


void main( in VS_Input VSInput, out PS_Input PSInput )
{
    PSInput.color = VSInput.color;
    PSInput.position = mul( WORLDVIEWPROJ, VSInput.position );
}