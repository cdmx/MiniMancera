import UIKit

class VOptionTamalesOaxaquenosFloorGroundGullyStart:VOptionTamalesOaxaquenosFloor
{
    private weak var viewGround:VOptionTamalesOaxaquenosFloorGround!
    private weak var viewGully:VOptionTamalesOaxaquenosFloorGullyStart!
    private let positionX:CGFloat
    private let height_2:CGFloat
    private let groundPositionY:CGFloat
    private let gullyPositionY:CGFloat
    private let kVerticalAlign:CGFloat = 150
    private let kGroundXPosition:CGFloat = -10
    
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        model:MOptionTamalesOaxaquenosAreaFloorItemGroundGullyStart)
    {
        positionX = model.positionX
        
        let viewGround:VOptionTamalesOaxaquenosFloorGround = VOptionTamalesOaxaquenosFloorGround(
            controller:controller,
            model:model)
        self.viewGround = viewGround
        
        let viewGully:VOptionTamalesOaxaquenosFloorGullyStart = VOptionTamalesOaxaquenosFloorGullyStart(
            controller:controller)
        self.viewGully = viewGully
        
        let textureGround:MGameTexture = model.textureGround
        let width:CGFloat = textureGround.width
        let groundHeight:CGFloat = textureGround.height
        let gullyHeight:CGFloat = viewGully.size.height
        let gullyHeight_2:CGFloat = gullyHeight / 2.0
        let height:CGFloat = groundHeight + gullyHeight
        height_2 = height / 2.0
        groundPositionY = textureGround.height_2 - height_2
        gullyPositionY = groundPositionY + textureGround.height_2 + gullyHeight_2
        let size:CGSize = CGSize(width:width, height:height)
        
        super.init(controller:controller, size:size)
        
        addChild(viewGround)
        addChild(viewGully)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = sceneHeight_2 - (kVerticalAlign + height_2)
        position = CGPoint(x:positionX, y:positionY)
        
        viewGround.position = CGPoint(x:kGroundXPosition, y:groundPositionY)
        viewGully.position = CGPoint(x:0, y:gullyPositionY)
    }
}
