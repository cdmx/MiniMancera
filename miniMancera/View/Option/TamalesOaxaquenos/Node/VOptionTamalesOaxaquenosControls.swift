import SpriteKit

class VOptionTamalesOaxaquenosControls:ViewGameNode<MOptionTamalesOaxaquenos>
{
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        let size:CGSize = MGame.sceneSize
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionTamalesOaxaquenosZPosition.Controls.rawValue)
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let width:CGFloat = MGame.sceneSize.width
        let height:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = width / 2.0
        let height_2:CGFloat = height / 2.0
        position = CGPoint(x:width_2, y:height_2)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        print("touch")
    }
}
