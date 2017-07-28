import UIKit

class VOptionTamalesOaxaquenosPerspective:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private let positionX:CGFloat
    private let kAddPositionY:CGFloat = 56
    
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        model:MOptionTamalesOaxaquenosAreaPerspectiveItem)
    {
        positionX = model.positionX
        
        super.init(
            controller:controller,
            texture:model.texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
        
            let modelTexture:MGameTexture = self.modelTexture
        
        else
        {
            return
        }
        
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let height_2:CGFloat = modelTexture.height_2
        let positionY:CGFloat = sceneHeight_2 - height_2 + kAddPositionY
        position = CGPoint(x:positionX, y:positionY)
    }
}
