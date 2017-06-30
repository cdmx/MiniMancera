import SpriteKit

class MOptionReformaCrossingCoinItemStrategyWaiting:MGameStrategy<
    MOptionReformaCrossingCoinItem,
    MOptionReformaCrossing>
{
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        let model:MOptionReformaCrossing = scene.controller.model
        let playerY:CGFloat = model.player.position.positionY
        
        if playerY > self.model.positionY
        {
            model.addCoin()
            
            guard
                
                let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
                
            else
            {
                return
            }
            
            scene.showCoin(coin:self.model)
            self.model.showCoin()
        }
    }
}
