import SpriteKit

class VOptionPollutedGardenControls:ViewGameNode<MOptionPollutedGarden>
{
    private var lastTouch:UITouch?
    private let kHeight:CGFloat = 250
    
    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let size:CGSize = CGSize(width:sceneWidth, height:kHeight)
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionPollutedGardenZPosition.Controls.rawValue)
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let height_2:CGFloat = kHeight / 2.0
        position = CGPoint(x:sceneWidth_2, y:height_2)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        lastTouch = touches.first
    }
    
    //MARK: public
    
    func touchPositionX() -> CGFloat?
    {
        guard
            
            let lastTouch:UITouch = self.lastTouch,
            let parent:SKNode = self.parent
            
        else
        {
            return nil
        }
        
        let locationX:CGFloat = lastTouch.location(in:parent).x
        self.lastTouch = nil
        
        return locationX
    }
}
