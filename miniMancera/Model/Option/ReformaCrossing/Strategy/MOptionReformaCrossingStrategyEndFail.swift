import SpriteKit

class MOptionReformaCrossingStrategyEndFail:MOptionReformaCrossingStrategyEnd
{
    let gameOver:MOptionReformaCrossingGameOverProtocol?
    
    init(model:MOptionReformaCrossing, gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        self.gameOver = gameOver
        super.init(model:model)
    }
    
    required init(model:MOptionReformaCrossing)
    {
        gameOver = nil
        super.init(model:model)
    }
    
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        guard
            
            let gameOver:MOptionReformaCrossingGameOverProtocol = self.gameOver
            
        else
        {
            return
        }
        
        if gameOver.keepAdvancing
        {
            model.laneGroup.update(elapsedTime:elapsedTime)
        }
        
        super.update(elapsedTime:elapsedTime, scene:scene)
    }
    
    override func timeOut(controller:COptionReformaCrossing)
    {
        guard
            
            let gameOver:MOptionReformaCrossingGameOverProtocol = self.gameOver
        
        else
        {
            return
        }
        
        controller.showGameOver()
        
        let newScene:VOptionReformaCrossingSceneOver = VOptionReformaCrossingSceneOver(
            controller:controller,
            gameOver:gameOver)
        
        controller.presentScene(newScene:newScene)
    }
}
