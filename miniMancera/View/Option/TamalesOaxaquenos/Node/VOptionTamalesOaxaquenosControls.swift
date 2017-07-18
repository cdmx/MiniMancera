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
        color = UIColor(red:1, green:0, blue:0, alpha:0.5)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        position = CGPoint.zero
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        print("touch")
    }
}
