#include "ShaderConstants.fxh"

struct VS_Input
{
    float3 position : POSITION;
    float4 color : COLOR;
};


struct PS_Input
{
    float4 position : SV_Position;
    float4 color : COLOR;
};

static const float fogNear = 0.9;

static const float3 inverseLightDirection = float3( 0.62, 0.78, 0.0 );
static const float ambient = 0.7;

void main( in VS_Input VSInput, out PS_Input PSInput )
{
    PSInput.position = mul( WORLDVIEWPROJ, float4( VSInput.position, 1 ) );

    PSInput.color = VSInput.color * CURRENT_COLOR;

    float depth = PSInput.position.z / RENDER_DISTANCE;
    float fog = max( depth - fogNear, 0.0 );

    PSInput.color.a *= 1.0 - fog;
}