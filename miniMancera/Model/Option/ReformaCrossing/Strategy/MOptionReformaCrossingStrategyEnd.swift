import SpriteKit

class MOptionReformaCrossingStrategyEnd:MGameStrategy<MOptionReformaCrossing>
{
    private var initialTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    override func update(
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
    
    func keepAdvancing(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        model.laneGroup.update(
            elapsedTime:elapsedTime,
            scene:scene)
        model.foe.update(
            elapsedTime:elapsedTime,
            scene:scene)
        model.contact.update(
            elapsedTime:elapsedTime)
    }
    
    func timeOut(controller:COptionReformaCrossing)
    {
    }
}
