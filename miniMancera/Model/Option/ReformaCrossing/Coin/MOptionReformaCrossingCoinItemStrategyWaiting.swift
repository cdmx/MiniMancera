import SpriteKit

class MOptionReformaCrossingCoinItemStrategyWaiting:MGameStrategy<
    MOptionReformaCrossingCoinItem,
    MOptionReformaCrossing>
{
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        guard
        
            let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
        
        else
        {
            return
        }
        
        let model:MOptionReformaCrossing = scene.controller.model
        let playerY:CGFloat = model.player.position.positionY
        
        if playerY > self.model.positionY
        {
            model.addCoin()
            scene.showCoin(coin:self.model)
            self.model.showCoin()
        }
    }
}
