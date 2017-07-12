import Foundation

class MOptionWhistlesVsZombiesPlayerStrategyAlive:MGameStrategy<
    MOptionWhistlesVsZombiesPlayer,
    MOptionWhistlesVsZombies>
{
    private var lastElapsedTime:TimeInterval?
    private let kChangeRatio:UInt32 = 60
    private let kWaitTime:TimeInterval = 0.2
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            if deltaTime > kWaitTime
            {
                self.lastElapsedTime = elapsedTime
                
                tryChange()
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
            updateTexture(scene:scene)
        }
    }
    
    //MARK: private
    
    private func tryChange()
    {
        let random:UInt32 = arc4random_uniform(kChangeRatio)
        
        switch random
        {
        case 0:
            
            model.stand()
            
            break
            
        case 1:
            
            model.sweat()
            
            break
            
        case 2:
            
            model.shut()
            
            break
            
        case 3:
            
            model.scared()
            
            break
            
        default:
            break
        }
    }
    
    //MARK: public
    
    func updateTexture(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
    }
}
