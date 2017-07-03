import Foundation

class MOptionWhistlesVsZombiesWhistle:MGameUpdate<MOptionWhistlesVsZombies>
{
    let types:[MOptionWhistlesVsZombiesWhistleType]
    let bases:[MOptionWhistlesVsZombiesWhistleBase]
    
    override init()
    {
        types = MOptionWhistlesVsZombiesWhistle.factoryTypes()
        bases = MOptionWhistlesVsZombiesWhistle.factoryBases()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        updateBases(scene:scene)
    }
    
    //MARK: private
    
    private func updateBases(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        for base:MOptionWhistlesVsZombiesWhistleBase in bases
        {
            let showBoard:Bool = base.showBoard()
            
            if showBoard
            {
                scene.controller.model.openBoardFor(base:base)
                
                break
            }
        }
    }
}
