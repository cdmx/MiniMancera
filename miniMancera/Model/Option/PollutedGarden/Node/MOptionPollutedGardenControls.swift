import SpriteKit

class MOptionPollutedGardenControls:SKNode
{
    private weak var controller:COptionPollutedGarden!
    
    init(controller:COptionPollutedGarden)
    {
        super.init()
        isUserInteractionEnabled = true
        index
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        print("touch")
    }
}
