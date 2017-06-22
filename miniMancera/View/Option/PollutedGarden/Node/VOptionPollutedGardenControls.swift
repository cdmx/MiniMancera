import SpriteKit

class VOptionPollutedGardenControls:SKSpriteNode
{
    private var lastTouch:UITouch?
    private weak var controller:COptionPollutedGarden!
    private let kHeight:CGFloat = 250
    private let kZPosition:CGFloat = 999999
    
    init(controller:COptionPollutedGarden)
    {
        let sceneWidth:CGFloat = controller.model.size.width
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
