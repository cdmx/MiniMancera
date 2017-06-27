import SpriteKit

class MOptionReformaCrossingStrategyEnd:MOptionReformaCrossingStrategy
{
    private(set) var model:MOptionReformaCrossing!
    private var initialTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    required init(model:MOptionReformaCrossing)
    {
        self.model = model
    }
    
    func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        if let initialTime:TimeInterval = self.initialTime
        {
            let deltaTime:TimeInterval = elapsedTime - initialTime
            
            if deltaTime > kWait
            {
                guard
                
                    let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene,
                    let controller:COptionReformaCrossing = scene.controller as? COptionReformaCrossing
                
                else
                {
                    return
                }
                
                timeOut(controller:controller)
            }
        }
        else
        {
            self.initialTime = elapsedTime
        }
    }
    
    //MARK: public
    
    func timeOut(controller:COptionReformaCrossing)
    {
    }
}
