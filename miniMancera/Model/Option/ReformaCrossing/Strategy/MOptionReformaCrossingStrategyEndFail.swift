import Foundation

class MOptionReformaCrossingStrategyEndFail:MOptionReformaCrossingStrategyEnd
{
    private let gameOver:MOptionReformaCrossingGameOverProtocol
    
    init(
        model:MOptionReformaCrossing,
        gameOver:MOptionReformaCrossingGameOverProtocol,
        updateItems:[MGameUpdate<MOptionReformaCrossing>])
    {
        self.gameOver = gameOver
        super.init(
            model:model,
            updateItems:updateItems)
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
