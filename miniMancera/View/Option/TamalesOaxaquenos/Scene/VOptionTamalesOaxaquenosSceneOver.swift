import UIKit

class VOptionTamalesOaxaquenosSceneOver:ViewGameScene<MOptionTamalesOaxaquenos>
{
    required init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        super.init(controller:controller)
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryNodes()
    {
        let textures:MOptionTamalesOaxaquenosTextures = controller.model.textures
        
        let info:ViewGameNodeGameOverInfo = ViewGameNodeGameOverInfo(
            title:String.localizedTamalesOaxaquenos(
                key:"VOptionTamalesOaxaquenosSceneOver_infoTitle"),
            descr:String.localizedTamalesOaxaquenos(
                key:"VOptionTamalesOaxaquenosSceneOver_infoDescr"),
            zPosition:MOptionTamalesOaxaquenosZPosition.GameOverInfo.rawValue)
        
        let title1up:ViewGameNodeGameOverTitle1up = ViewGameNodeGameOverTitle1up(
            text:String.localizedTamalesOaxaquenos(
                key:"VOptionTamalesOaxaquenosSceneOver_1up"),
            zPosition:MOptionTamalesOaxaquenosZPosition.GameOverTitle1up.rawValue)
        
        let titleExit:ViewGameNodeGameOverTitleExit = ViewGameNodeGameOverTitleExit(
            text:String.localizedTamalesOaxaquenos(
                key:"VOptionTamalesOaxaquenosSceneOver_exit"),
            zPosition:MOptionTamalesOaxaquenosZPosition.GameOverTitleExit.rawValue)
        
        let button1up:ViewGameNodeGameOver1up<MOptionTamalesOaxaquenos> = ViewGameNodeGameOver1up<MOptionTamalesOaxaquenos>(
            controller:controller,
            texture:textures.gameOver1up)
        
        let buttonExit:ViewGameNodeGameOverExit<MOptionTamalesOaxaquenos> = ViewGameNodeGameOverExit<MOptionTamalesOaxaquenos>(
            controller:controller,
            texture:textures.gameOverExit)
        
        addChild(info)
        addChild(title1up)
        addChild(titleExit)
        addChild(button1up)
        addChild(buttonExit)
    }
}
