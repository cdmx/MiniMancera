import SpriteKit

class MOptionPollutedGardenControls:MGameUpdateProtocol
{
    weak var view:VOptionPollutedGardenControls?
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        guard
        
            let positionX:CGFloat = view?.touchPositionX()
        
        else
        {
            return
        }
    }
}
