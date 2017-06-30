import Foundation

class MOptionReformaCrossingStrategyEndSuccess:MOptionReformaCrossingStrategyEnd
{
    init(model:MOptionReformaCrossing)
    {
        let updateItems:[MGameUpdate<MOptionReformaCrossing>] = [
            model.laneGroup,
            model.foe,
            model.contact]
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func timeOut(controller:COptionReformaCrossing)
    {
        controller.nextLevel()
    }
}
