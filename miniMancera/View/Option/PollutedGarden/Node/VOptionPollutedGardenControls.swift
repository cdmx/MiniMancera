import SpriteKit

class VOptionPollutedGardenControls:ViewGameNode<MOptionPollutedGarden>
{
    private var lastTouch:UITouch?
    private let kHeight:CGFloat = 250
    
    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        super.init(controller: <#T##ControllerGame<MOptionPollutedGarden>#>)
    }
    
    init(controller:COptionPollutedGarden)
    {
        let sceneWidth:CGFloat = 0//controller.model.size.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let size:CGSize = CGSize(width:sceneWidth, height:kHeight)
        let height_2:CGFloat = kHeight / 2.0
        
        super.init(texture:nil, color:UIColor.clear, size:size)
        isUserInteractionEnabled = true
        zPosition = kZPosition
        position = CGPoint(x:sceneWidth_2, y:height_2)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        lastTouch = touches.first
    }
    
    //MARK: public
    
    func lastTouchPositionX() -> CGFloat?
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
