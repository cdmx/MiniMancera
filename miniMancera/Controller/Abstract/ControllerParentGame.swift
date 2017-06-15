import UIKit
import GameKit

extension ControllerParent:GKGameCenterControllerDelegate
{
    //MARK: private
    
    private func gameControllerAuthHandler(controller:UIViewController?, error:Error?)
    {
        guard
        
            let controller:UIViewController = controller
        
        else
        {
            return
        }
        
        present(controller, animated:false, completion:nil)
    }
    
    //MARK: notifications
    
    func notifiedEnterForeground(sender notification:Notification)
    {
        let localPlayer:GKLocalPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = gameControllerAuthHandler(controller:error:)
    }
    
    //MARK: public
    
    func gameLeaderBoards()
    {
        let controller:GKGameCenterViewController = GKGameCenterViewController()
        present(controller, animated:true)
        { [weak self] in
            
            guard
                
                let strongSelf:ControllerParent = self
            
            else
            {
                return
            }
            
            controller.gameCenterDelegate = strongSelf
            controller.leaderboardTimeScope = GKLeaderboardTimeScope.allTime
            controller.viewState = GKGameCenterViewControllerState.leaderboards
        }
    }
    
    //MARK: game delegate
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController:GKGameCenterViewController)
    {
        
    }
}
