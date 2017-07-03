import Foundation

class MOptionWhistlesVsZombiesWhistle:MGameUpdate<MOptionWhistlesVsZombies>
{
    let bases:[MOptionWhistlesVsZombiesWhistleBase]
    private(set) var types:[MOptionWhistlesVsZombiesWhistleType]
    
    override init()
    {
        types = []
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
    
    //MARK: public
    
    func factoryWithTextures(textures:MOptionWhistlesVsZombiesTextures)
    {
        types = MOptionWhistlesVsZombiesWhistle.factoryTypes(textures:textures)
    }
}
