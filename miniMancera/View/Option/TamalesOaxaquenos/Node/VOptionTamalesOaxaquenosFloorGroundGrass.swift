import UIKit

class VOptionTamalesOaxaquenosFloorGroundGrass:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private weak var viewGround:VOptionTamalesOaxaquenosFloorGround!
    private weak var viewGrass:VOptionTamalesOaxaquenosFloorGrass!
    private weak var model:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass!
    private let height_2:CGFloat
    private let groundPositionY:CGFloat
    private let grassPositionY:CGFloat
    
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        model:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass)
    {
        self.model = model
        
        let viewGround:VOptionTamalesOaxaquenosFloorGround = VOptionTamalesOaxaquenosFloorGround(
            controller:controller,
            model:model)
        self.viewGround = viewGround
        
        let viewGrass:VOptionTamalesOaxaquenosFloorGrass = VOptionTamalesOaxaquenosFloorGrass(
            controller:controller,
            model:model)
        self.viewGrass = viewGrass
        
        let textureGround:MGameTexture = model.textureGround
        let textureGrass:MGameTexture = model.textureGrass
        let width:CGFloat = textureGround.width
        let groundHeight:CGFloat = textureGround.height
        let grassHeight:CGFloat = textureGrass.height
        let height:CGFloat = groundHeight + grassHeight
        height_2 = height / 2.0
        groundPositionY = textureGround.height_2 - height_2
        grassPositionY = groundPositionY + textureGround.height_2 + textureGrass.height_2
        let size:CGSize = CGSize(width:width, height:height)
        
        super.init(
            controller:controller,
            size:size,
            zPosition:textureGround.zPosition)
        
        addChild(viewGround)
        addChild(viewGrass)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let positionX:CGFloat = model.positionX
        position = CGPoint(x:positionX, y:height_2)
        
        viewGround.position = CGPoint(x:0, y:groundPositionY)
        viewGrass.position = CGPoint(x:0, y:grassPositionY)
    }
}
