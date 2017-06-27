import SpriteKit

class MOptionReformaCrossingStrategyEnd:MOptionReformaCrossingStrategy
{
    private var initialTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    final func update(elapsedTime:TimeInterval, scene:SKScene, model:MOptionReformaCrossing)
    {
        if let initialTime:TimeInterval = self.initialTime
        {
            let deltaTime:TimeInterval = elapsedTime - initialTime
            
            if deltaTime > kWait
            {
                guard
                
                    let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
                
                else
                {
                    return
                }
                
                timeOut(scene:scene)
            }
        }
        else
        {
            initialTime = elapsedTime
        }
    }
    
    //MARK: public
    
    func timeOut(scene:VOptionReformaCrossingScene)
    {
    }
}
