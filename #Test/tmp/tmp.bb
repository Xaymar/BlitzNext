Graphics3D 800,600,32,2
SetBuffer BackBuffer()

Cam = CreateCamera()
Cube = CreateCube()
MoveEntity(Cam, 0, 0, -5)

While Not KeyHit(1)
	TurnEntity Cube, 0.1, 0.1, 0.1
	
	RenderWorld
	Flip 0
Wend

EndGraphics
End