import SpriteKit

class MOptionReformaCrossingPlayerStrategyWalk:MGameStrategy<
    MOptionReformaCrossingPlayer,
    MOptionReformaCrossing>
{
    private var lastElapsedTime:TimeInterval?
    private let kSpeed:CGFloat = 70
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        let isSafe:Bool = model.position.isSafe()
        
        if isSafe
        {
            success(scene:scene)
        }
        else
        {
            if let lastElapsedTime:TimeInterval = self.lastElapsedTime
            {
                let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
                let move:CGFloat = CGFloat(deltaTime) * kSpeed
                let point:CGPoint = model.position.walk(distance:move)
                model.view?.position = point
            }
            else
            {
                model.view?.animateWalk()
            }
            
            lastElapsedTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func success(scene:ViewGameScene<MOptionReformaCrossing>)
    {
        let model:MOptionReformaCrossing = scene.controller.model
        model.playerSuccess()
        
        let soundVictory:SKAction = model.sounds.soundVictory
        scene.controller.playSound(actionSound:soundVictory)
    }
}
