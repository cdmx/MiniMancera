import Foundation

class MOptionReformaCrossingStrategyEndFailTimeOut:MOptionReformaCrossingStrategyEndFail
{
    init(model:MOptionReformaCrossing)
    {
        let gameOver:MOptionReformaCrossingGameOverTimeOut = MOptionReformaCrossingGameOverTimeOut()
        
        super.init(
            model:model,
            gameOver:gameOver,
            updateItems:[])
    }
}
