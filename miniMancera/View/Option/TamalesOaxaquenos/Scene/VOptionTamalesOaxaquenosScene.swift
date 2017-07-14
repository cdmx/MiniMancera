import Foundation

class VOptionTamalesOaxaquenosScene:ViewGameScene<MOptionTamalesOaxaquenos>
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
        factoryArea()
    }
    
    private func factoryArea()
    {
        let area:MOptionTamalesOaxaquenosArea = controller.model.area
        
        for item:MOptionTamalesOaxaquenosAreaItemProtocol in area.items
        {
            
        }
    }
}
