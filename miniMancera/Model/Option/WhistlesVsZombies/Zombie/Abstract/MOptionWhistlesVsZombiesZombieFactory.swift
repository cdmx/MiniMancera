import Foundation

extension MOptionWhistlesVsZombiesZombie
{
    class func factoryTypes(
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions) -> [MOptionWhistlesVsZombiesZombieItemProtocol]
    {
        let typeFootball:MOptionWhistlesVsZombiesZombieItemFootball = MOptionWhistlesVsZombiesZombieItemFootball(
            textures:textures,
            actions:actions)
        let typeCop:MOptionWhistlesVsZombiesZombieItemCop = MOptionWhistlesVsZombiesZombieItemCop(
            textures:textures,
            actions:actions)
        let typeSpeakers:MOptionWhistlesVsZombiesZombieItemSpeakers = MOptionWhistlesVsZombiesZombieItemSpeakers(
            textures:textures,
            actions:actions)
        
        let types:[MOptionWhistlesVsZombiesZombieItemProtocol] = [
            typeFootball,
            typeCop,
            typeSpeakers]
        
        return types
    }
    
    func factoryZombie() -> MOptionWhistlesVsZombiesZombieItem
    {
        let type:MOptionWhistlesVsZombiesZombieItemProtocol = randomType()
        let lane:MOptionWhistlesVsZombiesGroundLane = ground.randomLane()
        let item:MOptionWhistlesVsZombiesZombieItem = MOptionWhistlesVsZombiesZombieItem(
            type:type,
            lane:lane)
        
        return item
    }
    
    //MARK: private
    
    private func randomType() -> MOptionWhistlesVsZombiesZombieItemProtocol
    {
        let random:UInt32 = arc4random_uniform(countTypes)
        let randomInt:Int = Int(random)
        let type:MOptionWhistlesVsZombiesZombieItemProtocol = types[randomInt]
        
        return type
    }
}
