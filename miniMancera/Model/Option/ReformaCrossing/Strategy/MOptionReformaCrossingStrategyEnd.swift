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
        model.contact.update(
            elapsedTime:elapsedTime)
        
        if let initialTime:TimeInterval = self.initialTime
        {
            let deltaTime:TimeInterval = elapsedTime - initialTime
            checkTimeout(deltaTime:deltaTime, scene:scene)
        }
        else
        {
            self.initialTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func checkTimeout(deltaTime:TimeInterval, scene:SKScene)
    {
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
    
    //MARK: public
    
    func timeOut(controller:COptionReformaCrossing)
    {
    }
}
