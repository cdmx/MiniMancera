import UIKit

extension MOptionWhistlesVsZombiesTextures
{
    class func factorySonicReleaseAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease2"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease3"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease4"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicRelease5")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    class func factorySonicBoomAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom2"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom3"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicBoom4")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    class func factorySonicCollisionAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision2"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision3"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision4"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesSonicCollision5")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    class func factoryFootballWalkingAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballWalking0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballWalking1")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
    
    class func factoryFootballDefeatedAnimated() -> MGameTextureAnimated
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballDefeated0"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballDefeated1"),
            #imageLiteral(resourceName: "assetWhistlesVsZombiesZombieFootballDefeated2")]
        
        let texture:MGameTextureAnimated = MGameTextureAnimated(
            images:images)
        
        return texture
    }
}
