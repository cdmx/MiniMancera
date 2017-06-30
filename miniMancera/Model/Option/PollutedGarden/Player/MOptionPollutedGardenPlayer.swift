import Foundation

class MOptionPollutedGardenPlayer:MGameUpdate<MOptionPollutedGarden>
{
    weak var view:VOptionPollutedGardenPlayer?
    private var strategy:MGameStrategy<MOptionPollutedGardenPlayer, MOptionPollutedGarden>?
    
    override init()
    {
        super.init()
        strategy = MOptionPollutedGardenPlayerStrategyWait(model:self)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func activateGame()
    {
        strategy = MOptionPollutedGardenPlayerStrategyWalk(model:self)
    }
}
