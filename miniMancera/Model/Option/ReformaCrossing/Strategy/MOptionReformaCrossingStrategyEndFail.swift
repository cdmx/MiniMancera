import SpriteKit

class MOptionReformaCrossingStrategyEndFail:MOptionReformaCrossingStrategyEnd
{
    private let gameOver:MOptionReformaCrossingGameOverProtocol
    
    init(model:MOptionReformaCrossing, gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        self.gameOver = gameOver
        super.init(model:model, keepAdvancing:gameOver.keepAdvancing)
    }
    
    override func timeOut(controller:COptionReformaCrossing)
    {
        controller.showGameOver()
        
        let newScene:VOptionReformaCrossingSceneOver = VOptionReformaCrossingSceneOver(
            controller:controller,
            gameOver:gameOver)
        
        controller.presentScene(newScene:newScene)
    }
}
