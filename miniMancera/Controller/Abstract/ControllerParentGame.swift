import UIKit
import GameKit

extension ControllerParent:GKGameCenterControllerDelegate
{
    //MARK: private
    
    private func gameControllerAuthHandler(controller:UIViewController?, error:Error?)
    {
        if let controller:UIViewController = controller
        {
            
        }
        else if let error:Error = error
        {
            
        }
    }
    
    //MARK: notifications
    
    func notifiedEnterForeground(sender notification:Notification)
    {
        let localPlayer:GKLocalPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = gameControllerAuthHandler(controller:error:)
    }
    
    //MARK: game delegate
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController:GKGameCenterViewController)
    {
        
    }
}
