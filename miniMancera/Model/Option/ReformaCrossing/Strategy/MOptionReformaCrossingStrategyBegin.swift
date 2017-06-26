import Foundation

class MOptionReformaCrossingStrategyBegin:MOptionReformaCrossingStrategy
{
    private let kTimeout:TimeInterval = 1.5
    
    func update(elapsedTime:TimeInterval, scene:VOptionReformaCrossingScene, model:MOptionReformaCrossing)
    {
        if elapsedTime > kTimeout
        {
            model.activateGame()
            scene.activateGame()
        }
    }
}
