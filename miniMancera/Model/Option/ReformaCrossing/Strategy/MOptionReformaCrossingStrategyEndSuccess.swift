import SpriteKit

class MOptionReformaCrossingStrategyEndSuccess:MOptionReformaCrossingStrategyEnd
{
    private let kKeepAdvancing:Bool = true
    
    init(model:MOptionReformaCrossing)
    {
        super.init(model:model, keepAdvancing:kKeepAdvancing)
    }
    
    override func timeOut(controller:COptionReformaCrossing)
    {
        controller.nextLevel()
    }
}
