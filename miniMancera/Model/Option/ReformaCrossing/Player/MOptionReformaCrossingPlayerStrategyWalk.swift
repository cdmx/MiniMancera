import SpriteKit

class MOptionReformaCrossingPlayerStrategyWalk:MGameStrategy<MOptionReformaCrossingPlayer>
{
    private var elapsedTime:TimeInterval?
    private let kSpeed:CGFloat = 70
    
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        let isSafe:Bool = model.position.isSafe()
        
        if isSafe
        {
            
        }
        else
        {
            
        }
    }
}
