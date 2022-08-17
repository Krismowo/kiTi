void main(void)
{
    openfl_Alphav = openfl_Alpha;
    openfl_TextureCoordv = openfl_TextureCoord;

    if (openfl_HasColorTransform)
    {
        openfl_ColorMultiplierv = openfl_ColorMultiplier;
        openfl_ColorOffsetv = openfl_ColorOffset / 255.0;
    }

    gl_Position = openfl_Matrix * openfl_Position;

    openfl_Alphav = openfl_Alpha * alpha;		
    if (hasColorTransform)
    {
        openfl_ColorOffsetv = colorOffset / 255.0;
        openfl_ColorMultiplierv = colorMultiplier;
    }
}