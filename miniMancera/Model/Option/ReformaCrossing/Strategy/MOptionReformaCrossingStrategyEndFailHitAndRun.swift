import Foundation

class MOptionReformaCrossingStrategyEndFailHitAndRun:MOptionReformaCrossingStrategyEndFail
{
    init(model:MOptionReformaCrossing)
    {
        let gameOver:MOptionReformaCrossingGameOverHitAndRun = MOptionReformaCrossingGameOverHitAndRun()
        
        let updateItems:[MGameUpdate<MOptionReformaCrossing>] = [
            model.laneGroup,
            model.foe,
            model.contact]
        
        super.init(
            model:model,
            gameOver:gameOver,
            updateItems:updateItems)
    }
}
