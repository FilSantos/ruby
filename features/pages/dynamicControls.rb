class DynamicControls < SitePrism::Page

    element :checkbox, "[label='blah']"
    element :botao, "[onclick='swapCheckbox()']"
    element :mensagem, "[id='message']"
end