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
        updateBases(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: private
    
    private func updateBases(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        for base:MOptionWhistlesVsZombiesWhistleBase in bases
        {
            base.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    //MARK: public
    
    func factoryWithTextures(textures:MOptionWhistlesVsZombiesTextures)
    {
        types = MOptionWhistlesVsZombiesWhistle.factoryTypes(textures:textures)
    }
}
