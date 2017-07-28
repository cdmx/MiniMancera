import SpriteKit

class VOptionTamalesOaxaquenosControls:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private var touchWaiting:Bool
    
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        let size:CGSize = MGame.sceneSize
        touchWaiting = false
        
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
        position = CGPoint.zero
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        touchWaiting = true
    }
    
    //MARK: public
    
    func pendingTouch() -> Bool
    {
        if touchWaiting
        {
            touchWaiting = false
            
            return true
        }
        
        return false
    }
}
