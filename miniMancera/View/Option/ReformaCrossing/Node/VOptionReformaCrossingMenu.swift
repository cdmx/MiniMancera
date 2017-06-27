import SpriteKit

class VOptionReformaCrossingMenu:ViewGameNode<MOptionReformaCrossing>
{
    private let kMargin:CGFloat = 45
    
    override init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let texture:MGameTexture = controller.model.textures.menu
        
        super.init(
            controller:controller,
            texture:texture.texture,
            size:texture.size,
            zPosition:MOptionReformaCrossingZPosition.Menu.rawValue)
        isUserInteractionEnabled = true
        alpha = 0
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        if controller.model.gameActive
        {
            controller.stopTimer()
            controller.showMenu()
        }
    }
    
    //MARK: private
    /*
    private func startPosition() -> CGPoint
    {
        let sceneHeight:CGFloat = controller.model.size.height
        let sizeWidth_2:CGFloat = size.width / 2.0
        let posY:CGFloat = sceneHeight - kMargin
        let point:CGPoint = CGPoint(x:sizeWidth_2, y:posY)
        
        return point
    }*/
}
