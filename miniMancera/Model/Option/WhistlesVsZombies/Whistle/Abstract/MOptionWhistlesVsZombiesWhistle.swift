import Foundation

class MOptionWhistlesVsZombiesWhistle:MGameUpdate<MOptionWhistlesVsZombies>
{
    let bases:[MOptionWhistlesVsZombiesWhistleBase]
    let types:[MOptionWhistlesVsZombiesWhistleTypeProtocol]
    
    init(
        area:MOptionWhistlesVsZombiesArea,
        textures:MOptionWhistlesVsZombiesTextures)
    {
        bases = MOptionWhistlesVsZombiesWhistle.factoryBases(area:area)
        types = MOptionWhistlesVsZombiesWhistle.factoryTypes(textures:textures)
        super.init()
    }
    
    override func update(
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
    
    func restart()
    {
        for base:MOptionWhistlesVsZombiesWhistleBase in bases
        {
            base.restart()
        }
    }
}
